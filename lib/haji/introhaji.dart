// ignore_for_file: library_private_types_in_public_api

import 'package:rosanatravel/umroh/umrohnew.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:flutter/material.dart';

import '../umroh/umrohold.dart';

class IntroUmroh extends StatefulWidget {
  const IntroUmroh({Key? key}) : super(key: key);

  @override
  _IntroUmrohState createState() => _IntroUmrohState();
}

class _IntroUmrohState extends State<IntroUmroh> {
  PageController? pageViewController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: SizedBox(
                width: double.infinity,
                height: 500,
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                        0,
                        0,
                        0,
                        50,
                      ),
                      child: PageView(
                        controller:
                            pageViewController ??= PageController(
                              initialPage: 0,
                            ),
                        scrollDirection: Axis.horizontal,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                    30,
                                    0,
                                    30,
                                    0,
                                  ),
                                  child: Hero(
                                    tag: 'new hero',
                                    transitionOnUserGestures: true,
                                    child: Image.asset(
                                      'assets/img/ihram.png',
                                      width: double.infinity,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                              ),
                              const Text(
                                'Niat Ihram',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 32.0,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                  30,
                                  0,
                                  30,
                                  30,
                                ),
                                child: Text(
                                  'Keadaan seseorang yang telah berniat untuk melaksanakan haji atau umroh',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(15.0),
                                      ),
                                      color: Color.fromRGBO(33, 153, 0, 50),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 0.0,
                                        horizontal: 15.0,
                                      ),
                                      child: MaterialButton(
                                        child: const Row(
                                          children: [
                                            Text(
                                              "Selanjutnya",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20.0,
                                              ),
                                            ),
                                            SizedBox(width: 5.0),
                                            Icon(
                                              Icons.navigate_next,
                                              color: Colors.white,
                                            ),
                                          ],
                                        ),
                                        onPressed: () {
                                          pageViewController!.animateToPage(
                                            1,
                                            duration: const Duration(
                                              milliseconds: 500,
                                            ),
                                            curve: Curves.ease,
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 30.0),
                            ],
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                    30,
                                    0,
                                    30,
                                    0,
                                  ),
                                  child: Hero(
                                    tag: 'new hero',
                                    transitionOnUserGestures: true,
                                    child: Image.asset(
                                      'assets/img/tawaf.png',
                                      width: double.infinity,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                              ),
                              const Text(
                                'Tawaf',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 32.0,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                  30,
                                  0,
                                  30,
                                  30,
                                ),
                                child: Text(
                                  'Kegiatan mengelilingi Ka\'bah sebanyak 7 kali putaran yang dapat dilaksanakan saat rangkaian ibadah umroh atau haji berlangsung maupun diluar rangkaian ',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(15.0),
                                      ),
                                      color: Color.fromRGBO(33, 153, 0, 50),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 0.0,
                                        horizontal: 15.0,
                                      ),
                                      child: MaterialButton(
                                        child: const Row(
                                          children: [
                                            Text(
                                              "Selanjutnya",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20.0,
                                              ),
                                            ),
                                            SizedBox(width: 5.0),
                                            Icon(
                                              Icons.navigate_next,
                                              color: Colors.white,
                                            ),
                                          ],
                                        ),
                                        onPressed: () {
                                          pageViewController!.animateToPage(
                                            2,
                                            duration: const Duration(
                                              milliseconds: 500,
                                            ),
                                            curve: Curves.ease,
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 30.0),
                            ],
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                    30,
                                    0,
                                    30,
                                    0,
                                  ),
                                  child: Hero(
                                    tag: 'new hero',
                                    transitionOnUserGestures: true,
                                    child: Image.asset(
                                      'assets/img/sai.png',
                                      width: double.infinity,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                              ),
                              const Text(
                                'Sa\'i',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 32.0,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                  30,
                                  0,
                                  30,
                                  30,
                                ),
                                child: Text(
                                  'Kegiatan mengelilingi Ka\'bah sebanyak 7 kali putaran yang dapat dilaksanakan saat rangkaian ibadah umroh atau haji berlangsung maupun diluar rangkaian ',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(15.0),
                                      ),
                                      color: Color.fromRGBO(33, 153, 0, 50),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 0.0,
                                        horizontal: 15.0,
                                      ),
                                      child: MaterialButton(
                                        child: const Row(
                                          children: [
                                            Text(
                                              "Selanjutnya",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20.0,
                                              ),
                                            ),
                                            SizedBox(width: 5.0),
                                            Icon(
                                              Icons.navigate_next,
                                              color: Colors.white,
                                            ),
                                          ],
                                        ),
                                        onPressed: () {
                                          pageViewController!.animateToPage(
                                            3,
                                            duration: const Duration(
                                              milliseconds: 500,
                                            ),
                                            curve: Curves.ease,
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 30.0),
                            ],
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                    30,
                                    0,
                                    30,
                                    0,
                                  ),
                                  child: Hero(
                                    tag: 'new hero',
                                    transitionOnUserGestures: true,
                                    child: Image.asset(
                                      'assets/img/tahalul.png',
                                      width: double.infinity,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                              ),
                              const Text(
                                'Tahallul',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 32.0,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                  30,
                                  0,
                                  30,
                                  30,
                                ),
                                child: Text(
                                  'Kegiatan mencukur atau memotong sebagian rambut sebagai penutup rangkaian kegiatan ibadah Umroh atau Haji',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(15.0),
                                      ),
                                      color: Color.fromRGBO(33, 153, 0, 50),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 0.0,
                                        horizontal: 15.0,
                                      ),
                                      child: MaterialButton(
                                        child: const Row(
                                          children: [
                                            Text(
                                              "Selanjutnya",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20.0,
                                              ),
                                            ),
                                            SizedBox(width: 5.0),
                                            Icon(
                                              Icons.navigate_next,
                                              color: Colors.white,
                                            ),
                                          ],
                                        ),
                                        onPressed: () {
                                          pageViewController!.animateToPage(
                                            4,
                                            duration: const Duration(
                                              milliseconds: 500,
                                            ),
                                            curve: Curves.ease,
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 30.0),
                            ],
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                flex: 5,
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                    30,
                                    0,
                                    30,
                                    0,
                                  ),
                                  child: Hero(
                                    tag: 'new hero',
                                    transitionOnUserGestures: true,
                                    child: Image.asset(
                                      'assets/img/tertibnospace.png',
                                      width: double.infinity,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                              ),
                              const Text(
                                'Tertib',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 32.0,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                  30,
                                  0,
                                  30,
                                  30,
                                ),
                                child: Text(
                                  'Jama’ah ibadah Umroh harus melaksanakan rangkaian ibadah sesuai urutan dan aturan yang ditetapkan. Pastikan ketika melaksanakan rukun Umroh tidak boleh melewatkan atau melompati rangkaian ibadah Umroh',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(15.0),
                                      ),
                                      color: Color.fromRGBO(33, 153, 0, 50),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 0.0,
                                        horizontal: 45.0,
                                      ),
                                      child: MaterialButton(
                                        child: const Text(
                                          "Mulai",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20.0,
                                          ),
                                        ),
                                        onPressed: () {
                                          Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                              builder:
                                                  (context) =>
                                                      const UmrohPage(),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 30),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(0, 1),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                          0,
                          0,
                          0,
                          25,
                        ),
                        child: smooth_page_indicator.SmoothPageIndicator(
                          controller:
                              pageViewController ??= PageController(
                                initialPage: 0,
                              ),
                          count: 5,
                          axisDirection: Axis.horizontal,
                          onDotClicked: (i) {
                            pageViewController!.animateToPage(
                              i,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.ease,
                            );
                          },
                          effect:
                              const smooth_page_indicator.ExpandingDotsEffect(
                                expansionFactor: 2,
                                spacing: 8,
                                radius: 16,
                                dotWidth: 16,
                                dotHeight: 16,
                                dotColor: Color(0xFF9E9E9E),
                                activeDotColor: Color(0xFFFFBD00),
                                paintStyle: PaintingStyle.fill,
                              ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(
                            35.0,
                            35.0,
                            20.0,
                            0.0,
                          ),
                          child: Container(
                            width: MediaQuery.of(context).size.width / 4,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: const Color.fromRGBO(33, 153, 0, 50),
                                width: 2,
                              ),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(15),
                              ),
                            ),
                            child: InkWell(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(15),
                              ),
                              onTap: () {
                                pageViewController!.animateToPage(
                                  4, // replace 4 with the index of the last page
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.ease,
                                );
                              },
                              child: const Padding(
                                padding: EdgeInsets.symmetric(vertical: 5),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Lewati",
                                      style: TextStyle(
                                        color: Color.fromRGBO(33, 153, 0, 50),
                                        fontSize: 14.0,
                                      ),
                                    ),
                                    SizedBox(width: 5),
                                    Icon(
                                      Icons.skip_next,
                                      color: Color.fromRGBO(33, 153, 0, 50),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
