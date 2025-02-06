import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:permission_handler/permission_handler.dart';

// import 'config/agora_config.dart' as config;
import 'config/agora_config.dart';
import 'config/log_sink.dart';

/// JoinChannelAudio Example
class JoinChannelAudio extends StatefulWidget {
  /// Construct the [JoinChannelAudio]
  const JoinChannelAudio({super.key, required String title});

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<JoinChannelAudio> {
  late final RtcEngine _engine;
  String channelId = 'rosanatravel'; // Set default channel ID
  final String _selectedUid = '';
  bool isLoading = true;
  String errorMessage = '';
  bool isJoined = false,
      openMicrophone = true,
      muteMicrophone = false,
      muteAllRemoteAudio = false,
      enableSpeakerphone = true,
      playEffect = false;
  bool _isSetDefaultAudioRouteToSpeakerphone = false;
  bool _enableInEarMonitoring = false;
  double _recordingVolume = 100,
      _playbackVolume = 100,
      _inEarMonitoringVolume = 100;
  late TextEditingController _controller;
  late final TextEditingController _selectedUidController;
  ChannelProfileType _channelProfileType =
      ChannelProfileType.channelProfileLiveBroadcasting;
  late final RtcEngineEventHandler _rtcEngineEventHandler;
  bool _showAdvancedSettings =
      false; // New state to control visibility of advanced settings

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: channelId);
    _selectedUidController = TextEditingController(text: _selectedUid);
    _initializeAgoraConfig();
  }

  Future<void> _initializeAgoraConfig() async {
    setState(() {
      isLoading = true;
      errorMessage = '';
    });

    try {
      await AgoraConfig.initialize();
      setState(() {
        channelId = AgoraConfig.channelId;
        isLoading = false;
      });
      _initEngine();
    } catch (e) {
      setState(() {
        isLoading = false;
        errorMessage = 'Failed to load Agora config: $e';
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    _dispose();
  }

  Future<void> _dispose() async {
    _engine.unregisterEventHandler(_rtcEngineEventHandler);
    await _engine.leaveChannel();
    await _engine.release();
  }

  Future<void> _initEngine() async {
    _engine = createAgoraRtcEngine();
    await _engine.initialize(RtcEngineContext(appId: AgoraConfig.appId));

    _rtcEngineEventHandler = RtcEngineEventHandler(
      onError: (ErrorCodeType err, String msg) {
        logSink.log('[onError] err: $err, msg: $msg');
      },
      onJoinChannelSuccess: (RtcConnection connection, int elapsed) {
        logSink.log(
          '[onJoinChannelSuccess] connection: ${connection.toJson()} elapsed: $elapsed',
        );
        setState(() {
          isJoined = true;
        });
      },
      onRemoteAudioStateChanged: (
        RtcConnection connection,
        int remoteUid,
        RemoteAudioState state,
        RemoteAudioStateReason reason,
        int elapsed,
      ) {
        logSink.log(
          '[onRemoteAudioStateChanged] connection: ${connection.toJson()} remoteUid: $remoteUid state: $state reason: $reason elapsed: $elapsed',
        );
      },
      onLeaveChannel: (RtcConnection connection, RtcStats stats) {
        logSink.log(
          '[onLeaveChannel] connection: ${connection.toJson()} stats: ${stats.toJson()}',
        );
        setState(() {
          isJoined = false;
        });
      },
      onAudioRoutingChanged: (routing) {
        logSink.log('[onAudioRoutingChanged] routing: $routing');
      },
    );

    _engine.registerEventHandler(_rtcEngineEventHandler);

    await _engine.enableAudio();
    await _engine.setClientRole(role: ClientRoleType.clientRoleBroadcaster);
    await _engine.setAudioProfile(
      profile: AudioProfileType.audioProfileDefault,
      scenario: AudioScenarioType.audioScenarioGameStreaming,
    );
  }

  _joinChannel() async {
    if (defaultTargetPlatform == TargetPlatform.android) {
      await Permission.microphone.request();
    }

    await _engine.joinChannel(
      token: AgoraConfig.token,
      channelId: _controller.text,
      uid: AgoraConfig.uid,
      options: ChannelMediaOptions(
        channelProfile: _channelProfileType,
        clientRoleType: ClientRoleType.clientRoleBroadcaster,
      ),
    );
  }

  _leaveChannel() async {
    await _engine.leaveChannel();
    setState(() {
      isJoined = false;
      openMicrophone = true;
      muteMicrophone = false;
      muteAllRemoteAudio = false;
      enableSpeakerphone = true;
      playEffect = false;
      _enableInEarMonitoring = false;
      _recordingVolume = 100;
      _playbackVolume = 100;
      _inEarMonitoringVolume = 100;
    });
  }

  _switchMicrophone() async {
    await _engine.enableLocalAudio(!openMicrophone);
    setState(() {
      openMicrophone = !openMicrophone;
    });
  }

  _muteLocalAudioStream() async {
    await _engine.muteLocalAudioStream(!muteMicrophone);
    setState(() {
      muteMicrophone = !muteMicrophone;
    });
  }

  _muteAllRemoteAudioStreams() async {
    await _engine.muteAllRemoteAudioStreams(!muteAllRemoteAudio);
    setState(() {
      muteAllRemoteAudio = !muteAllRemoteAudio;
    });
  }

  _switchSpeakerphone() async {
    await _engine.setEnableSpeakerphone(!enableSpeakerphone);
    setState(() {
      enableSpeakerphone = !enableSpeakerphone;
    });
  }

  _onChangeInEarMonitoringVolume(double value) async {
    _inEarMonitoringVolume = value;
    await _engine.setInEarMonitoringVolume(_inEarMonitoringVolume.toInt());
    setState(() {});
  }

  _toggleInEarMonitoring(value) async {
    try {
      await _engine.enableInEarMonitoring(
        enabled: value,
        includeAudioFilters: EarMonitoringFilterType.earMonitoringFilterNone,
      );
      _enableInEarMonitoring = value;
      setState(() {});
    } catch (e) {
      // Do nothing
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (errorMessage.isNotEmpty) {
      return Center(child: Text(errorMessage));
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Rosana EarHajj App'),
        backgroundColor: Color.fromRGBO(245, 255, 250, 1),
      ),
      body: Container(
        decoration: BoxDecoration(color: Color.fromRGBO(245, 255, 250, 1)),
        child: Center(
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Visibility(
                    visible: false, // Hide TextField
                    child: TextField(
                      controller: _controller,
                      decoration: const InputDecoration(hintText: 'Channel ID'),
                    ),
                  ),
                  Visibility(
                    visible: false, // Hide DropdownButton
                    child: DropdownButton<ChannelProfileType>(
                      items:
                          [
                                ChannelProfileType
                                    .channelProfileLiveBroadcasting,
                                ChannelProfileType.channelProfileCommunication,
                              ]
                              .map(
                                (e) => DropdownMenuItem(
                                  value: e,
                                  child: Text(e.toString().split('.')[1]),
                                ),
                              )
                              .toList(),
                      value: _channelProfileType,
                      onChanged:
                          isJoined
                              ? null
                              : (v) {
                                setState(() {
                                  _channelProfileType = v!;
                                });
                              },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 18.0),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: GestureDetector(
                            onTap: isJoined ? _leaveChannel : _joinChannel,
                            child: Container(
                              width: 200, // Sesuaikan ukuran tombol
                              height: 200,
                              decoration: BoxDecoration(
                                color:
                                    isJoined
                                        ? Colors.green
                                        : Colors
                                            .grey, // Warna berubah sesuai status
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: SvgPicture.asset(
                                  'assets/svg/menu_utama/headset.svg',
                                  width: 100, // Sesuaikan ukuran ikon
                                  height: 100,
                                  color:
                                      Colors
                                          .white, // Ikon tetap berwarna putih agar kontras
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 0,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _showAdvancedSettings = !_showAdvancedSettings;
                          });
                        },
                        child: Text(
                          _showAdvancedSettings
                              ? 'Hide Settings'
                              : 'Show Settings',
                        ),
                      ),
                      Visibility(
                        visible: _showAdvancedSettings,
                        child: Column(
                          children: [
                            ElevatedButton(
                              onPressed: _switchMicrophone,
                              child: Text(
                                'Microphone ${openMicrophone ? 'on' : 'off'}',
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                _isSetDefaultAudioRouteToSpeakerphone =
                                    !_isSetDefaultAudioRouteToSpeakerphone;
                                _engine.setDefaultAudioRouteToSpeakerphone(
                                  _isSetDefaultAudioRouteToSpeakerphone,
                                );
                                setState(() {});
                              },
                              child: Text(
                                !_isSetDefaultAudioRouteToSpeakerphone
                                    ? 'SetDefaultAudioRouteToSpeakerphone'
                                    : 'UnsetDefaultAudioRouteToSpeakerphone',
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                const Text('RecordingVolume:'),
                                Slider(
                                  value: _recordingVolume,
                                  min: 0,
                                  max: 400,
                                  divisions: 5,
                                  label: 'RecordingVolume',
                                  onChanged:
                                      isJoined
                                          ? (double value) async {
                                            setState(() {
                                              _recordingVolume = value;
                                            });
                                            await _engine
                                                .adjustRecordingSignalVolume(
                                                  value.toInt(),
                                                );
                                          }
                                          : null,
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                const Text('PlaybackVolume:'),
                                Slider(
                                  value: _playbackVolume,
                                  min: 0,
                                  max: 400,
                                  divisions: 5,
                                  label: 'PlaybackVolume',
                                  onChanged:
                                      isJoined
                                          ? (double value) async {
                                            setState(() {
                                              _playbackVolume = value;
                                            });
                                            await _engine
                                                .adjustPlaybackSignalVolume(
                                                  value.toInt(),
                                                );
                                          }
                                          : null,
                                ),
                              ],
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Text('InEar Monitoring Volume:'),
                                    Switch(
                                      value: _enableInEarMonitoring,
                                      onChanged:
                                          isJoined
                                              ? _toggleInEarMonitoring
                                              : null,
                                      activeTrackColor: Colors.grey[350],
                                      activeColor: Colors.white,
                                    ),
                                  ],
                                ),
                                if (_enableInEarMonitoring)
                                  SizedBox(
                                    width: 300,
                                    child: Slider(
                                      value: _inEarMonitoringVolume,
                                      min: 0,
                                      max: 100,
                                      divisions: 5,
                                      label:
                                          'InEar Monitoring Volume $_inEarMonitoringVolume',
                                      onChanged:
                                          isJoined
                                              ? _onChangeInEarMonitoringVolume
                                              : null,
                                    ),
                                  ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
