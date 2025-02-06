import 'package:flutter/material.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';
import 'package:rosanatravel/sholat/sholat.dart';

import 'qiblah/loading_indicator.dart';
import 'qiblah/qiblah_compass.dart';

class Qiblah extends StatefulWidget {
  const Qiblah({super.key});

  @override
  State<Qiblah> createState() => QiblahState();
}

class QiblahState extends State<Qiblah> {
  final _deviceSupport = FlutterQiblah.androidDeviceSensorSupport();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.white, primarySwatch: Colors.amber),
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Arah Kiblat'),
          leading: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(3.0),
                child: IconButton(
                  icon: const Icon(Icons.arrow_back_ios),
                  tooltip: 'Show Snackbar',
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
        ),
        body: FutureBuilder(
          future: _deviceSupport,
          builder: (_, AsyncSnapshot<bool?> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const LoadingIndicator();
            }
            if (snapshot.hasError) {
              return Center(child: Text("Error: ${snapshot.error.toString()}"));
            }

            if (snapshot.data!) {
              return const QiblahCompass();
            } else {
              return const Sholat();
            }
          },
        ),
      ),
    );
  }
}
