import 'package:flutter/material.dart';
import 'package:flutter_compass/flutter_compass.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:math' as math;
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rosanatravel/beranda.dart';

void main() {
  runApp(QiblaCompassApp());
}

class QiblaCompassApp extends StatelessWidget {
  const QiblaCompassApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: QiblaCompassPage(),
    );
  }
}

class QiblaCompassPage extends StatefulWidget {
  const QiblaCompassPage({super.key});

  @override
  _QiblaCompassPageState createState() => _QiblaCompassPageState();
}

class _QiblaCompassPageState extends State<QiblaCompassPage> {
  double? _heading;
  double _qiblaDirection = 0;

  @override
  @override
  void initState() {
    super.initState();
    _requestLocationPermission();
    FlutterCompass.events!.listen((event) {
      setState(() {
        _heading = event.heading;
      });
    });
  }

  Future<void> _requestLocationPermission() async {
    LocationPermission permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.deniedForever) {
      // Jika izin lokasi ditolak permanen, beri tahu pengguna
      // Kamu bisa menampilkan dialog atau membuka pengaturan
      print("Permission Denied Forever");
    } else if (permission == LocationPermission.denied) {
      // Jika izin lokasi ditolak, beri tahu pengguna
      print("Permission Denied");
    } else {
      // Jika izin lokasi diberikan, lanjutkan
      _getQiblaDirection();
    }
  }

  Future<void> _getQiblaDirection() async {
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    double lat = position.latitude;
    double lon = position.longitude;

    // Koordinat Ka'bah
    double kaabaLat = 21.4225;
    double kaabaLon = 39.8262;

    // Perhitungan arah Kiblat
    double deltaLon = (kaabaLon - lon).toRadians();
    double latRad = lat.toRadians();
    double kaabaLatRad = kaabaLat.toRadians();

    double y = math.sin(deltaLon) * math.cos(kaabaLatRad);
    double x =
        math.cos(latRad) * math.sin(kaabaLatRad) -
        math.sin(latRad) * math.cos(kaabaLatRad) * math.cos(deltaLon);
    double qiblaAngle = math.atan2(y, x).toDegrees();

    setState(() {
      _qiblaDirection = (qiblaAngle + 360) % 360;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kompas Kiblat"),
        backgroundColor: Colors.green,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Putar perangkat hingga jarum mengarah ke kiblat"),
            SizedBox(height: 20),
            _heading == null
                ? CircularProgressIndicator()
                : Transform.rotate(
                  angle: ((_heading! - _qiblaDirection) * (math.pi / 180) * -1),
                  child: SvgPicture.asset("assets/needle2.svg", width: 200),
                ),
            SizedBox(height: 20),
            Text("Arah Kiblat: ${_qiblaDirection.toStringAsFixed(2)}°"),
          ],
        ),
      ),
    );
  }
}

extension on double {
  double toRadians() => this * (math.pi / 180.0);
  double toDegrees() => this * (180.0 / math.pi);
}
