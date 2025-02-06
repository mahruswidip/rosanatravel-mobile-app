import 'package:flutter/material.dart';
import 'package:adhan/adhan.dart';
import 'package:line_icons/line_icons.dart';
import 'package:location/location.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';

import 'qiblah.dart';

class Sholat extends StatefulWidget {
  const Sholat({super.key});

  @override
  State<Sholat> createState() => _SholatState();
}

class _SholatState extends State<Sholat> {
  Location location = Location();

  LocationData? _currentPosition;
  double? latitude, longitude;

  getLoc() async {
    bool serviceEnabled;
    PermissionStatus permissionGranted;
    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }
    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
    _currentPosition = await location.getLocation();
    latitude = _currentPosition!.latitude;
    longitude = _currentPosition!.longitude;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Sholat'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0, top: 8),
            child: Column(
              children: [
                IconButton(
                  color: Colors.black87,
                  iconSize: 25,
                  icon: const Icon(Icons.explore),
                  tooltip: 'Arah Kiblat',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Qiblah()),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      body: FutureBuilder(
        future: getLoc(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Shimmer.fromColors(
              baseColor: const Color.fromARGB(255, 192, 192, 192),
              highlightColor: const Color.fromARGB(255, 223, 223, 223),
              child: Container(
                width: double.infinity,
                height: 200.0,
                color: Colors.white,
              ),
            );
          }
          final myCoordinates = Coordinates(latitude!, longitude!);
          final params = CalculationMethod.umm_al_qura.getParameters();
          params.madhab = Madhab.hanafi;
          final prayerTimes = PrayerTimes.today(myCoordinates, params);

          showMoth(int month) {
            if (month == 1) {
              return 'Januari';
            } else if (month == 2) {
              return 'Februari';
            } else if (month == 3) {
              return 'Maret';
            } else if (month == 4) {
              return 'April';
            } else if (month == 5) {
              return 'Mei';
            } else if (month == 6) {
              return 'Juni';
            } else if (month == 7) {
              return 'Juli';
            } else if (month == 8) {
              return 'Agustus';
            } else if (month == 9) {
              return 'September';
            } else if (month == 10) {
              return 'Oktober';
            } else if (month == 11) {
              return 'November';
            } else if (month == 12) {
              return 'Desember';
            } else {
              return 'BULAN';
            }
          }

          return SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 15.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          const Icon(LineIcons.calendar),
                          const SizedBox(width: 5.0),
                          Text(
                            '${DateTime.now().day} ${showMoth(DateTime.now().month)} ${DateTime.now().year}',
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 15.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${DateTime.now().hour}:${DateTime.now().minute}',
                      style: const TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                    Text(
                      DateTime.now().timeZoneName,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Stack(
                    children: [
                      Positioned(
                        child: Image.asset(
                          'assets/sholat/bg2.png',
                          width: MediaQuery.of(context).size.width,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 150),
                        child: Material(
                          borderRadius: BorderRadius.circular(20.0),
                          elevation: 0,
                          child: Container(
                            margin: const EdgeInsets.only(top: 8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.5),
                            ),
                            child: Column(
                              children: [
                                ListTile(
                                  leading: const Icon(LineIcons.clock),
                                  title: const Text(
                                    'Subuh',
                                    style: TextStyle(color: Colors.orange),
                                  ),
                                  trailing: Text(
                                    style: const TextStyle(
                                      color: Colors.black87,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16.0,
                                    ),
                                    DateFormat.jm().format(prayerTimes.fajr),
                                  ),
                                ),
                                ListTile(
                                  leading: const Icon(LineIcons.clock),
                                  title: const Text(
                                    'Terbit',
                                    style: TextStyle(color: Colors.orange),
                                  ),
                                  trailing: Text(
                                    style: const TextStyle(
                                      color: Colors.black87,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16.0,
                                    ),
                                    DateFormat.jm().format(prayerTimes.sunrise),
                                  ),
                                ),
                                ListTile(
                                  leading: const Icon(LineIcons.clock),
                                  title: const Text(
                                    'Dzuhur',
                                    style: TextStyle(color: Colors.orange),
                                  ),
                                  trailing: Text(
                                    style: const TextStyle(
                                      color: Colors.black87,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16.0,
                                    ),
                                    DateFormat.jm().format(prayerTimes.dhuhr),
                                  ),
                                ),
                                ListTile(
                                  leading: const Icon(LineIcons.clock),
                                  title: const Text(
                                    'Ashar',
                                    style: TextStyle(color: Colors.orange),
                                  ),
                                  trailing: Text(
                                    style: const TextStyle(
                                      color: Colors.black87,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16.0,
                                    ),
                                    DateFormat.jm().format(prayerTimes.asr),
                                  ),
                                ),
                                ListTile(
                                  leading: const Icon(LineIcons.clock),
                                  title: const Text(
                                    'Maghrib',
                                    style: TextStyle(color: Colors.orange),
                                  ),
                                  trailing: Text(
                                    style: const TextStyle(
                                      color: Colors.black87,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16.0,
                                    ),
                                    DateFormat.jm().format(prayerTimes.maghrib),
                                  ),
                                ),
                                ListTile(
                                  leading: const Icon(LineIcons.clock),
                                  title: const Text(
                                    'Isya',
                                    style: TextStyle(color: Colors.orange),
                                  ),
                                  trailing: Text(
                                    style: const TextStyle(
                                      color: Colors.black87,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16.0,
                                    ),
                                    DateFormat.jm().format(prayerTimes.isha),
                                  ),
                                ),
                                const SizedBox(height: 15.0),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
