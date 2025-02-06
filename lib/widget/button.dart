import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ButtonPrimary extends StatelessWidget {
  final String text; // Teks yang ditampilkan di button
  final Color color; // Warna latar belakang button
  final Color textColor; // Warna teks
  final VoidCallback onPressed; // Fungsi yang dipanggil saat button ditekan
  final double borderRadius; // Radius sudut button
  final double elevation; // Elevasi untuk efek bayangan

  const ButtonPrimary({
    super.key,
    required this.text,
    required this.color,
    required this.onPressed,
    this.textColor = Colors.white, // Default warna teks adalah putih
    this.borderRadius = 8.0, // Default radius sudut
    this.elevation = 2.0, // Default elevasi
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: elevation,
      borderRadius: BorderRadius.circular(borderRadius),
      child: InkWell(
        borderRadius: BorderRadius.circular(borderRadius),
        onTap: onPressed,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: textColor,
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MyHomeMainButton extends StatelessWidget {
  const MyHomeMainButton({
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
          width: 55.0,
          height: 55.0,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(50),
          ),
          child: Material(
            borderRadius: BorderRadius.circular(50),
            elevation: 1,
            color: Colors.green,
            // color: const Color.fromRGBO(252, 188, 55, 1.0),
            child: InkWell(
              onTap: onTap,
              borderRadius: BorderRadius.circular(50),
              child: Column(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        right: 15.0,
                        left: 15.0,
                        top: 10.0,
                        bottom: 10.0,
                      ),
                      // ignore: deprecated_member_use
                      child: SvgPicture.asset(asset, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          text,
          style: const TextStyle(
            fontSize: 12.0,
            fontWeight: FontWeight.w400,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }
}

class MyHomeMainButtonAmber extends StatelessWidget {
  const MyHomeMainButtonAmber({
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
          width: 55.0,
          height: 55.0,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(50),
          ),
          child: Material(
            borderRadius: BorderRadius.circular(50),
            elevation: 1,
            color: const Color.fromARGB(255, 255, 252, 244),
            // color: const Color.fromRGBO(252, 188, 55, 1.0),
            child: InkWell(
              onTap: onTap,
              borderRadius: BorderRadius.circular(50),
              child: Column(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        right: 15.0,
                        left: 15.0,
                        top: 10.0,
                        bottom: 10.0,
                      ),
                      // ignore: deprecated_member_use
                      child: SvgPicture.asset(asset, color: Colors.amber),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          text,
          style: const TextStyle(
            fontSize: 12.0,
            fontWeight: FontWeight.w400,
            color: Color.fromARGB(255, 38, 38, 38),
          ),
        ),
      ],
    );
  }
}
