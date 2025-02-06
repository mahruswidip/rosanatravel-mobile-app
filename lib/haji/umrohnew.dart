// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

import '../beranda.dart';

class UmrohPage extends StatelessWidget {
  const UmrohPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        leading: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(3.0),
              child: IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                tooltip: 'Show Snackbar',
                onPressed: () {
                  Navigator.pop(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const BerandaPage(title: 'Beranda'),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
        title: const Text("Umroh"),
      ),
      body: const Tabbar(),
    );
  }
}

class Tabbar extends StatefulWidget {
  const Tabbar({super.key});

  @override
  _TabbarState createState() => _TabbarState();
}

class _TabbarState extends State<Tabbar> {
  final Map<String, bool> _switchStates = {
    'arab': true,
    'transliteration': true,
    'translation': true,
  };

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(240, 240, 240, 1),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(28.0),
            child: TabBar(
              unselectedLabelColor: Colors.black.withOpacity(0.3),
              labelColor: Colors.black,
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorWeight: 2.0,
              labelStyle: const TextStyle(fontSize: 12.0),
              tabs: [
                Tab(
                  icon: Image.asset("assets/img/iconihram.png", height: 25.0),
                  child: Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: Text(
                      style: TextStyle(fontWeight: FontWeight.bold),
                      'Niat',
                    ),
                  ),
                ),
                Tab(
                  icon: Image.asset("assets/img/icontawaf.png", height: 25.0),
                  child: Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: Text(
                      style: TextStyle(fontWeight: FontWeight.bold),
                      'Tawaf',
                    ),
                  ),
                ),
                Tab(
                  icon: Image.asset("assets/img/iconsai.png", height: 25.0),
                  child: Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: Text(
                      style: TextStyle(fontWeight: FontWeight.bold),
                      "Sa'i",
                    ),
                  ),
                ),
                Tab(
                  icon: Image.asset("assets/img/icontahalul.png", height: 25.0),
                  child: Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: Text(
                      style: TextStyle(fontWeight: FontWeight.bold),
                      "Tahalul",
                    ),
                  ),
                ),
                Tab(
                  icon: Image.asset("assets/img/icontertib.png", height: 25.0),
                  child: Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: Text(
                      style: TextStyle(fontWeight: FontWeight.bold),
                      "Tertib",
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: TabBarView(
          children: [
            _buildTabNiat("niat"),
            _buildTabTawaf("tawaf"),
            _buildTabSai("sai"),
            _buildTabTahalul("tahalul"),
            _buildTabTertib("tertib"),
          ],
        ),
      ),
    );
  }

  Widget _buildTabNiat(String niat) {
    return ListView(
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
              child: Text(
                "Ihram",
                style: TextStyle(
                  fontSize: 22.0,
                  letterSpacing: 0.29,
                  color: Colors.black,
                  fontWeight: (FontWeight.w700),
                ),
              ),
            ),
          ],
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Text("Arab", style: TextStyle(fontSize: 14.0)),
            Text("Transliterasi", style: TextStyle(fontSize: 14.0)),
            Text("Arti", style: TextStyle(fontSize: 14.0)),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Switch(
              activeColor: Colors.white,
              activeTrackColor: Colors.green,
              inactiveThumbColor: Colors.white,
              inactiveTrackColor: Colors.grey,
              value: _switchStates['arab']!,
              onChanged: (newValue) {
                setState(() {
                  _switchStates['arab'] = newValue;
                });
              },
            ),
            Switch(
              activeColor: Colors.white,
              activeTrackColor: Colors.green,
              inactiveThumbColor: Colors.white,
              inactiveTrackColor: Colors.grey,
              value: _switchStates['transliteration']!,
              onChanged: (newValue) {
                setState(() {
                  _switchStates['transliteration'] = newValue;
                });
              },
            ),
            Switch(
              activeColor: Colors.white,
              activeTrackColor: Colors.green,
              inactiveThumbColor: Colors.white,
              inactiveTrackColor: Colors.grey,
              value: _switchStates['translation']!,
              onChanged: (newValue) {
                setState(() {
                  _switchStates['translation'] = newValue;
                });
              },
            ),
          ],
        ),
        if (_switchStates['arab']!)
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
            child: Text(
              "ﻟَﺒَّﻴْﻚَ اﻟﻠَّـﻬُﻢَّ ﻋُﻤْﺮَﺓ",
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.right,
              style: TextStyle(fontSize: 32.0),
            ),
          ),
        if (_switchStates['transliteration']!)
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 10.0),
            child: Text(
              "Labbaikallahumma Umrah",
              textAlign: TextAlign.right,
              style: TextStyle(fontSize: 22.0),
            ),
          ),
        if (_switchStates['translation']!)
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 10.0),
            child: Text(
              "Ya Allah, kupenuhi panggilan-Mu untuk ber-Umrah",
              textAlign: TextAlign.right,
              style: TextStyle(fontSize: 15.0),
            ),
          ),
      ],
    );
  }

  Widget _buildTabTawaf(String tawaf) {
    return ListView(
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
              child: Text(
                "Tawaf",
                style: TextStyle(
                  fontSize: 22.0,
                  letterSpacing: 0.29,
                  color: Colors.black,
                  fontWeight: (FontWeight.w700),
                ),
              ),
            ),
          ],
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Text("Arab", style: TextStyle(fontSize: 14.0)),
            Text("Transliterasi", style: TextStyle(fontSize: 14.0)),
            Text("Arti", style: TextStyle(fontSize: 14.0)),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Switch(
              activeColor: Colors.white,
              activeTrackColor: Colors.green,
              inactiveThumbColor: Colors.white,
              inactiveTrackColor: Colors.grey,
              value: _switchStates['arab']!,
              onChanged: (newValue) {
                setState(() {
                  _switchStates['arab'] = newValue;
                });
              },
            ),
            Switch(
              activeColor: Colors.white,
              activeTrackColor: Colors.green,
              inactiveThumbColor: Colors.white,
              inactiveTrackColor: Colors.grey,
              value: _switchStates['transliteration']!,
              onChanged: (newValue) {
                setState(() {
                  _switchStates['transliteration'] = newValue;
                });
              },
            ),
            Switch(
              activeColor: Colors.white,
              activeTrackColor: Colors.green,
              inactiveThumbColor: Colors.white,
              inactiveTrackColor: Colors.grey,
              value: _switchStates['translation']!,
              onChanged: (newValue) {
                setState(() {
                  _switchStates['translation'] = newValue;
                });
              },
            ),
          ],
        ),
        if (_switchStates['arab']!)
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
            child: Text(
              "ﻟَﺒَّﻴْﻚَ اﻟﻠَّـﻬُﻢَّ ﻋُﻤْﺮَﺓ",
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.right,
              style: TextStyle(fontSize: 32.0),
            ),
          ),
        if (_switchStates['transliteration']!)
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 10.0),
            child: Text(
              "Labbaikallahumma Umrah",
              textAlign: TextAlign.right,
              style: TextStyle(fontSize: 22.0),
            ),
          ),
        if (_switchStates['translation']!)
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 10.0),
            child: Text(
              "Ya Allah, kupenuhi panggilan-Mu untuk ber-Umrah",
              textAlign: TextAlign.right,
              style: TextStyle(fontSize: 15.0),
            ),
          ),
      ],
    );
  }

  Widget _buildTabSai(String sai) {
    return ListView(
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
              child: Text(
                "Sai",
                style: TextStyle(
                  fontSize: 22.0,
                  letterSpacing: 0.29,
                  color: Colors.black,
                  fontWeight: (FontWeight.w700),
                ),
              ),
            ),
          ],
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Text("Arab", style: TextStyle(fontSize: 14.0)),
            Text("Transliterasi", style: TextStyle(fontSize: 14.0)),
            Text("Arti", style: TextStyle(fontSize: 14.0)),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Switch(
              activeColor: Colors.white,
              activeTrackColor: Colors.green,
              inactiveThumbColor: Colors.white,
              inactiveTrackColor: Colors.grey,
              value: _switchStates['arab']!,
              onChanged: (newValue) {
                setState(() {
                  _switchStates['arab'] = newValue;
                });
              },
            ),
            Switch(
              activeColor: Colors.white,
              activeTrackColor: Colors.green,
              inactiveThumbColor: Colors.white,
              inactiveTrackColor: Colors.grey,
              value: _switchStates['transliteration']!,
              onChanged: (newValue) {
                setState(() {
                  _switchStates['transliteration'] = newValue;
                });
              },
            ),
            Switch(
              activeColor: Colors.white,
              activeTrackColor: Colors.green,
              inactiveThumbColor: Colors.white,
              inactiveTrackColor: Colors.grey,
              value: _switchStates['translation']!,
              onChanged: (newValue) {
                setState(() {
                  _switchStates['translation'] = newValue;
                });
              },
            ),
          ],
        ),
        if (_switchStates['arab']!)
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
            child: Text(
              "ﻟَﺒَّﻴْﻚَ اﻟﻠَّـﻬُﻢَّ ﻋُﻤْﺮَﺓ",
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.right,
              style: TextStyle(fontSize: 32.0),
            ),
          ),
        if (_switchStates['transliteration']!)
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 10.0),
            child: Text(
              "Labbaikallahumma Umrah",
              textAlign: TextAlign.right,
              style: TextStyle(fontSize: 22.0),
            ),
          ),
        if (_switchStates['translation']!)
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 10.0),
            child: Text(
              "Ya Allah, kupenuhi panggilan-Mu untuk ber-Umrah",
              textAlign: TextAlign.right,
              style: TextStyle(fontSize: 15.0),
            ),
          ),
      ],
    );
  }

  Widget _buildTabTahalul(String tahalul) {
    return ListView(
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
              child: Text(
                "Tahalul",
                style: TextStyle(
                  fontSize: 22.0,
                  letterSpacing: 0.29,
                  color: Colors.black,
                  fontWeight: (FontWeight.w700),
                ),
              ),
            ),
          ],
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Text("Arab", style: TextStyle(fontSize: 14.0)),
            Text("Transliterasi", style: TextStyle(fontSize: 14.0)),
            Text("Arti", style: TextStyle(fontSize: 14.0)),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Switch(
              activeColor: Colors.white,
              activeTrackColor: Colors.green,
              inactiveThumbColor: Colors.white,
              inactiveTrackColor: Colors.grey,
              value: _switchStates['arab']!,
              onChanged: (newValue) {
                setState(() {
                  _switchStates['arab'] = newValue;
                });
              },
            ),
            Switch(
              activeColor: Colors.white,
              activeTrackColor: Colors.green,
              inactiveThumbColor: Colors.white,
              inactiveTrackColor: Colors.grey,
              value: _switchStates['transliteration']!,
              onChanged: (newValue) {
                setState(() {
                  _switchStates['transliteration'] = newValue;
                });
              },
            ),
            Switch(
              activeColor: Colors.white,
              activeTrackColor: Colors.green,
              inactiveThumbColor: Colors.white,
              inactiveTrackColor: Colors.grey,
              value: _switchStates['translation']!,
              onChanged: (newValue) {
                setState(() {
                  _switchStates['translation'] = newValue;
                });
              },
            ),
          ],
        ),
        if (_switchStates['arab']!)
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
            child: Text(
              "ﻟَﺒَّﻴْﻚَ اﻟﻠَّـﻬُﻢَّ ﻋُﻤْﺮَﺓ",
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.right,
              style: TextStyle(fontSize: 32.0),
            ),
          ),
        if (_switchStates['transliteration']!)
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 10.0),
            child: Text(
              "Labbaikallahumma Umrah",
              textAlign: TextAlign.right,
              style: TextStyle(fontSize: 22.0),
            ),
          ),
        if (_switchStates['translation']!)
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 10.0),
            child: Text(
              "Ya Allah, kupenuhi panggilan-Mu untuk ber-Umrah",
              textAlign: TextAlign.right,
              style: TextStyle(fontSize: 15.0),
            ),
          ),
      ],
    );
  }

  Widget _buildTabTertib(String tertib) {
    return ListView(
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
              child: Text(
                "Tertib",
                style: TextStyle(
                  fontSize: 22.0,
                  letterSpacing: 0.29,
                  color: Colors.black,
                  fontWeight: (FontWeight.w700),
                ),
              ),
            ),
          ],
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Text("Arab", style: TextStyle(fontSize: 14.0)),
            Text("Transliterasi", style: TextStyle(fontSize: 14.0)),
            Text("Arti", style: TextStyle(fontSize: 14.0)),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Switch(
              activeColor: Colors.white,
              activeTrackColor: Colors.green,
              inactiveThumbColor: Colors.white,
              inactiveTrackColor: Colors.grey,
              value: _switchStates['arab']!,
              onChanged: (newValue) {
                setState(() {
                  _switchStates['arab'] = newValue;
                });
              },
            ),
            Switch(
              activeColor: Colors.white,
              activeTrackColor: Colors.green,
              inactiveThumbColor: Colors.white,
              inactiveTrackColor: Colors.grey,
              value: _switchStates['transliteration']!,
              onChanged: (newValue) {
                setState(() {
                  _switchStates['transliteration'] = newValue;
                });
              },
            ),
            Switch(
              activeColor: Colors.white,
              activeTrackColor: Colors.green,
              inactiveThumbColor: Colors.white,
              inactiveTrackColor: Colors.grey,
              value: _switchStates['translation']!,
              onChanged: (newValue) {
                setState(() {
                  _switchStates['translation'] = newValue;
                });
              },
            ),
          ],
        ),
        if (_switchStates['arab']!)
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
            child: Text(
              "ﻟَﺒَّﻴْﻚَ اﻟﻠَّـﻬُﻢَّ ﻋُﻤْﺮَﺓ",
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.right,
              style: TextStyle(fontSize: 32.0),
            ),
          ),
        if (_switchStates['transliteration']!)
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 10.0),
            child: Text(
              "Labbaikallahumma Umrah",
              textAlign: TextAlign.right,
              style: TextStyle(fontSize: 22.0),
            ),
          ),
        if (_switchStates['translation']!)
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 10.0),
            child: Text(
              "Ya Allah, kupenuhi panggilan-Mu untuk ber-Umrah",
              textAlign: TextAlign.right,
              style: TextStyle(fontSize: 15.0),
            ),
          ),
      ],
    );
  }
}
