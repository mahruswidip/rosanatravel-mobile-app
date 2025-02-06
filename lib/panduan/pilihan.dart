import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../haji/haji.dart';
import '../umroh/introumroh.dart';

class Pilihan extends StatefulWidget {
  const Pilihan({super.key});

  @override
  State<Pilihan> createState() => _PilihanState();
}

class _PilihanState extends State<Pilihan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 0,
        title: const Padding(
          padding: EdgeInsets.only(left: 8.0, top: 8.0),
          child: Text('Panduan'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30, 40, 30, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MyHomeMainButtonPilihan(
                  onTap:
                      () => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const IntroUmroh(),
                          ),
                        ),
                      },
                  color: Colors.green,
                  asset: 'assets/svg/menu_utama/umroh.svg',
                  text: 'Umroh',
                ),
                const SizedBox(width: 20.0),
                MyHomeMainButtonPilihan(
                  onTap:
                      () => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Haji()),
                        ),
                      },
                  color: Colors.green,
                  asset: 'assets/svg/menu_utama/haji2.svg',
                  text: 'Haji',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class MyHomeMainButtonPilihan extends StatelessWidget {
  const MyHomeMainButtonPilihan({
    super.key,
    required this.onTap,
    required this.color,
    required this.text,
    required this.asset,
  });

  final VoidCallback onTap;
  final Color color;
  final String text;
  final String asset;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 120.0,
          height: 120.0,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(45.5),
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: onTap,
              borderRadius: BorderRadius.circular(20.5),
              child: Column(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        right: 20.0,
                        left: 20.0,
                        top: 0.0,
                      ),
                      child: SvgPicture.asset(asset, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 10.0),
        Text(
          text,
          style: const TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.w400,
            color: Colors.black54,
          ),
        ),
      ],
    );
  }
}
