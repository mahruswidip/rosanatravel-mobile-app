// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

import '../beranda.dart';

class UmrohPage extends StatelessWidget {
  const UmrohPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(245, 255, 250, 1),
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
        title: const Text(
          "Umroh",
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
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
        backgroundColor: Color.fromRGBO(245, 255, 250, 1),
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(245, 255, 250, 1),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(28.0),
            child: TabBar(
              unselectedLabelColor: const Color.fromARGB(
                255,
                50,
                50,
                50,
              ).withOpacity(0.3),
              labelColor: Colors.black,
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorWeight: 3.0,
              indicatorColor: Colors.green,
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
            _buildTabNiat(doaListNiat),
            _buildTabTawaf(doaListTawaf),
            _buildTabSai(doaListSai),
            _buildTabTahalul(doaListTahalul),
            _buildTabTertib(doaListTertib),
          ],
        ),
      ),
    );
  }

  final List<Map<String, String>> doaListNiat = [
    {
      'title': 'Niat Ihram',
      'arab': 'ﻟَﺒَّﻴْﻚَ اﻟﻠَّـﻬُﻢَّ ﻋُﻤْﺮَﺓ',
      'transliteration': 'Labbaikallahumma Umrah',
      'translation': 'Ya Allah, kupenuhi panggilan-Mu untuk ber-Umrah',
    },
    {
      'title': '',
      'arab':
          'نَوَيْتُ العُمْرَةَ وَأَحْرَمْتُ بِهَا لِلهِ تَعَالَى لَبَّيْكَ اللَّهُمَّ بعُمْرَة',
      'transliteration': 'Nawaitul ‘umrata wa ahramtu bihi lillahi ta’ala ',
      'translation':
          'Aku niat melaksanakan umrah dan berihram karena Allah Swt.',
    },
    // Tambahkan set doa lainnya di sini
  ];

  final List<List<Map<String, String>>> doaListTawaf = [
    // Putaran 1
    [
      {
        'title': 'Istilam saat di Hajar Aswad',
        'arab': 'ﺑِﺴْﻢِ اﻟﻠﻪِ ﻭَاﻟﻠﻪُ ﺃَﻛْﺒَﺮ',
        'transliteration': 'Bismillahi Allahuakbar',
        'translation': 'Dengan menyebut Nama Allah, dan Allah Maha Besar',
      },
      {
        'title': 'Doa Putaran Pertama',
        'arab':
            'ﺳُﺒْﺤَﺎﻥَ اﻟﻠﻪُ/ ﻭَاﻟْﺤَﻤْﺪُﻟﻠﻪِ/ﻭَﻵﺇِﻟٰﻪَاِﻵَّﻟﻠﻪُ/ﻭَاﻟﻠﻪُ اَﻛْﺒَﺮُ/ﻭَﻻَﺣَﻮْﻝَ ﻭَﻻَ ﻗُﻮَّﺓَ/ﺇِﻻَّ ﺑِﺎﻟﻠﻪ اﻟْﻌَﻠِﻲِّ اﻟْﻌَﻈِﻴْﻢِ/ﻭَاﻟﺼَّﻼَﺓُ ﻭَاﻟﺴَّﻼَﻡُ/ ﻋَﻠٰﻰ ﺭَﺳُﻮﻝِ اﻟﻠﻪِ/ ﺻَﻠَّﻰ اﻟﻠﻪُ ﻋَﻠَﻴْﻪِ ﻭَﺳَﻠَّﻢَ/. اَﻟﻠّٰﻬُﻢَّ ﺇِﻳْﻤَﺎﻧًﺎ ﺑِﻚَ/ ﻭَﺗَﺼْﺪِﻳْﻘًﺎ ﺑِﻜِﺘَﺎﺑِﻚَ/ ﻭَﻭَﻓَﺂءً ﺑِﻌَﻬْﺪِﻙَ/ ﻭَاﺗِّﺒَﺎﻋًﺎ ﻟِﺴُﻨَّﺔِ ﻧَﺒِﻴِّﻚَ/ ﻣُﺤَﻤَّﺪٍ ﺻَﻠَّﻰ اﻟﻠﻪُ ﻋَﻠَﻴْﻪِ ﻭَﺳَﻠَّﻢَ/.اَﻟﻠّٰﻬُﻢَّ ﺇِﻧِّﻲْ ﺃَﺳْﺄَﻟُﻚَ/ اﻟْﻌَﻔْﻮَﻭَاﻟْﻌَﺎﻓِﻴَﺔَ/ ﻭاْﻟﻤُﻌَﺎﻓَﺎﺓَ اﻟﺪَّﺁﺋِﻤَﺔَ/ ﻓِﻰ اﻟﺪِّﻳْﻦِ ﻭَاﻟﺪُّﻧْﻴَﺎ اْﻻٰﺧِﺮَﺓِ/ ﻭَاﻟْﻔَﻮْﺯَ ﺑِﺎﻟْﺠَﻨَّﺔِ/ ﻭَاﻟﻨَّﺠَﺎﺓَ ﻣِﻦَ اﻟﻨَّﺎﺭ',
        'transliteration':
            'Subhanallahi walhamdulillahi wala ilaha illallahu wallahu akbar. Walahaula walaquwwata illa billahil aliyyil adzim, wassalatu wassalamu ala rasulillahi sallallhaualaihi wassalam, Allahumma imanan bika watasdiqan bikitabika wawafa an bi ahdika wattibaan lisunnati nabiyyika Muhammadin sallallahu alaihi wasallam. Allahumma inni as alukal afwa walafiata walmuafatad da imata fiddini waddun ya wal akhirati wal fauza bil jannati wannajata minannar',
        'translation':
            'Maha Suci Allah, Segala puji bagi Allah, Tidak ada Tuhan selain Allah. Allah Maha Besar, Tiada daya (untuk memperoleh manfaat ) dan tiada kemampuan ( untuk menolak bahaya ) kecuali bersumber dari Allah yang Maha Tinggi dan Maha Agung. Shalawat dan salam bagi Rasulullah SAW. Ya Allah, aku Tawaf ini karena beriman kepada-Mu, membenarkan kitab-Mu, dan memenuhi janji-Mu, dan mengikuti sunnah Nabi-Mu Muhammad SAW. Ya Allah, sesungguhnya aku mohon kapada-Mu ampunan, kesehatan dan kesejahteraan yang kekal dalam menjalankan agama, di dunia dan di akhirat dari siksa neraka',
      },
      {
        'title': 'Istilam saat di Rukun Yamani',
        'arab': 'ﺑِﺴْﻢِ اﻟﻠﻪِ ﻭَاﻟﻠﻪُ ﺃَﻛْﺒَﺮ',
        'transliteration': 'Bismillahi Allahuakbar',
        'translation': 'Dengan menyebut Nama Allah, dan Allah Maha Besar',
      },
      {
        'title': 'Doa diantara Rukun Yamani dan Hajar Aswad',
        'arab':
            'رَبَّنا آتِنَا/فِي الدُّنْيَا حَسَنَةً/وَفِى الْأخِرَةِ حَسَنَةً/وَقِنَا عَذَابَ النَّارِ وَأَدْخِلْنَا الجَنةَ/مَعَ الأبْرَارِ/يَاعَزِيْزُيَاغَفَّارُ/يَارَبَّ العَالَمِيْنَ',
        'transliteration':
            "Robbana atina fiddun ya hasanah Wafil akhirati hasanatan waqina azabannar. Wa adhilnal jannata ma'al abrar, ya 'azizu ya ghafuru ya rabbal 'alamin",
        'translation':
            'Ya Tuhan kami, berilah kami kebaikan didunia dan kebaikan di akhirat dan hindarkanlah kami dari siksa neraka. Dan masukkanlah kami ke dalam surga bersama orang-orang yang saleh. Ya Tuhan yang Maha Perkasa, Maha Pengampun, Tuhan seru sekalian alam',
      },
    ],
    // Putaran 2
    [
      {
        'title': 'Istilam saat di Hajar Aswad',
        'arab': 'ﺑِﺴْﻢِ اﻟﻠﻪِ ﻭَاﻟﻠﻪُ ﺃَﻛْﺒَﺮ',
        'transliteration': 'Bismillahi Allahuakbar',
        'translation': 'Dengan menyebut Nama Allah, dan Allah Maha Besar',
      },
      {
        'title': 'Doa Putaran Kedua',
        'arab':
            'ﻟﻠّٰﻬُﻢَّ/ ﺇِﻥَّ ﻫٰﺬَا اْﻟﺒَﻴْﺖَ ﺑَﻴْﺘُﻚَ/ﻭَاﻟْﺤَﺮَﻡَ ﺣَﺮَﻣُﻚَ/ﻭَاْﻷَﻣْﻦَ ﺃَﻣْﻨُﻚَ/ﻭَاﻟْﻌَﺒْﺪَ ﻋَﺒْﺪُﻙَ/ﻭَﺃَﻧَﺎ ﻋَﺒْﺪُﻙَ/ﻭَاﺑْﻦُ ﻋَﺒْﺪُﻙَ/ﻭَﻫٰﺬَا ﻣَﻘَﺎﻡُ اﻟْﻌَﺎﺋِﺬِ ﺑِﻚَ/ﻣِﻦْ اﻟﻨَّﺎﺭِ/ﻓَﺤَﺮِّﻡْ ﻟُﺤُﻮْﻣَﻨَﺎ/ﻭَﺑَﺸَﺮَﺗَﻨَﺎ/ﻋَﻠَﻰ اﻟﻨَّﺎﺭِ/اَﻟﻠّٰﻬُﻢَّ ﺣَﺒِّﺐْ/ﺇِﻟَﻴْﻨَﺎ اْﻹِﻳْﻤَﺎﻥَ/ﻭَﺯَﻳِّﻨْﻪُ ﻓِﻲْ ﻗُﻠُﻮْﺑِﻨَﺎ/ﻭَﻛَﺮِّﻩْ ﺇِﻟَﻴْﻨَﺎ اﻟْﻜُﻔْﺮَ/ ﻭَاﻟْﻔُﺴُﻮْﻕَ ﻭَاﻟْﻌِﺼْﻴَﺎﻥَ/ﻭَاﺟْﻌَﻠْﻨَﺎ ﻣِﻦَ اﻟﺮَّاﺷِﺪِﻳْﻦَ/اَﻟﻠّٰﻬُﻢَّ ﻗِﻨِﻲْ ﻋَﺬَاﺑَﻚَ/ﻳَﻮْﻡَ ﺗَﺒْﻌَﺚُ ﻋِﺒَﺎﺩَﻙَ/اَﻟﻠّٰﻬُﻢَّ اﺭْﺯُﻗْﻨِﻰ اﻟْﺠَﻨَّﺔَ/ﺑِﻐَﻴْﺮِ ﺣِﺴَﺎﺏٍ',
        'transliteration':
            'Allahumma inna hazal baita baituka walharama haramuka wal amna amnuka wal abda abduka wa ana abduka wabnu abdika wahadza maqamul a idzibika minannar. Faharrin luhumana wabasya ratana alannar. Allahumma habbib ilainal imana wazayyinhu fiqulubina wakarrih ilainal kufra walfusuqa wal isyana waj alna minar rasyidin. Allahummarzuqnial jannata bighairi hisab',
        'translation':
            'Ya Allah,sesungguhnya Baitullah ini rumah-Mu, Tanah mulia ini tanah haram-Mu, Negri aman ini Negri-Mu, hamba ini hamba-Mu, dan aku hamba-Mu anak dari hamba-Mu dan tempat ini tempat berlindung pada-Mu dari siksa neraka. Ya Allah cintakanlah kami pada iman dan peliharalah ia dari hati kami, bencikanlah kami pada perbuatan kufur, fasiq, maksiat dan durhaka serta masukkanlah kami ini dalam golongan yang meandapat petunjuk. Ya Allah, peliharalah aku dari adzab-Mu di hari kelak Engkau membangkitkan hamba-hamba-Mu. Ya Allah, anugerahkanlah surga kepadaku tanpa hisab',
      },
      {
        'title': 'Istilam saat di Rukun Yamani',
        'arab': 'ﺑِﺴْﻢِ اﻟﻠﻪِ ﻭَاﻟﻠﻪُ ﺃَﻛْﺒَﺮ',
        'transliteration': 'Bismillahi Allahuakbar',
        'translation': 'Dengan menyebut Nama Allah, dan Allah Maha Besar',
      },
      {
        'title': 'Doa diantara Rukun Yamani dan Hajar Aswad',
        'arab':
            'رَبَّنا آتِنَا/فِي الدُّنْيَا حَسَنَةً/وَفِى الْأخِرَةِ حَسَنَةً/وَقِنَا عَذَابَ النَّارِ وَأَدْخِلْنَا الجَنةَ/مَعَ الأبْرَارِ/يَاعَزِيْزُيَاغَفَّارُ/يَارَبَّ العَالَمِيْنَ',
        'transliteration':
            "Robbana atina fiddun ya hasanah Wafil akhirati hasanatan waqina azabannar. Wa adhilnal jannata ma'al abrar, ya 'azizu ya ghafuru ya rabbal 'alamin",
        'translation':
            'Ya Tuhan kami, berilah kami kebaikan didunia dan kebaikan di akhirat dan hindarkanlah kami dari siksa neraka. Dan masukkanlah kami ke dalam surga bersama orang-orang yang saleh. Ya Tuhan yang Maha Perkasa, Maha Pengampun, Tuhan seru sekalian alam',
      },
    ],
    // Putaran 3
    [
      {
        'title': 'Istilam saat di Hajar Aswad',
        'arab': 'ﺑِﺴْﻢِ اﻟﻠﻪِ ﻭَاﻟﻠﻪُ ﺃَﻛْﺒَﺮ',
        'transliteration': 'Bismillahi Allahuakbar',
        'translation': 'Dengan menyebut Nama Allah, dan Allah Maha Besar',
      },
      {
        'title': 'Doa Putaran Ketiga',
        'arab':
            'اَﻟﻠَّﻬُﻢَّ ﺇِﻧِّﻲْ/ﺃَﻋُﻮْﺫُ ﺑِﻚَ/ﻣِﻦَ اﻟﺸَّﻚِّ/ ﻭَاﻟﺸِّﺮْﻙِ/ﻭَاﻟﺸِّﻘَﺎﻕِ/ ﻭَاﻟﻨِّﻔَﺎﻕِ/ﻭَﺳُﻮْءِ اﻷَْﺧْﻼَﻕِ/ﻭَﺳُﻮءِ اﻟﻤَﻨْﻈَﺮِ/ ﻭَاﻟْﻤُﻨْﻘَﻠَﺐِ/ﻓِﻲ اﻟْﻤَﺎﻝِ/ ﻭَاﻷَْﻫْﻞِ/ ﻭَاﻟْﻮَﻟَﺪِ/اَﻟﻠَّﻬُﻢَّ/ ﺇِﻧَّﻲْ اَﺳْﺄَﻟُﻚَ/ﺭِﺿَﺎﻙَ ﻭَاﻟﺠَﻨَّﺔَ/ﻭَاَﻋُﻮﺫُ ﺑِﻚَ/ﻣِﻦْ ﺳَﺨَﻄِﻚَ ﻭَاﻟﻨَّﺎﺭِ/اَﻟﻠَّﻬُﻢَّ/ ﺇِﻧِّﻲ ﺃَﻋُﻮﺫُ ﺑِﻚ/ﻣِﻦْ ﻓِﺘْﻨَﺔِ اﻟْﻘَﺒْﺮِ/ﻭَﺃَﻋُﻮْﺫُ ﺑِﻚَ/ﻣِﻦْ ﻓِﺘْﻨَﺔِ اﻟْﻤَﺤْﻴَﺎ/ ﻭَاﻟْﻤَﻤَﺎﺕِ',
        'transliteration':
            "Allahumma inni a'udzubika minasy syakki wasysyiriki wasysyqaqi wannifaqi wasu il akhlaqi wasu il manzari walmunqalabi filmali wal ahli walwaladi. Allahumma inni as'aluka ridaka waljannata wa'audzubika min sakhatika wannar. Allahumma inni a'udzubika min fitnatil qabri wa a'udzubika min fitnatil mahya walmamat",
        'translation':
            'Ya Allah, aku berlindung padaMu daripada syak was-was, syirik, cerai berai (bertengkar) muka dua, buruk budi pekerti, buruk pandangan (salah urus) terhadap harta benda dan keluarga. Ya Allah sesungguhnya aku mohon padaMu keridhaanMu dan syurga, dan aku berlindung padaMu daripada murkaMu dan neraka. Ya Allah, aku berlindung padaMu dari fitnah kubur serta dari fitnah kehidupan dan derita kematian',
      },
      {
        'title': 'Istilam saat di Rukun Yamani',
        'arab': 'ﺑِﺴْﻢِ اﻟﻠﻪِ ﻭَاﻟﻠﻪُ ﺃَﻛْﺒَﺮ',
        'transliteration': 'Bismillahi Allahuakbar',
        'translation': 'Dengan menyebut Nama Allah, dan Allah Maha Besar',
      },
      {
        'title': 'Doa diantara Rukun Yamani dan Hajar Aswad',
        'arab':
            'رَبَّنا آتِنَا/فِي الدُّنْيَا حَسَنَةً/وَفِى الْأخِرَةِ حَسَنَةً/وَقِنَا عَذَابَ النَّارِ وَأَدْخِلْنَا الجَنةَ/مَعَ الأبْرَارِ/يَاعَزِيْزُيَاغَفَّارُ/يَارَبَّ العَالَمِيْنَ',
        'transliteration':
            "Robbana atina fiddun ya hasanah Wafil akhirati hasanatan waqina azabannar. Wa adhilnal jannata ma'al abrar, ya 'azizu ya ghafuru ya rabbal 'alamin",
        'translation':
            'Ya Tuhan kami, berilah kami kebaikan didunia dan kebaikan di akhirat dan hindarkanlah kami dari siksa neraka. Dan masukkanlah kami ke dalam surga bersama orang-orang yang saleh. Ya Tuhan yang Maha Perkasa, Maha Pengampun, Tuhan seru sekalian alam',
      },
    ],
    // Putaran 4
    [
      {
        'title': 'Istilam saat di Hajar Aswad',
        'arab': 'ﺑِﺴْﻢِ اﻟﻠﻪِ ﻭَاﻟﻠﻪُ ﺃَﻛْﺒَﺮ',
        'transliteration': 'Bismillahi Allahuakbar',
        'translation': 'Dengan menyebut Nama Allah, dan Allah Maha Besar',
      },
      {
        'title': 'Doa Putaran Keempat',
        'arab':
            'اﻟﻠَّﻬُﻢَّ اﺟْﻌَﻠْﻪُ/ﺣَﺠًّﺎ ﻣَﺒْﺮُﻭْﺭًا/ﻭَﺳَﻌْﻴًﺎ ﻣَﺸْﻜُﻮْﺭًا/ﻭَﺫَﻧْﺒًﺎ ﻣَﻐْﻔُﻮْﺭًا/ﻭَﻋَﻤَﻼً ﺻَﺎﻟِﺤًﺎ ﻣَﻘْﺒُﻮْﻻً/ﻭَﺗِﺠَﺎﺭَﺓً ﻟَﻦْ ﺗَﺒُﻮْﺭًا/ﻳَﺎ ﻋَﺎﻟِﻢَ ﻣَﺎ ﻓِﻲْ اﻟﺼُّﺪُﻭْﺭِ/ﺃَﺧْﺮِﺟْﻨِﻲْ ﻳَﺎ اﻟﻠﻪُ /ﻣِﻦْ اﻟﻈُﻠُﻤَﺎﺕِ ﺇِﻟَﻰ اﻟﻨُﻮْﺭِ/اﻟﻠَّﻬُﻢَّ ﺇﻧِّﻲ ﺃَﺳﺄﻟُﻚَ/ﻣُﻮﺟِﺒَﺎﺕِ ﺭَﺣْﻤَﺘِﻚَ/ﻭَﻋَﺰَاﺋِﻢَ ﻣَﻐْﻔِﺮَﺗِﻚَ/ ﻭَاﻟﺴَّﻼﻣَﺔَ ﻣِﻦْ ﻛُﻞِّ ﺇﺛْﻢٍ/ﻭَاﻟﻔَﻮْﺯَ ﺑِﺎﻟﺠَﻨَّﺔِ/ﻭَاﻟﻨَّﺠﺎﺓَ ﻣِﻦَ اﻟﻨَّﺎﺭِ/اﻟﻠَّﻬُﻢَّ ﻗَﻨِّﻌْﻨِﻲْ/ﺑِﻤَﺎ ﺭَﺯَﻗْﺘَﻨِﻲْ/ﻭَﺑَﺎﺭِﻙْ ﻟِﻲْ/ﻓِﻴْﻤَﺎ ﺃَﻋْﻄَﻴْﺘَﻨِﻲْ/ ﻭَاﺧْﻠُﻒْ ﻋَﻠَﻲَّ/ﻛُﻞَّ ﻏَﺎﺋِﺒَﺔٍ ﻟِﻲْ/ﻣِﻨْﻚَ ﺑِﺨَﻴْﺮٍ',
        'transliteration':
            "Allahummaj'alhu hajjan mabrura wasa'yan masykura wa zanban maghfura wa'amalan salihan maqbula watijaratan lan tabura. Ya 'alima ma fissuduri akhrijni ya Allahu minazzulumati ilnannur. Allahumma inni as aluka mujibati rahmatika wa aza ima maghfiratika wassalamata min kulli ismin walganimata min kullibirin walfauza biljannati wannajata minannar. Rabbi qanni'ni bima razaqtani wabarkli fima a'tainani wakhluf'alayya kulla gaibatin li minkar bikhair",
        'translation':
            'Ya Allah, karuniakanlah haji yang mabrur, sa’i yang diterima, dosa yang diampuni, amal yang saleh, yang diterima dan usaha yang tidak akan mengalami rugi. Wahai Tuhan Yang Maha Mengetahui apa-apa yang terkandung dalam hati sanubari. Keluarkanlah aku dari kegelapan ke cahaya yang terang benderang. Ya Allah aku mohon kepada-Mu segala hal yang mendatangkan rahmat-Mu dan keteguhan ampunan-Mu, selamat dari segala dosa dan beruntung dengan mendapat berbagai kebaikan, beruntung memperoleh surga, terhindar dari siksa neraka. Tuhanku, puaskanlah aku dengan anugerah yang telah Engkau berikan, berkatilah untukku atas semua yang Engkau anugerahkan kepadaku dan gantilah apa-apa yang ghaib dari pandanganku dengan kebajikan darimu',
      },
      {
        'title': 'Istilam saat di Rukun Yamani',
        'arab': 'ﺑِﺴْﻢِ اﻟﻠﻪِ ﻭَاﻟﻠﻪُ ﺃَﻛْﺒَﺮ',
        'transliteration': 'Bismillahi Allahuakbar',
        'translation': 'Dengan menyebut Nama Allah, dan Allah Maha Besar',
      },
      {
        'title': 'Doa diantara Rukun Yamani dan Hajar Aswad',
        'arab':
            'رَبَّنا آتِنَا/فِي الدُّنْيَا حَسَنَةً/وَفِى الْأخِرَةِ حَسَنَةً/وَقِنَا عَذَابَ النَّارِ وَأَدْخِلْنَا الجَنةَ/مَعَ الأبْرَارِ/يَاعَزِيْزُيَاغَفَّارُ/يَارَبَّ العَالَمِيْنَ',
        'transliteration':
            "Robbana atina fiddun ya hasanah Wafil akhirati hasanatan waqina azabannar. Wa adhilnal jannata ma'al abrar, ya 'azizu ya ghafuru ya rabbal 'alamin",
        'translation':
            'Ya Tuhan kami, berilah kami kebaikan didunia dan kebaikan di akhirat dan hindarkanlah kami dari siksa neraka. Dan masukkanlah kami ke dalam surga bersama orang-orang yang saleh. Ya Tuhan yang Maha Perkasa, Maha Pengampun, Tuhan seru sekalian alam',
      },
    ],
    // Putaran 5
    [
      {
        'title': 'Istilam saat di Hajar Aswad',
        'arab': 'ﺑِﺴْﻢِ اﻟﻠﻪِ ﻭَاﻟﻠﻪُ ﺃَﻛْﺒَﺮ',
        'transliteration': 'Bismillahi Allahuakbar',
        'translation': 'Dengan menyebut Nama Allah, dan Allah Maha Besar',
      },
      {
        'title': 'Doa Putaran Kelima',
        'arab':
            'اﻟﻠَّﻬُﻢَّ ﺃَﻇِﻠَّﻨِﻲْ/ﺗَﺤْﺖَ ﻇِﻞِّ ﻋَﺮْﺷِﻚَ/ﻳَﻮْﻡَ ﻻَ ﻇِﻞَّ/ﺇﻻَّ ﻇِﻠُّﻚَ/ﻭَﻻَ ﺑَﺎﻗِﻲَ/ﺇﻻَّ ﻭَﺟْﻬُﻚَ/ﻭَاﺳْﻘِﻨِﻲْ/ﻣِﻦْ ﺣَﻮْﺽِ/ﻧَﺒِﻴَّﻚَ ﻣُﺤَﻤَّﺪٍ/ ﺷُﺮْﺑَﺔً ﻫَﻨِﻴْﺌَﺔً/ﻣَﺮِﻳْﺌَﺔً/ﻻَ ﺃَﻇْﻤَﺄُ/ﺑَﻌْﺪَﻫَﺎ ﺃﺑَﺪًا/اﻟﻠَّﻬُﻢَّ/ ﺇِﻧِّﻲْ ﺃَﺳْﺄﻟُﻚَ/ﻣِﻦْ ﺧَﻴْﺮِ ﻣَﺎ/ﺳَﺄﻟَﻚَ ﻣﻨْﻪُ/ﻧَﺒِﻴُّﻚَ ﻣُﺤَﻤَّﺪٌ/ﺻَﻠَّﻰ اﻟﻠَّﻪُ ﻋَﻠَﻴْﻪِ ﻭَﺳَﻠَّﻢَ/ﻭَﺃَﻋُﻮﺫُ ﺑِﻚَ/ﻣِﻦْ ﺷَﺮِّ ﻣَﺎ/اِﺳْﺘَﻌﺎﺫَﻙَ ﻣِﻨْﻪُ / ﻧَﺒِﻴُّﻚَ ﻣُﺤَﻤَّﺪٌ/ﺻﻠﻰ اﻟﻠّﻪ ﻋﻠﻴﻪ ﻭﺳﻠﻢ/اﻟﻠَّﻬُﻢَّ ﺇِﻧِّﻲْ/ﺃَﺳْﺄﻟُﻚَ اﻟﺠَﻨَّﺔَ/ ﻭَﻧَﻌِﻴْﻤَﻬَﺎ/ﻭَﻣَﺎ ﻳُﻘَﺮِّﺑُﻨِﻲْ/ﺇِﻟَﻴْﻬَﺎ/ﻣِﻦْ ﻗَﻮْﻝٍ/ﺃَﻭْ ﻓِﻌْﻞٍ/ﺃﻭْ ﻋَﻤَﻞٍ/ﻭﺃﻋُﻮﺫُ ﺑِﻚَ/ﻣِﻦَ اﻟﻨَّﺎﺭِ/ ﻭَﻣَﺎ ﻳُﻘَﺮِّﺑُﻨِﻲْ/ﺇﻟَﻴْﻬﺎ/ﻣِﻦْ ﻗَﻮْﻝٍ/ﺃَﻭْ ﻓِﻌْﻞٍ/ﺃﻭْﻋَﻤَﻞِ',
        'transliteration':
            "Allahumma azillani tahta zilli 'arsyika yauma lazilla illa zilluka wala baqiya illa wajhuka wa asqini minhaudi nabiyyika Muhammadin sallallahu 'alaihi wasallam syurbatan hani atan mari atan la azma u ba'daha abada. Allahumma inni as aluka min khairima sa alaka minhu nabiyyuka Muhammadun sallallahu 'alaihi wasallam wa 'audzubika min syarri masta 'azaka minhu nabiyyuka Muhammadun sallallahu 'alaihi wasallam. Allahumma inni as alukal jannata wana'imaha wama yuqarribuni ilaiha minqaulin au fi'lin au 'amalin wa a'udzubika minannari wama yuqarribuni ilaiha min qaulin au fi' lin au'amalin",
        'translation':
            "Ya Allah lindungilah aku dibawah lindunganMu pada hari yang tidak ada naungan selain dari naunganMu dan tidak ada yang tinggal kekal selain wajahMu. Dan berilah aku minuman dari telaga Nabi Muhammad SAW dengan suatu minuman yang lezat nyaman, sesudah itu aku tidak akan haus untuk selamanya. Ya Allah, aku mohon padaMu kebaikan yang diminta oleh Nabi Muhammad SAW, dan aku berlindung padaMu dari kejahatan dan minta perlindunganMu daripada yang diminta Nabi Muhammad SAW. Ya Allah, aku mohon padaMu surga serta nikmatNya dan apapun yang dapat mendekatkan aku padaNya dari perkataan atau perbuatan ataupun amal. Dan aku berlindung padaMu dari neraka serta apapun yang mendekatkan aku kepadaNya, baik ucapan, perbuatan ataupun amal",
      },
      {
        'title': 'Istilam saat di Rukun Yamani',
        'arab': 'ﺑِﺴْﻢِ اﻟﻠﻪِ ﻭَاﻟﻠﻪُ ﺃَﻛْﺒَﺮ',
        'transliteration': 'Bismillahi Allahuakbar',
        'translation': 'Dengan menyebut Nama Allah, dan Allah Maha Besar',
      },
      {
        'title': 'Doa diantara Rukun Yamani dan Hajar Aswad',
        'arab':
            'رَبَّنا آتِنَا/فِي الدُّنْيَا حَسَنَةً/وَفِى الْأخِرَةِ حَسَنَةً/وَقِنَا عَذَابَ النَّارِ وَأَدْخِلْنَا الجَنةَ/مَعَ الأبْرَارِ/يَاعَزِيْزُيَاغَفَّارُ/يَارَبَّ العَالَمِيْنَ',
        'transliteration':
            "Robbana atina fiddun ya hasanah Wafil akhirati hasanatan waqina azabannar. Wa adhilnal jannata ma'al abrar, ya 'azizu ya ghafuru ya rabbal 'alamin",
        'translation':
            'Ya Tuhan kami, berilah kami kebaikan didunia dan kebaikan di akhirat dan hindarkanlah kami dari siksa neraka. Dan masukkanlah kami ke dalam surga bersama orang-orang yang saleh. Ya Tuhan yang Maha Perkasa, Maha Pengampun, Tuhan seru sekalian alam',
      },
    ],
    //Putaran ke 6
    [
      {
        'title': 'Istilam saat di Hajar Aswad',
        'arab': 'ﺑِﺴْﻢِ اﻟﻠﻪِ ﻭَاﻟﻠﻪُ ﺃَﻛْﺒَﺮ',
        'transliteration': 'Bismillahi Allahuakbar',
        'translation': 'Dengan menyebut Nama Allah, dan Allah Maha Besar',
      },
      {
        'title': 'Doa Putaran Keenam',
        'arab':
            'اﻟﻠَّﻬُﻢَّ/ﺇﻥَّ ﻟَﻚَ ﻋَﻠَﻲَّ/ﺣُﻘُﻮْﻗﺎً ﻛَﺜِﻴْﺮَﺓً/ﻓِﻴْﻤَﺎ ﺑَﻴْﻨِﻲْ/ﻭَﺑَﻴْﻨَﻚَ/ﻭَﺣُﻘُﻮْﻗﺎً ﻛَﺜِﻴْﺮَﺓً/ﻓِﻴْﻤَﺎ ﺑَﻴْﻨِﻲْ/ﻭَﺑَﻴْﻦَ ﺧَﻠْﻘِﻚَ/اﻟﻠَّﻬُﻢَّ/ﻣَﺎ ﻛَﺎﻥَ/ﻟَﻚَ ﻣِﻨْﻬَﺎ/ ﻓَﺎﻏْﻔِﺮْﻟِﻲْ/ﻭَﻣَﺎ ﻛَﺎﻥَ/ﻟِﺨَﻠْﻘِﻚَ/ﻓَﺘَﺤَﻤَّﻠْﻪُ ﻋَﻨِّﻲْ/ﻭﺃﻏْﻨِﻨِﻲ/ﺑﺤَﻼﻟِﻚَ/ﻋَﻦْ ﺣَﺮَاﻣِﻚَ/ﻭَﺑِﻄﺎﻋَﺘِﻚَ/ﻋَﻦْ ﻣَﻌْﺼِﻴَﺘِﻚَ/ﻭَﺑِﻔَﻀْﻠِﻚَ/ ﻋَﻤَّﻦ ﺳِﻮَاﻙَ/ﻳَﺎ ﻭَاﺳِﻊَ اﻟﻤَﻐْﻔِﺮَﺓِ/اﻟﻠَّﻬُﻢَّ/ﺇِﻥَّ ﺑَﻴْﺘَﻚَ/ﻋَﻈِﻴْﻢٌ/ﻭَﻭَﺟْﻬَﻚَ ﻛَﺮِﻳْﻢٌ/ﻭَﺃَﻧْﺖَ ﻳَﺎ اﻟﻠﻪُ/ﻋَﻈِﻴْﻢٌ/ﺗُﺤِﺐُّ اﻟﻌَﻔْﻮَ/ﻓَﺎﻋْﻒُ ﻋَﻨِّﻲ',
        'transliteration':
            "Allahumma inna laka 'alayya huquqan kasiratan fima baini wabainaka wahuquqan kasiratan fima baini wabaina khalqika. Allahumma makana laka minha faghfurhu li wama kana likhalqika fatahammalhu 'aini waghnini bihalalika 'an haramika wabita'atika 'an ma'siyatika wabifadlika 'amman siwaka ya wasi'al maghfirah. Allahumma inna baitaka 'azim, wawajhaka karim, wa anta ya Allahu halimun karimun azimun tuhibbul 'afwa fa'fu 'anni",
        'translation':
            "Ya Allah, sesungguhnya Engkau mempunya hak yang banyak sekali atas diriku dalam hubungan antara aku dengan Mu. Dan Engkau juga mempunya hak yang banyak sekali dalam hubungan antara aku dengan makhlukMu. Ya Allah, apa yang menjadi hakMu atas diriku, maka ampunilah aku. Dan apa saja yang menjadi hak makhlukMu atas diriku, maka tanggungkanlah dariku. Cukupkanlah diriku dengan rizkiMu yang halal, terhindar dari yang haram. Dan dengan ta’at kepadaMu, terhindar dari kemaksiatan. Dan dengan anugerahMu terhindar daripada mengharap dari selain daripadaMu, wahai Tuhan Yang Maha Luas pengampunanNya. Ya Allah, sesungguhnya rumahMu ini agung, Zat Mu pun sungguh mulia, dan Engkau ya Allah, Maha Penyabar, Maha Pemurah dan Maha Agung, Engkau suka memberi ampun, maka ampunilah aku",
      },
      {
        'title': 'Istilam saat di Rukun Yamani',
        'arab': 'ﺑِﺴْﻢِ اﻟﻠﻪِ ﻭَاﻟﻠﻪُ ﺃَﻛْﺒَﺮ',
        'transliteration': 'Bismillahi Allahuakbar',
        'translation': 'Dengan menyebut Nama Allah, dan Allah Maha Besar',
      },
      {
        'title': 'Doa diantara Rukun Yamani dan Hajar Aswad',
        'arab':
            'رَبَّنا آتِنَا/فِي الدُّنْيَا حَسَنَةً/وَفِى الْأخِرَةِ حَسَنَةً/وَقِنَا عَذَابَ النَّارِ وَأَدْخِلْنَا الجَنةَ/مَعَ الأبْرَارِ/يَاعَزِيْزُيَاغَفَّارُ/يَارَبَّ العَالَمِيْنَ',
        'transliteration':
            "Robbana atina fiddun ya hasanah Wafil akhirati hasanatan waqina azabannar. Wa adhilnal jannata ma'al abrar, ya 'azizu ya ghafuru ya rabbal 'alamin",
        'translation':
            'Ya Tuhan kami, berilah kami kebaikan didunia dan kebaikan di akhirat dan hindarkanlah kami dari siksa neraka. Dan masukkanlah kami ke dalam surga bersama orang-orang yang saleh. Ya Tuhan yang Maha Perkasa, Maha Pengampun, Tuhan seru sekalian alam',
      },
    ],
    //Putaran ke 7
    [
      {
        'title': 'Istilam saat di Hajar Aswad',
        'arab': 'ﺑِﺴْﻢِ اﻟﻠﻪِ ﻭَاﻟﻠﻪُ ﺃَﻛْﺒَﺮ',
        'transliteration': 'Bismillahi Allahuakbar',
        'translation': 'Dengan menyebut Nama Allah, dan Allah Maha Besar',
      },
      {
        'title': 'Doa Putaran Ketujuh',
        'arab':
            'اللَّهُمَّ إِنِّي أَسْأَلُكَ إِيْمَاناً كَامِلًا وَيَقِينًا صَادِقًا وَرِزْقًا وَاسِعًا وَقَلْبًا خَاشِعًا ولِسَانًا ذَاكِرًا وَحَلَالًا طَيِّبًا وَتَوْبَةً نَصُوحًا وَتَوْبَةً قَبْلَ المَوْتِ وَرَاحَةً عِنْدَ المَوْتِ وَمَغْفِرَةً وَرَحْمَةً بَعْدَ الَموْتِ وَالْعَفْوَ عِنْدَ الحِساَبِ واَلفَوْزَ بِالْجَنَّةِ وَالنَّجَاةِ مِنَ النَّارِ بِرَحْمَتِكَ يَا عَزِيْزُ بِاْلصَالِحِينَ',
        'transliteration':
            "Allhumma innii as'aluka iimaanan kaamilan wa yaqiinan shaadiqan wa rizqan waasi'an wa qalban khaasyi'an wa lisaaanan dzaakiran wa halaalan thayyiban wa taubatan nashuuhan wa taubatan qablal mauti wa maghfiratan wa rahmatan ba'dal mauti wal 'afwa 'indal hisaabi wal fauza bil jannati wannajaata minannaari birahmatika yaa 'aziizu bishshaalihin",
        'translation':
            "Ya Allah, aku mohon pada-Mu iman yang sempurna, keyakinan yang benar, ilmu yang bermanfaat, rezeki yang luas, rezeki yang halal dan baik, hati yang khusyu', lidah yang selalu berzikir, taubat yang semurni murninya dan taubat sebelum mati, ampunan dan rahmat sesudah mati.",
      },
      {
        'title': 'Istilam saat di Rukun Yamani',
        'arab': 'ﺑِﺴْﻢِ اﻟﻠﻪِ ﻭَاﻟﻠﻪُ ﺃَﻛْﺒَﺮ',
        'transliteration': 'Bismillahi Allahuakbar',
        'translation': 'Dengan menyebut Nama Allah, dan Allah Maha Besar',
      },
      {
        'title': 'Doa diantara Rukun Yamani dan Hajar Aswad',
        'arab':
            'رَبَّنا آتِنَا/فِي الدُّنْيَا حَسَنَةً/وَفِى الْأخِرَةِ حَسَنَةً/وَقِنَا عَذَابَ النَّارِ وَأَدْخِلْنَا الجَنةَ/مَعَ الأبْرَارِ/يَاعَزِيْزُيَاغَفَّارُ/يَارَبَّ العَالَمِيْنَ',
        'transliteration':
            "Robbana atina fiddun ya hasanah Wafil akhirati hasanatan waqina azabannar. Wa adhilnal jannata ma'al abrar, ya 'azizu ya ghafuru ya rabbal 'alamin",
        'translation':
            'Ya Tuhan kami, berilah kami kebaikan didunia dan kebaikan di akhirat dan hindarkanlah kami dari siksa neraka. Dan masukkanlah kami ke dalam surga bersama orang-orang yang saleh. Ya Tuhan yang Maha Perkasa, Maha Pengampun, Tuhan seru sekalian alam',
      },
      {
        'title': 'Doa Setelah Tawaf',
        'arab':
            'اﻟﻠَّﻬُﻢَّ/ﺇِﻧَّﻚَ ﺗَﻌْﻠَﻢُ/ﺳِﺮِّﻱْ ﻭَﻋَﻼَﻧِﻴَﺘِﻲْ/ﻓَﺎﻗْﺒَﻞْ ﻣَﻌْﺬِﺭَﺗِﻲْ/ﻭَﺗَﻌْﻠَﻢُ ﺣَﺎﺟَﺘِﻲْ/ﻓَﺎﻋْﻄِﻨِﻲْ ﺳُﺆْﻟِﻲْ/ﻭَﺗَﻌْﻠَﻢُ ﻣَﺎ ﻓِﻲْ ﻧَﻔْﺴِﻲْ/ﻓَﺎﻏْﻔِﺮْ ﻟِﻲْ ﺫُﻧُﻮْﺑِﻲْ/اﻟﻠَّﻬُﻢَّ/ ﺇِﻧِّﻲْ ﺃَﺳْﺄﻟُﻚَ/ﺇِﻳْﻤَﺎﻧًﺎ ﺩَاﺋِﻤًﺎ/ﻳُﺒَﺎﺷِﺮُ ﻗَﻠْﺒِﻲْ/ﻭَﻳَﻘِﻴْﻨًﺎ ﺻَﺎﺩِﻗﺎً/ﺣَﺘَّﻰ ﺃَﻋْﻠَﻢَ/ﺃَﻧَّﻪُ ﻻَ ﻳُﺼِﻴْﺒُﻨِﻲْ/ﺇِﻻَّ ﻣَﺎﻛَﺘَﺒْﺖَ ﻟِﻲْ/ﺭِﺿًﺎ ﻣِﻨْﻚَ/ﺑِﻤَﺎ ﻗَﺴَﻤْﺖَ ﻟِﻲْ/ﺃَﻧْﺖَ ﻭَﻟِﻲِّ/ﻓِﻲْ اﻟﺪُﻧْﻴَﺎ ﻭَاﻵﺧِﺮَﺓِ/ ﺗَﻮَﻓَّﻨِﻲْ ﻣُﺴْﻠِﻤِﻴﻦَ/ﻭَﺃَﻟْﺤِﻘْﻨِﻰ/ﺑِﺎﻟﺼَّﺎﻟِﺤِﻴﻦَ/اﻟﻠَّﻬُﻢَّ/ﻻَ ﺗَﺪَﻉْ ﻟَﻨَﺎ/ﻓِﻲ ﻣَﻘَﺎﻣِﻨَﺎﻫَﺬَا/ﺫَﻧْﺒًﺎ ﺇﻻَّ ﻏَﻔَﺮْﺗَﻪُ/ ﻭَﻻَ ﻫَﻤًّﺎ ﺇﻻَّ ﻓَﺮَّﺟْﺘَﻪُ/ﻭَﻻَ ﺣَﺎﺟَﺔً ﺇﻻَّ ﻗَﻀَﻴْﺘَﻬَﺎ/ﻭَﻳَﺴَّﺮْﺗَﻬَﺎ/ﻓَﻴَﺴِّﺮْ ﺃُﻣُﻮْﺭَﻧَﺎ/ﻭَاﺷْﺮَﺡْ ﺻُﺪُﻭْﺭَﻧَﺎ/ﻭَﻧَﻮِّﺭْ ﻗُﻠُﻮْﺑَﻨَﺎ/ﻭَاﺧْﺘِﻢْ ﺑِﺎﻟﺼَّﺎﻟِﺤَﺎﺕِ ﺃَﻋْﻤَﺎﻟِﻨَﺎ/اﻟﻠَّﻬُﻢَّ/ﺗَﻮَﻓَّﻨَﺎ ﻣُﺴْﻠِﻤِﻴﻦَ/ﻭَﺃَﺣْﻴِﻨَﺎ ﻣُﺴْﻠِﻤِﻴﻦَ/ﻭَﺃَﻟْﺤِﻘْﻨَﺎ ﺑِﺎﻟﺼَّﺎﻟِﺤِﻴﻦَ/ﻏَﻴْﺮَ ﺧَﺰَاﻳَﺎ/ﻭَﻻَ ﻣَﻔْﺘُﻮْﻧِﻴﻦ',
        'transliteration':
            "Allahumma innaka ta'lamu sirri wa'alaniyati faqbal ma'zirati wata'lamu hajati fa'tini su'li wata'lamu ma fi nafsi fagfirli zunubi. Allahumma inni as aluka imanan da iman yubasyiru qalbi wayaqinan sadiqan hatta a'lama annahu layusibuni illa ma katabta li waraddini bima qasamtahu li ya arhamar rahimin. Anta waliyyi fiddunya wal akhirati tawaffani musliman wa alhiqni bissalihin Allahuma latada' lana fimaqamina haza zanban illa gafartahu walahamman illa farrajtahu wala hajatan illa gadaitaha wayassartaha fayassir umurana wasyrah sudurana wa nawwir qulubana wakhtim bissalihati a'malana. Allahumma tawaffana muslimina wa ahyina muslimin, wa alhiqna bissalihina gaira khazaya wala maftunin",
        'translation':
            "Ya Allah, sesungguhnya Engkau Maha Mengetahui rahasiaku yang tersembunyi dan amal perbuatanku yang nyata, maka terimalah ratapanku. Engkau Maha Mengetahui keperluanku, kabulkanlah permohonanku. Engkau Maha Mengetahui apapun yang terkandung dalam hatiku, maka ampunilah dosaku. Ya Allah, aku ini mohon pada-Mu iman yang tetap yang melekat terus di hati, keyakinan yang sungguh-sungguh sehingga aku dapat mengetahui bahwa tiada suatu yang menimpa daku selain dari yang Engkau tetapkan bagiku. Jadikanlah aku rela terhadap apapun yang Engkau bagikan padaku. Wahai Tuhan yang Maha Pengasih dari segala yang pengasih. Engkau adalah pelindungku di dunia dan di akhirat. Wafatkanlah aku dalam keadaan muslim dan gabungkanlah kami kedalam orang-orang shaleh. Ya Allah, janganlah Engkau biarkan di tempat kami itu suatu dosapun kecuali Engkau ampunkan, tiada suatu kesusahan hati, kecuali Engkau lapangkan, tiada satu hajat keperluan kecuali Engkau penuhi dan mudahkan, maka mudahkanlah segenap urusan kami dan lapangkanlah dada kami, terangkan hati kami dan sudahilah semua amal perbuatan kami dengan amal yang shaleh. Ya Allah matikanlah kami dalam keadaan muslim, hidupkanlah kami dalam keadaan muslim, dan masukkanlah kami kedalam golongan orang-orang yang shaleh tanpa kenistaan dan fitnah",
      },
      {
        'title': 'Doa saat minum Air Zam-Zam',
        'arab':
            'اﻟﻠَّﻬُﻢَّ/ﺇِﻧِّﻲ ﺃَﺳﺄﻟُﻚَ/ﻋِﻠْﻤﺎً ﻧﺎﻓِﻌﺎً/ ﻭَﺭِﺯْﻗﺎً ﻭَاﺳِﻌًﺎ/ﻭَﺷِﻔَﺎءً/ﻣِﻦْ ﻛُﻞِّ ﺩَاءٍ ﻭَﺳَﻘَﻢٍ/ﺑِﺮَﺣْﻤَﺘِﻚَ/ﻳَﺎ ﺃَﺭْﺣَﻢَ اﻟﺮَّاﺣِﻤِﻴْﻦ',
        'transliteration':
            "Allahumma innii as aluka ‘ilman naafi’an wa rizqan waasi’an wasyifaa an min kulli daa in wasaqamin birahmatika yaa arhamarraahimiin",
        'translation':
            "Ya Allah, aku mohon kepadaMu ilmu pengetahuan yang bermanfaat, rizki yang luas dan sembuh dari segala sakit dan penyakit pikun dengan rahmatMu ya Allah yang Maha Pengasih lagi Maha Penyayang",
      },
    ],
  ];

  final List<List<Map<String, String>>> doaListSai = [
    // Memulai dari putaran 1
    [
      {
        'title': 'Doa saat akan mendaki Bukit Safa sebelum Sai',
        'arab':
            'ﺑِﺴْﻢِ اﻟﻠَّﻪِ اﻟﺮَّﺣْﻤَﻦِ اﻟﺮَّﺣِﻴﻢِ / ﺃَﺑْﺪَﺃُ ﺑِﻤَﺎ / ﺑَﺪَﺃَ اﻟﻠﻪُ ﺑِﻪِ ﻭَﺭَﺳُﻮْﻟُﻪُ / ﺇِﻥَّ اﻟﺼَّﻔَﺎ/ ﻭَاﻟْﻤَﺮْﻭَﺓَ / ﻣِﻦْ ﺷَﻌَﺎﺋِﺮِ اﻟﻠَّﻪِ / ﻓَﻤَﻦْ ﺣَﺞَّ اﻟْﺒَﻴْﺖَ/ ﺃَﻭِ اﻋْﺘَﻤَﺮَ / ﻓَﻼَ ﺟُﻨَﺎﺡَ ﻋَﻠَﻴْﻪِ / ﺃَﻥْ ﻳَﻄَّﻮَّﻑَ ﺑِﻬِﻤَﺎ / ﻭَﻣَﻦْ ﺗَﻄَﻮَّﻉَ ﺧَﻴْﺮًا / ﻓَﺈِﻥَّ اﻟﻠَّﻪَ / ﺷَﺎﻛِﺮٌ ﻋَﻠِﻴﻢ',
        'transliteration':
            "Bismillahirrahmanirrahim, Abda u bimabada allahu bihi warasuluh. Innas safa walmarwata min sya'a irillah. Faman hajjal baita awi' tamara fala junaha 'alaihi ayyattawwafa bihima waman tatawwa'a khairan fainnallaha syakirun 'alim",
        'translation':
            "Dengan nama Allah Yang Maha Pengasih lagi Maha Penyayang. Aku mulai dengan apa yang telah dimulai oleh Allah dan Rasul-Nya. Sesungguhnya Shafa dan Marwah sebagian dari syiar-syiar (tanda kebesaran) Allah. Maka barang siapa yang beribadah haji ke Baitullah ataupun berumrah, maka tidak ada dosa baginya mengerjakan sa'i antara keduanya. Dan barang siapa yang mengerjakan suatu kebajikan dengan rela hati, maka sesungguhnya Allah Maha Penerima Kebaikan lagi Maha Mengetahui. ",
      },
      {
        'title': 'Doa ketika memulai Sai (Menghadap Ka\'bah)',
        'arab':
            "َاَﻟﻠﻪُ ﺃَﻛْﺒَﺮُ /، اَﻟﻠﻪُ ﺃَﻛْﺒَﺮُ /، اَﻟﻠﻪُ ﺃَﻛْﺒَﺮُ /، ﻭَﻟِﻠَّﻪِ اﻟﺤَﻤْﺪُ /. اﻟﻠَّﻪُ ﺃَﻛْﺒَﺮُ / ﻋَﻠَﻰ ﻣَﺎ ﻫَﺪَاﻧَﺎ /، ﻭَاﻟﺤَﻤْﺪُ ﻟِﻠَّﻪِ / ﻋَﻠَﻰ ﻣَﺎ ﺃَﻭْﻻَﻧﺎَ /. ﻻَ ﺇﻟَﻪَ ﺇِﻻَّ اﻟﻠﻪُ /، ﻭَﺣْﺪَﻩُ ﻻَ ﺷَﺮِﻳﻚَ ﻟَﻪُ /، ﻟَﻪُ اﻟْﻤُﻠْﻚُ /، ﻭَﻟَﻪُ اﻟْﺤَﻤْﺪُ / ﻳُﺤْﻴﻲ ﻭﻳُﻤِﻴْﺖُ /، ﺑِﻴَﺪِﻩِ اﻟﺨَﻴْﺮُ /، ﻭَﻫُﻮَ ﻋَﻠَﻰ ﻛُﻞِّ ﺷَﻲْءٍ ﻗَﺪِﻳﺮٌ /. ﻻَ ﺇِﻟَﻪَ ﺇِﻻَّ اﻟﻠﻪُ / ﻭَﺣْﺪَﻩُ ﻻَ ﺷَﺮِﻳﻚَ ﻟَﻪُ /، ﺃَﻧْﺠَﺰَ ﻭَﻋْﺪَﻩُ / ﻭَﻧَﺼَﺮَ ﻋَﺒْﺪَﻩُ / ﻭَﻫَﺰَﻡَ اﻷَﺣْﺰَاﺏَ ﻭَﺣْﺪَﻩُ /، ﻻَ ﺇﻟَﻪَ ﺇِﻻَّ اﻟﻠﻪُ /، ﻭَﻻَ ﻧَﻌْﺒُﺪُ ﺇِﻻَّ ﺇِﻳَّﺎﻩُ /ﻣُﺨْﻠِﺼِﻴْﻦَ ﻟَﻪُ اﻟﺪِّﻳْﻦَ /، ﻭَﻟَﻮْ ﻛَﺮِﻩَ اﻟﻜَﺎﻓِﺮُﻭْﻥ",
        'transliteration':
            "Allahuakbar Allahuakbar Allahuakbar walillahil hamdu. Allahuakbar 'alama hadana walhamdu lillahi 'alama aulana la ilaha illallahu wahdahu la syarika lahu, lahul mulku walahul hamdu yuhyi wayumitu biyadihil khairu wahua 'ala kulli syai in qadir. La ilaha illallahu wahdahu la syarikalah anjaza wa'dahu wanasara 'abdahu wahazamal ahzaba wahdah. La ilaha illallahu wala na'budu illa iyyahu mukhlisina lahuddina walau karihal kafirun",
        'translation':
            "Allah Maha Besar, Allah Maha Besar, Allah Maha Besar. Segala puji bagi Allah, Allah Maha Besar, atas petunjuk yang diberikan-Nya kepada kami, segala puji bagi Allah atas karunia yang telah dianugerahkan-Nya kepada kami, tidak ada Tuhan selain Allah Yang Maha Esa, tidak ada sekutu bagi-Nya. Bagi-Nya kerajaan dan pujian. Dialah yang menghidupkan dan mematikan, pada kekuasaan-Nya lah segala kebaikan dan Dia berkuasa atas segala sesuatu. Tiada Tuhan selain Allah Yang Maha Esa, tidak ada sekutu bagiNya, yang telah menempati janji-Nya, menolong hamba-Nya dan menghancurkan sendiri musuh-musuh-Nya. Tidak ada Tuhan selain Allah dan kami tidak menyembah kecuali kepada-Nya dengan memurnikan (ikhlas) kepatuhan semata kepada-Nya walaupun orang-orang kafir membenci",
      },
      {
        'title': 'Sai perjalanan pertama dari Safa menuju Marwah',
        'arab':
            "اﻟﻠﻪُ ﺃَﻛْﺒَﺮُ / اﻟﻠﻪُ ﺃَﻛْﺒَﺮُ / اﻟﻠﻪُ ﺃَﻛْﺒَﺮُ / اﻟﻠﻪُ ﺃَﻛْﺒَﺮُ ﻛَﺒِﻴْﺮًا / ﻭَاﻟﺤَﻤْﺪُ ﻟِﻠَّﻪِ ﻛَﺜِﻴْﺮًا / ﻭَﺳُﺒْﺤﺎﻥَ اﻟﻠﻪِ / ﻭﺑِﺤَﻤْﺪِﻩِ اﻟﻌَﻈِﻴْﻢِ / ﻭَﺑِﺤَﻤْﺪِﻩِ اﻟﻜَﺮِﻳْﻢِ /ﺑُﻜْﺮَﺓً ﻭَﺃﺻِﻴْﻼً / ﻭَﻣِﻦَ اﻟﻠَّﻴْﻞِ/ ﻓَﺎﺳْﺠُﺪْ ﻟَﻪُ / ﻭَﺳَﺒِّﺤْﻪُ/ ﻟَﻴْﻼً ﻃَﻮِﻳْﻼً / ﻻَ ﺇِﻟﻪَ ﺇِﻻَّ اﻟﻠﻪُ / ﺃﻧﺠَﺰَ ﻭَﻋْﺪَﻩُ / ﻭَﻧَﺼَﺮَ ﻋَﺒْﺪَﻩُ / ﻭَﻫَﺰَﻡَ اﻷﺣْﺰَاﺏَ ﻭَﺣْﺪَﻩُ / ﻻَ ﺷَﻲْءَ ﻗَﺒْﻠَﻪُ / ﻭَﻻَ ﺑَﻌْﺪَﻩُ / ﻳُﺤْﻴِﻲ ﻭﻳُﻤِﻴﺖُ / ﻭَﻫُﻮَ ﺣَﻲٌّ/ ﺩَاﺋِﻢٌ ﻻ ﻳَﻤُﻮﺕُ / ﻭَﻻَ ﻳَﻔُﻮْﺕُ ﺃَﺑَﺪًا / ﺑِﻴَﺪِﻩِ اﻟﺨَﻴْﺮُ/ ﻭَﺇِﻟَﻴْﻪِ اﻟﻤَﺼِﻴْﺮُ / ﻭَﻫُﻮَ ﻋﻠﻰ ﻛُﻞّ ﺷَﻲْءٍ ﻗَﺪِﻳﺮ",
        'transliteration':
            "Allahuakbar, Allahuakbar, Allahuakbar, Allahuakbar kabira, Walhamdulillahi kasira. Wasubhanallahil'azimi wabihamdihil karimi bukratawwa asila. Waminanallaili fasjud lahu wasabbih-hu lailan tawila. La ilaha illallahu wahdah anjaza wa'dah. Wanasara 'abdah wahazamal ahzaba wahdah. La Syai a qablahu wala ba'dah. Yuhyi wayumitu wahua hayyun da imun layamutu walayafutu abada. Biyadihil khairu wa ilaihil masir. Wahuwa'ala kulli syai'in qadir",
        'translation':
            "Allah Maha Besar, Allah Maha Besar, Allah Maha Besar, Allah Maha Besar, dengan segala kebesaran-Nya. Segala puji bagi Allah Yang Maha Agung dengan segala puji-Nya yang tidak terhingga. Maha Suci Allah Yang Maha Agung dengan pujian, yang Maha Mulia diwaktu pagi dan petang. Dan pada sebagian malam, bersujud dan bertasbihlah pada-Nya sepanjang malam. Tidak ada Tuhan selain Allah yang Maha Esa yang menempati janji-Nya membela hamba-hamba-Nya yang menghancurkan musuh-musuh-Nya dan tidak ada sekutu sebelum-Nya dan tidak ada sesuatupun sesudah-Nya. Dialah yang menghidupkan dan mematikan dan Dia adalah Maha Hidup kekal tiada mati dan tiada musuh (hilang ) untuk selama-lamanya. Hanya ditangan-Nyalah terletak kebajikan dan kepada-Nyalah tempat kembali dan Hanya Dialah Yang Maha Kuasa atas segala sesuatu",
      },
      {
        'title': 'Doa saat di Bathnul Wadi (Lampu / Pilar Hijau)',
        'arab':
            "ﺭَﺏّ اﻏْﻔِﺮْ/ ﻭَاﺭْﺣَﻢْ / ﻭَاﻋْﻒُ/ ﻭَﺗَﻜَﺮَّﻡْ / ﻭَﺗَﺠَﺎﻭَﺯْ/ ﻋَﻤَّﺎ ﺗَﻌْﻠَﻢُ / ﺇﻧَّﻚَ ﺗَﻌْﻠَﻢُ/ ﻣَﺎﻻَ ﻧَﻌْﻠَﻢْ / ﺇﻧَّﻚَ/ ﺃَﻧْﺖَ اﻟﻠﻪُ / اﻷَﻋَﺰُّ اﻷَﻛْﺮَﻡ",
        'transliteration':
            "Rabbighfir warham wa'fu watakarram watajawaz 'amma ta'lam innaka ta'lamu mala na'lam. Innaka antallahul a'azzul akram",
        'translation':
            "Ya Allah ampunilah, sayangilah, maafkanlah, bermurah hatilah dan hapuskanlah apa-apa yang Engkau ketahui dari dosa kami. Sesungguhnya Engkau Maha Mengetahui apa-apa yang kami sendiri tidak tahu. Sesungguhnya Engkau Ya Allah Maha Tinggi dan Maha Pemurah",
      },
      {
        'title': 'Doa ketika mendekati Marwah',
        'arab':
            "ﺇِﻥَّ اﻟﺼَّﻔَﺎ ﻭَاﻟْﻤَﺮْﻭَﺓَ / ﻣِﻦْ ﺷَﻌَﺎﺋِﺮِ اﻟﻠﻪَ / ﻓَﻤَﻦْ ﺣَﺞَّ اﻟْﺒَﻴْﺖَ ﺃَﻭِ اﻋْﺘَﻤَﺮَ / ﻓَﻼَ ﺟُﻨَﺎﺡَ ﻋَﻠَﻴْﻪِ / ﺃَﻥْ ﻳَﻄَّﻮَّﻑَ ﺑِﻬِﻤَﺎ / ﻭَﻣَﻦْ ﺗَﻄَﻮَّﻉَ ﺧَﻴْﺮًا / ﻓَﺈِﻥَّ اﻟﻠﻪَ ﺷَﺎﻛِﺮٌ ﻋَﻠِﻴﻢ",
        'transliteration':
            "Innas safa walmarwata min sya'a irillah. Faman hajjal baita awi' tamara fala junaha 'alaihi ayyattawwafa bihima waman tatawwa'a khairan fainnallaha syakirun 'alim ",
        'translation':
            "Sesungguhnya Shafa dan Marwah sebagian dari syiar-syiar (tanda kebesaran) Allah. Maka barangsiapa yang beribadah haji ke Baitullah ataupun ber-umroh, maka tidak ada dosa baginya mengerjakan sa’i antara keduanya. Dan barangsiapa yang mengerjakan suatu kebajikan dengan kerelaan hati, maka sesungguhnya Allah Maha Penerima Kebaikan lagi Maha Mengetahui",
      },
      // Tambahkan doa lainnya untuk putaran 1
    ],
    // Sai ke 2
    [
      {
        'title': 'Sai perjalanan kedua dari Marwah menuju Safa',
        'arab':
            "اﻟﻠﻪُ ﺃﻛْﺒَﺮُ / اﻟﻠﻪُ ﺃﻛْﺒَﺮُ / اﻟﻠﻪُ ﺃﻛْﺒَﺮُ / اﻟﻠﻪُ ﺃﻛْﺒَﺮُ/ ﻭﻟِﻠَّﻪِ اﻟﺤَﻤْﺪُ / ﻻَ ﺇِﻟﻪَ ﺇِﻻَّ اﻟﻠﻪُ / اﻟﻮَاﺣِﺪُ/ اﻟﻔَﺮْﺩُ اﻟﺼَّﻤَﺪُ / اﻟﺬِﻱْ ﻟَﻢْ ﻳّﺘَّﺨٍﺬ/ ﺻَﺎﺣِﺒَﺔً / ﻭَﻻَ ﻭَﻟَﺪًاْ / ﻭَﻟَﻢْ ﻳَﻜُﻦْ/ ﻟَﻪُ ﺷَﺮِﻳﻚٌ / ﻓِﻲ اﻟْﻤُﻠْﻚِ / ﻭَﻟَﻢْ ﻳَﻜُﻦْ/ ﻟَﻪُ ﻭَﻟِﻲٌّ / ﻣِﻦَ اﻟﺬُّﻝِّ / ﻭَﻛَﺒِّﺮْﻩُ ﺗَﻜْﺒِﻴﺮًا / اﻟﻠَّﻬُﻢَّ/ ﺇِﻧَّﻚَ ﻗُﻠْﺖَ / ﻓِﻲْ ﻛِﺘَﺎﺑِﻚَ اﻟﻤُﻨَﺰَّﻝِ / اُﺩْﻋُﻮْﻧِﻲ/ ﺃﺳْﺘَﺠِﺐْ ﻟَﻜُﻢْ / ﺩَﻋَﻮْﻧَﺎﻙَ ﺭَﺑَّﻨَﺎ / ﻛَﻤَﺎ ﺃَﻣَﺮْﺗَﻨَﺎ / ﻓَﺎﻏْﻔِﺮْ ﻟَﻨَﺎ/ ﻛَﻤَﺎ ﻭَﻋَﺪْﺗَﻨَﺎ / ﺇِﻧَّﻚَ/ ﻻ ﺗُﺨْﻠِﻒُ اﻟﻤِﻴْﻌَﺎﺩَ / ﺭَﺑَّﻨَﺎ ﺇِﻧَّﻨَﺎ / ﺳَﻤِﻌْﻨَﺎ ﻣُﻨَﺎﺩِﻳًﺎ / ﻳُﻨَﺎﺩِﻱ ﻟِﻹِْﻳﻤَﺎﻥِ / ﺃَﻥْ ﺁَﻣِﻨُﻮا ﺑِﺮَﺑِّﻜُﻢْ/ ﻓَﺂَﻣَﻨَّﺎ / ﺭَﺑَّﻨَﺎ ﻓَﺎﻏْﻔِﺮْ ﻟَﻨَﺎ/ ﺫُﻧُﻮﺑَﻨَﺎ / ﻭَﻛَﻔِّﺮْ ﻋَﻨَّﺎ/ ﺳَﻴِّﺌَﺎﺗِﻨَﺎ / ﻭَﺗَﻮَﻓَّﻨَﺎ/ ﻣَﻊَ اﻷَْﺑْﺮَاﺭِ/ ﺭَﺑَّﻨَﺎ ﻭَﺁَﺗِﻨَﺎ / ﻣَﺎ ﻭَﻋَﺪْﺗَﻨَﺎ/ ﻋَﻠَﻰ ﺭُﺳُﻠِﻚَ / ﻭَﻻَ ﺗُﺨْﺰِﻧَﺎ/ ﻳَﻮْﻡَ اﻟْﻘِﻴَﺎﻣَﺔِ / ﺇِﻧَّﻚَ/ ﻻَ ﺗُﺨْﻠِﻒُ اﻟْﻤِﻴﻌَﺎﺩَ /. ﺭَﺑَّﻨَﺎ ﻋَﻠَﻴْﻚَ ﺗَﻮَﻛَّﻠْﻨَﺎ / ﻭَﺇِﻟَﻴْﻚَ ﺃَﻧَﺒْﻨَﺎ /ﻭَﺇِﻟَﻴْﻚَ اﻟْﻤَﺼِﻴﺮُ / ﺭَﺑَّﻨَﺎ اﻏﻔِﺮ ﻟَﻨَﺎ/ ﻭَ ﻷِِﺧﻮاﻧِﻨَﺎ / اﻟَّﺬِﻳﻦَ ﺳَﺒَﻘُﻮﻧَﺎ ﺑِﺎﻻِﻳﻤَﺎﻥِ / ﻭَﻻَ ﺗَﺠﻌَﻞ/ ﻓﻰِ ﻗُﻠُﻮﺑِﻨَﺎ ﻏِﻼًّ / ﻟِﻠَّﺬِﻳﻦَ ءَاﻣَﻨُﻮا / ﺭَﺑَّﻨَﺎ اِﻧَّﻚَ ﺭَءُﻭﻑٌ ﺭَﺣِﻴﻢ",
        'transliteration':
            "Allahu Akbar Allahu Akbar Allahu Akbar walillahilhamdu. La ilaha Illallahul wahidul fardus samad. Allazilam yattakhiz sahibatan wala walada walam yakun lahu syarikun fil mulki walam yakun lahu waliyyun minazzulli wakabbirhu takbira Allahumma innaka qulta fi kitabikal munazzali ud'uni astajib lakum da'aunaka rabbana fagfirlana kama wa'adtana innaka la tukhliful mi'ad. Rabbana innana sami'na munadiyan yunadi lil imani an aminu birabbikum fa amanna. Rabana fagfir lana zunubana wa kaffir 'anna sayyi atina watawaffana ma'al abrar. Rabbana wa atina ma wa'ad tana 'ala rusulika wala tukhzina yaumal qiyamati innaka la tukhliful mi'ad. Rabbana 'alaika tawakkalna wa alaika anabna wa ilaikal masir. Rabbanagfir lana zunubana wali ikhwaninal lazina sabaquna bil imani wala taj'al fi qulubina gillal lillazina amanu rabbana innaka ra ufur rahim",
        'translation':
            "Allah Maha Besar, Allah Maha Besar, Allah Maha Besar, hanya bagi Allahlah segala pujian. Tidak ada Tuhan selain Allah yang Maha Esa, tunggal dan tumpuan segala maksud dan hajat, yang tidak beristri dan tidak beranak, tidak bersekutu dalam kekuasaan. Tidak menjadi pelindung kehinaan. Agungkanlah Dia dengan segenap kebesaran. Ya Allah, sesungguhnya Engkau telah berfirman dalam Al Qur'an-Mu: 'Berdo'alah kepada-Ku niscaya akan Kuperkenankan bagimu'. Sekarang kami telah memohon kepada-Mu wahai Tuhan kami. Ampunilah seperti halnya Engkau telah janjikan kepada kami, sesungguhnya Engkau tidak memungkiri janji. Ya Tuhan kami, sesungguhnya kami mendengar (seruan) yang menyeru kepada iman (yaitu) 'berimanlah kamu kepada Tuhanmu'. M aka kami pun beriman. Ya Tuhan kami, ampunilah dosa-dosa kami dan hapuskanlah kesalahan-kesalahan kami dan wafatkanlah kami beserta orang-orang baik. Ya Tuhan kami berilah kami apa yang telah Engkau janjikan kepada kami dengan perantara rasul-rasul Engkau. Dan Janganlah Engkau hinakan kami dihari kiamat. Sesungguhnya Engkau tidak menyalahi janji. Ya Allah, hanya kepada Engkaulah bertawakal, dan hanya kepada Engkaulah tumpuan segala sesuatu dan kepada Engkaulah tempat kembali. Wahai Tuhan kami ampunilah dosa-dosa kami dan dosa semua saudara kami seiman yang telah mendahului kami dan jangan Engkau jadikan kedengkian dalam kalbu kami terhadap mereka yang telah beriman. Ya Allah, sesungguhnya Engkau Maha Pengasih dan Maha Penyayang",
      },
      {
        'title': 'Doa saat di Bathnul Wadi (Lampu / Pilar Hijau)',
        'arab':
            "ﺭَﺏّ اﻏْﻔِﺮْ/ ﻭَاﺭْﺣَﻢْ / ﻭَاﻋْﻒُ/ ﻭَﺗَﻜَﺮَّﻡْ / ﻭَﺗَﺠَﺎﻭَﺯْ/ ﻋَﻤَّﺎ ﺗَﻌْﻠَﻢُ / ﺇﻧَّﻚَ ﺗَﻌْﻠَﻢُ/ ﻣَﺎﻻَ ﻧَﻌْﻠَﻢْ / ﺇﻧَّﻚَ/ ﺃَﻧْﺖَ اﻟﻠﻪُ / اﻷَﻋَﺰُّ اﻷَﻛْﺮَﻡ",
        'transliteration':
            "Rabbighfir warham wa'fu watakarram watajawaz 'amma ta'lam innaka ta'lamu mala na'lam. Innaka antallahul a'azzul akram",
        'translation':
            "Ya Allah ampunilah, sayangilah, maafkanlah, bermurah hatilah dan hapuskanlah apa-apa yang Engkau ketahui dari dosa kami. Sesungguhnya Engkau Maha Mengetahui apa-apa yang kami sendiri tidak tahu. Sesungguhnya Engkau Ya Allah Maha Tinggi dan Maha Pemurah",
      },
      {
        'title': 'Doa ketika mendekati Safa',
        'arab':
            "ﺇِﻥَّ اﻟﺼَّﻔَﺎ ﻭَاﻟْﻤَﺮْﻭَﺓَ / ﻣِﻦْ ﺷَﻌَﺎﺋِﺮِ اﻟﻠﻪَ / ﻓَﻤَﻦْ ﺣَﺞَّ اﻟْﺒَﻴْﺖَ ﺃَﻭِ اﻋْﺘَﻤَﺮَ / ﻓَﻼَ ﺟُﻨَﺎﺡَ ﻋَﻠَﻴْﻪِ / ﺃَﻥْ ﻳَﻄَّﻮَّﻑَ ﺑِﻬِﻤَﺎ / ﻭَﻣَﻦْ ﺗَﻄَﻮَّﻉَ ﺧَﻴْﺮًا / ﻓَﺈِﻥَّ اﻟﻠﻪَ ﺷَﺎﻛِﺮٌ ﻋَﻠِﻴﻢ",
        'transliteration':
            "Innas safa walmarwata min sya'a irillah. Faman hajjal baita awi' tamara fala junaha 'alaihi ayyattawwafa bihima waman tatawwa'a khairan fainnallaha syakirun 'alim ",
        'translation':
            "Sesungguhnya Shafa dan Marwah sebagian dari syiar-syiar (tanda kebesaran) Allah. Maka barangsiapa yang beribadah haji ke Baitullah ataupun ber-umroh, maka tidak ada dosa baginya mengerjakan sa’i antara keduanya. Dan barangsiapa yang mengerjakan suatu kebajikan dengan kerelaan hati, maka sesungguhnya Allah Maha Penerima Kebaikan lagi Maha Mengetahui",
      },
      // Tambahkan doa lainnya untuk putaran 1
    ],
    // Sai ke 3
    [
      {
        'title': 'Sai perjalanan ketiga dari Safa menuju Marwah',
        'arab':
            "اﻟﻠﻪُ ﺃﻛْﺒَﺮُ / اﻟﻠﻪُ ﺃﻛْﺒَﺮُ / اﻟﻠﻪُ ﺃﻛْﺒَﺮُ / ﻭﻟِﻠَّﻪِ اﻟﺤَﻤْﺪُ / ﺭَﺑَّﻨَﺎ/ ﺃَﺗْﻤِﻢْ ﻟَﻨَﺎ ﻧُﻮﺭَﻧَﺎ / ﻭَاﻏْﻔِﺮْ ﻟَﻨَﺎ / ﺇِﻧَّﻚَ ﻋَﻠَﻰ ﻛُﻞِّ ﺷَﻲْءٍ ﻗَﺪِﻳﺮٌ / اﻟﻠَّﻬُﻢَّ/ ﺇِﻧِّﻲْ ﺃَﺳْﺄَﻟُﻚَ / اﻟﺨَﻴْﺮَ ﻛُﻠَّﻪُ / ﻋَﺎﺟِﻠَﻪُ ﻭﺁﺟِﻠَﻪُ / ﻭَﺃَﺳْﺘَﻐْﻔِﺮُﻙَ ﻟِﺬَﻧْﺒِﻲْ / ﻭَﺃَﺳْﺄَﻟُﻚَ ﺭَﺣْﻤَﺘَﻚَ / ﻳَﺎ ﺃَﺭْﺣَﻢَ اﻟﺮَّاﺣِﻤِﻴْﻦ",
        'transliteration':
            "Allahu Akbar Allahu Akbar Allahu Akbar walillahilhamdu. Rabbana atmim lana nuruna waghfir lana innaka 'ala kulli syai'in qadir. Allahumma inni as'alukal khaira kullahu 'ajilahu wa ajilahu wa astaghfiruka lizanbi wa as aluka rahmataka ya arhamarrahimin",
        'translation':
            "Allah Maha Besar, Allah Maha Besar, Allah Maha Besar. Hanya bagi Allah semua pujian. Ya Allah, sempurnakanlah cahaya terang bagi kami, ampunilah kami, sesungguhnya Engkau Maha Kuasa atas segala sesuatu. Ya Allah, sesungguhnya aku mohon pada-Mu segala kebaikan yang sekarang dan masa yang akan datang dan aku mohon ampunan pada-Mu dan dosaku serta aku mohon pada-Mu rahmat-Mu Wahai Tuhan Yang Maha Pengasih dari segala yang pengasih",
      },
      {
        'title': 'Doa saat di Bathnul Wadi (Lampu / Pilar Hijau)',
        'arab':
            "ﺭَﺏّ اﻏْﻔِﺮْ/ ﻭَاﺭْﺣَﻢْ / ﻭَاﻋْﻒُ/ ﻭَﺗَﻜَﺮَّﻡْ / ﻭَﺗَﺠَﺎﻭَﺯْ/ ﻋَﻤَّﺎ ﺗَﻌْﻠَﻢُ / ﺇﻧَّﻚَ ﺗَﻌْﻠَﻢُ/ ﻣَﺎﻻَ ﻧَﻌْﻠَﻢْ / ﺇﻧَّﻚَ/ ﺃَﻧْﺖَ اﻟﻠﻪُ / اﻷَﻋَﺰُّ اﻷَﻛْﺮَﻡ",
        'transliteration':
            "Rabbighfir warham wa'fu watakarram watajawaz 'amma ta'lam innaka ta'lamu mala na'lam. Innaka antallahul a'azzul akram",
        'translation':
            "Ya Allah ampunilah, sayangilah, maafkanlah, bermurah hatilah dan hapuskanlah apa-apa yang Engkau ketahui dari dosa kami. Sesungguhnya Engkau Maha Mengetahui apa-apa yang kami sendiri tidak tahu. Sesungguhnya Engkau Ya Allah Maha Tinggi dan Maha Pemurah",
      },
      {
        'title': 'Doa ketika mendekati Marwah',
        'arab':
            "ﺇِﻥَّ اﻟﺼَّﻔَﺎ ﻭَاﻟْﻤَﺮْﻭَﺓَ / ﻣِﻦْ ﺷَﻌَﺎﺋِﺮِ اﻟﻠﻪَ / ﻓَﻤَﻦْ ﺣَﺞَّ اﻟْﺒَﻴْﺖَ ﺃَﻭِ اﻋْﺘَﻤَﺮَ / ﻓَﻼَ ﺟُﻨَﺎﺡَ ﻋَﻠَﻴْﻪِ / ﺃَﻥْ ﻳَﻄَّﻮَّﻑَ ﺑِﻬِﻤَﺎ / ﻭَﻣَﻦْ ﺗَﻄَﻮَّﻉَ ﺧَﻴْﺮًا / ﻓَﺈِﻥَّ اﻟﻠﻪَ ﺷَﺎﻛِﺮٌ ﻋَﻠِﻴﻢ",
        'transliteration':
            "Innas safa walmarwata min sya'a irillah. Faman hajjal baita awi' tamara fala junaha 'alaihi ayyattawwafa bihima waman tatawwa'a khairan fainnallaha syakirun 'alim ",
        'translation':
            "Sesungguhnya Shafa dan Marwah sebagian dari syiar-syiar (tanda kebesaran) Allah. Maka barangsiapa yang beribadah haji ke Baitullah ataupun ber-umroh, maka tidak ada dosa baginya mengerjakan sa’i antara keduanya. Dan barangsiapa yang mengerjakan suatu kebajikan dengan kerelaan hati, maka sesungguhnya Allah Maha Penerima Kebaikan lagi Maha Mengetahui",
      },
      // Tambahkan doa lainnya untuk putaran 1
    ],
    // Sai ke 4
    [
      {
        'title': 'Sai perjalanan keempat dari Marwah menuju Safa',
        'arab':
            "اﻟﻠﻪُ ﺃﻛْﺒَﺮُ / اﻟﻠﻪُ ﺃﻛْﺒَﺮُ / اﻟﻠﻪُ ﺃﻛْﺒَﺮُ / ﻭﻟِﻠَّﻪِ اﻟﺤَﻤْﺪُ / اﻟﻠَّﻬُﻢَّ/ ﺇِﻧِّﻲْ ﺃَﺳْﺄَﻟُﻚَ / ﻣِﻦْ ﺧَﻴْﺮِ ﻣَﺎ ﺗَﻌْﻠَﻢُ / ﻭَﺃَﻋُﻮْﺫُ ﺑِﻚَ / ﻣِﻦَ ﺷَﺮِّ ﻣَﺎ ﺗَﻌْﻠَﻢُ / ﻭَﺃَﺳْﺘَﻐْﻔِﺮُﻙَ / ﻣِﻦْ ﻛُﻞِّ ﻣَﺎ ﺗَﻌْﻠَﻢُ / ﺇِﻧَّﻚَ ﺃَﻧْﺖَ/ ﻋَﻼَّﻡُ اﻟﻐُﻴُﻮْﺏ / ﻻَ ﺇِﻟﻪَ ﺇِﻻَّ اﻟﻠﻪُ/ اﻟﻤَﻠِﻚُ اﻟﺤَﻖُّ اﻟﻤُﺒِﻴْﻦُ / ﻣُﺤَﻤَّﺪٌ ﺭَﺳُﻮْﻝُ اﻟﻠﻪِ / ﺻَﺎﺩِﻕُ اﻟﻮَﻋْﺪِ اﻷَﻣِﻴْﻦُ / اﻟﻠَّﻬُﻢَّ/ ﺇِﻧِّﻲْ ﺃَﺳْﺄَﻟُﻚَ / ﻛَﻤَﺎ ﻫَﺪَﻳْﺘَﻨِﻲْ/ ﻟِﻹﺳْﻼَﻡِ / ﺃَﻥْ ﻻَ ﺗَﻨْﺰِﻋَﻪُ ﻣِﻨِّﻲْ / ﺣَﺘَّﻰ ﺗَﻮَﻓَّﻨِﻲْ/ ﻭَﺃَﻧَﺎ ﻣُﺴْﻠِﻢٌ / اﻟﻠَّﻬُﻢَّ اﺟْﻌَﻞْ / ﻓﻲ ﻗَﻠْﺒِﻲ ﻧُﻮﺭاً / ﻭَﻓِﻲ ﻟِﺴَﺎﻧِﻲ ﻧُﻮﺭًا / ﻭَاﺟْﻌَﻞْ/ ﻓﻲ ﺳَﻤْﻌِﻲ ﻧُﻮﺭاً / ﻭَﻓِﻲ ﺑَﺼَﺮِﻱْ ﻧُﻮﺭًا / اﻟﻠَّﻬُﻢَّ/ اﺷْﺮَﺡْ ﻟِﻲْ ﺻَﺪْﺭِﻱْ / ﻭَﻳَﺴِّﺮْﻟِﻲْ ﺃَﻣْﺮِﻱْ / ﻭَﺃَﻋُﻮْﺫُ ﺑِﻚَ / ﻣِﻦْ ﻭَﺳَﺎﻭِﺱِ اﻟﺼَّﺪْﺭِ / ﻭَﺷَﺘَﺎﺕِ اﻷَﻣْﺮِ / ﻭَﻓِﺘْﻨَﺔِ اﻟﻘَﺒْﺮِ / اﻟﻠَّﻬُﻢَّ/ ﺇِﻧِّﻲْ ﺃَﻋُﻮْﺫُ ﺑِﻚَ / ﻣِﻦْ ﺷَﺮِّ ﻣَﺎ / ﻳَﻠِﺞُ ﻓِﻲ اﻟﻠَّﻴْﻞِ / ﻭَﻣِﻦْ ﺷَﺮِّ ﻣَﺎ / ﻳَﻠِﺞُ ﻓِﻲ اﻟﻨَّﻬَﺎﺭِ / ﻭَﻣِﻦْ ﺷَﺮِّ ﻣَﺎ / ﺗَﻬُﺐُّ ﺑِﻪِ اﻟﺮِّﻳَﺎﺡُ / ﻳَﺎ ﺃَﺭْﺣَﻢَ اﻟﺮَّاﺣِﻤِﻴْﻦَ / ﺳُﺒْﺤَﺎﻧَﻚَ/ ﻣَﺎ ﻋَﺒَﺪْﻧَﺎﻙَ / ﺣَﻖَّ ﻋِﺒَﺎﺩَﺗِﻚَ ﻳَﺎ اﻟﻠﻪُ / ﺳُﺒْﺤَﺎﻧَﻚَ/ ﻣَﺎ ﺫَﻛَﺮْﻧَﺎﻙَ / ﺣَﻖَّ ﺫِﻛْﺮِﻙَ ﻳَﺎ اﻟﻠﻪ",
        'transliteration':
            "Allahu Akbar Allahu Akbar Allahu Akbar walillahil hamdu. Allahumma inni as aluka min khairi ma ta'lamu wa a'uzubika min syarri mata'lamu wa astagfiruka min kulli mata'lamu innaka anta 'allamul guyub. La ilaha illallahul malikul haqqul mubin. Muhammadur rasulullah sadiqul wa'dil amin. Allahumma inni as aluka kama haditani lil islami an la tanzi 'ahu minni hatta tatawaffani wa ana muslimun. Allahummaj'al fi qalbi nura. Allahummasyroh li sadri wayassirli amri wa a'uzubika min wasawisis sadri wasyatatil amri wafit natil qabri. Allahumma inni a'uzubika min syarri ma yaliju fillaili wa syarri ma yaliju finnahari wamin syarri matahubbu bihir riyahu ya arhamar rahimin. Subhanaka ma 'abadnaka haqqa ibadatika ya Allahu Subhanaka ma zakarnaka haqqa zikrika ya Allahu",
        'translation':
            "Allah Maha Besar, Allah Maha Besar, Allah Maha Besar. Segala puji bagi Allah. Ya Allah Tuhanku, aku mohon padaMu dari kebaikan yang Engkau tahu dan berlindung padaMu dari kejahatan yang Engkau tahu, dan aku mohon ampun padaMu dri segala kesalahan yang Engkau ketahui, sesungguhnya Engkau Maha mengetahui yang gaib. Tidak ada Tuhan selain Allah Maha Raja yang sebenar-benarnya. Muhammad utusan Allah yang selalu menepati janji lagi terpercaya. Ya Allah sebagaimana Engkau telah menunjuki aku memilih Islam, maka aku mohon kepadaMu untuk tidak mencabutnya sehingga aku meninggal dalam keadaan Muslim. Ya Allah berilah cahay terang dalam hati, telinga dan penglihatanku. Ya Allah lapangkanlah dadaku dan mudahkan bagiku segala urusan. Dan aku berlindung padaMu dari keraguan, simpang-siur urusan dan fitnah kubur. Ya Allah aku berlindung padaMu dari kejahatan yang tersembunyi diwaktu malam dan siang hari, serta kejahatn yang dibawa angin lalu, wahai Tuhan Yang Maha Pengasih dari segenap yang pengasih. Ya Allah, Maha Suci Engkau kami tidak menyembahMu dengan pengabdian yang semestinya ya Allah",
      },
      {
        'title': 'Doa saat di Bathnul Wadi (Lampu / Pilar Hijau)',
        'arab':
            "ﺭَﺏّ اﻏْﻔِﺮْ/ ﻭَاﺭْﺣَﻢْ / ﻭَاﻋْﻒُ/ ﻭَﺗَﻜَﺮَّﻡْ / ﻭَﺗَﺠَﺎﻭَﺯْ/ ﻋَﻤَّﺎ ﺗَﻌْﻠَﻢُ / ﺇﻧَّﻚَ ﺗَﻌْﻠَﻢُ/ ﻣَﺎﻻَ ﻧَﻌْﻠَﻢْ / ﺇﻧَّﻚَ/ ﺃَﻧْﺖَ اﻟﻠﻪُ / اﻷَﻋَﺰُّ اﻷَﻛْﺮَﻡ",
        'transliteration':
            "Rabbighfir warham wa'fu watakarram watajawaz 'amma ta'lam innaka ta'lamu mala na'lam. Innaka antallahul a'azzul akram",
        'translation':
            "Ya Allah ampunilah, sayangilah, maafkanlah, bermurah hatilah dan hapuskanlah apa-apa yang Engkau ketahui dari dosa kami. Sesungguhnya Engkau Maha Mengetahui apa-apa yang kami sendiri tidak tahu. Sesungguhnya Engkau Ya Allah Maha Tinggi dan Maha Pemurah",
      },
      {
        'title': 'Doa ketika mendekati Safa',
        'arab':
            "ﺇِﻥَّ اﻟﺼَّﻔَﺎ ﻭَاﻟْﻤَﺮْﻭَﺓَ / ﻣِﻦْ ﺷَﻌَﺎﺋِﺮِ اﻟﻠﻪَ / ﻓَﻤَﻦْ ﺣَﺞَّ اﻟْﺒَﻴْﺖَ ﺃَﻭِ اﻋْﺘَﻤَﺮَ / ﻓَﻼَ ﺟُﻨَﺎﺡَ ﻋَﻠَﻴْﻪِ / ﺃَﻥْ ﻳَﻄَّﻮَّﻑَ ﺑِﻬِﻤَﺎ / ﻭَﻣَﻦْ ﺗَﻄَﻮَّﻉَ ﺧَﻴْﺮًا / ﻓَﺈِﻥَّ اﻟﻠﻪَ ﺷَﺎﻛِﺮٌ ﻋَﻠِﻴﻢ",
        'transliteration':
            "Innas safa walmarwata min sya'a irillah. Faman hajjal baita awi' tamara fala junaha 'alaihi ayyattawwafa bihima waman tatawwa'a khairan fainnallaha syakirun 'alim ",
        'translation':
            "Sesungguhnya Shafa dan Marwah sebagian dari syiar-syiar (tanda kebesaran) Allah. Maka barangsiapa yang beribadah haji ke Baitullah ataupun ber-umroh, maka tidak ada dosa baginya mengerjakan sa’i antara keduanya. Dan barangsiapa yang mengerjakan suatu kebajikan dengan kerelaan hati, maka sesungguhnya Allah Maha Penerima Kebaikan lagi Maha Mengetahui",
      },
      // Tambahkan doa lainnya untuk putaran 1
    ],
    // Sai ke 5
    [
      {
        'title': 'Sai perjalanan Kelima dari Safa menuju Marwah',
        'arab':
            "اﻟﻠﻪُ ﺃﻛْﺒَﺮُ / اﻟﻠﻪُ ﺃﻛْﺒَﺮُ / اﻟﻠﻪُ ﺃﻛْﺒَﺮُ / ﻭﻟِﻠَّﻪِ اﻟﺤَﻤْﺪُ / اﻟﻠَّﻬُﻢَّ/ ﺇِﻧِّﻲْ ﺃَﺳْﺄَﻟُﻚَ / ﻣِﻦْ ﺧَﻴْﺮِ ﻣَﺎ ﺗَﻌْﻠَﻢُ / ﻭَﺃَﻋُﻮْﺫُ ﺑِﻚَ / ﻣِﻦَ ﺷَﺮِّ ﻣَﺎ ﺗَﻌْﻠَﻢُ / ﻭَﺃَﺳْﺘَﻐْﻔِﺮُﻙَ / ﻣِﻦْ ﻛُﻞِّ ﻣَﺎ ﺗَﻌْﻠَﻢُ / ﺇِﻧَّﻚَ ﺃَﻧْﺖَ/ ﻋَﻼَّﻡُ اﻟﻐُﻴُﻮْﺏ / ﻻَ ﺇِﻟﻪَ ﺇِﻻَّ اﻟﻠﻪُ/ اﻟﻤَﻠِﻚُ اﻟﺤَﻖُّ اﻟﻤُﺒِﻴْﻦُ / ﻣُﺤَﻤَّﺪٌ ﺭَﺳُﻮْﻝُ اﻟﻠﻪِ / ﺻَﺎﺩِﻕُ اﻟﻮَﻋْﺪِ اﻷَﻣِﻴْﻦُ / اﻟﻠَّﻬُﻢَّ/ ﺇِﻧِّﻲْ ﺃَﺳْﺄَﻟُﻚَ / ﻛَﻤَﺎ ﻫَﺪَﻳْﺘَﻨِﻲْ/ ﻟِﻹﺳْﻼَﻡِ / ﺃَﻥْ ﻻَ ﺗَﻨْﺰِﻋَﻪُ ﻣِﻨِّﻲْ / ﺣَﺘَّﻰ ﺗَﻮَﻓَّﻨِﻲْ/ ﻭَﺃَﻧَﺎ ﻣُﺴْﻠِﻢٌ / اﻟﻠَّﻬُﻢَّ اﺟْﻌَﻞْ / ﻓﻲ ﻗَﻠْﺒِﻲ ﻧُﻮﺭاً / ﻭَﻓِﻲ ﻟِﺴَﺎﻧِﻲ ﻧُﻮﺭًا / ﻭَاﺟْﻌَﻞْ/ ﻓﻲ ﺳَﻤْﻌِﻲ ﻧُﻮﺭاً / ﻭَﻓِﻲ ﺑَﺼَﺮِﻱْ ﻧُﻮﺭًا / اﻟﻠَّﻬُﻢَّ/ اﺷْﺮَﺡْ ﻟِﻲْ ﺻَﺪْﺭِﻱْ / ﻭَﻳَﺴِّﺮْﻟِﻲْ ﺃَﻣْﺮِﻱْ / ﻭَﺃَﻋُﻮْﺫُ ﺑِﻚَ / ﻣِﻦْ ﻭَﺳَﺎﻭِﺱِ اﻟﺼَّﺪْﺭِ / ﻭَﺷَﺘَﺎﺕِ اﻷَﻣْﺮِ / ﻭَﻓِﺘْﻨَﺔِ اﻟﻘَﺒْﺮِ / اﻟﻠَّﻬُﻢَّ/ ﺇِﻧِّﻲْ ﺃَﻋُﻮْﺫُ ﺑِﻚَ / ﻣِﻦْ ﺷَﺮِّ ﻣَﺎ / ﻳَﻠِﺞُ ﻓِﻲ اﻟﻠَّﻴْﻞِ / ﻭَﻣِﻦْ ﺷَﺮِّ ﻣَﺎ / ﻳَﻠِﺞُ ﻓِﻲ اﻟﻨَّﻬَﺎﺭِ / ﻭَﻣِﻦْ ﺷَﺮِّ ﻣَﺎ / ﺗَﻬُﺐُّ ﺑِﻪِ اﻟﺮِّﻳَﺎﺡُ / ﻳَﺎ ﺃَﺭْﺣَﻢَ اﻟﺮَّاﺣِﻤِﻴْﻦَ / ﺳُﺒْﺤَﺎﻧَﻚَ/ ﻣَﺎ ﻋَﺒَﺪْﻧَﺎﻙَ / ﺣَﻖَّ ﻋِﺒَﺎﺩَﺗِﻚَ ﻳَﺎ اﻟﻠﻪُ / ﺳُﺒْﺤَﺎﻧَﻚَ/ ﻣَﺎ ﺫَﻛَﺮْﻧَﺎﻙَ / ﺣَﻖَّ ﺫِﻛْﺮِﻙَ ﻳَﺎ اﻟﻠﻪ",
        'transliteration':
            "Allahu Akbar Allahu Akbar Allahu Akbar walillahil hamdu. Subhanaka ma syakarnaaka haqqa syukrika ya Allahu subhanaka ma a'la sya'naka ya Allahu. Allahumma habbib ilainal imana wa zayyinhu fi qulubina wakarrih ilainal kufra walfu suqa wal'isyana waj'alna minar rasyidin",
        'translation':
            "Allah Maha Besar Allah Maha Besar Allah Maha Besar. Hanya untuk Allah segala puji. Maha Suci Engkau seperti kami bersyukur pada-Mu sebenar-benar syukur wahai Allah. Maha Suci Engkau sepadan ketinggian-Mu wahai Allah. Ya Allah cintakanlah kami kepada iman dan hiaskanlah di hati kami, bencikanlah kami pada perbuatan kufur, fasiq dan durhaka. Masukanlah kami kedalam golongan orang-orang yang mendapat petunjuk",
      },
      {
        'title': 'Doa saat di Bathnul Wadi (Lampu / Pilar Hijau)',
        'arab':
            "ﺭَﺏّ اﻏْﻔِﺮْ/ ﻭَاﺭْﺣَﻢْ / ﻭَاﻋْﻒُ/ ﻭَﺗَﻜَﺮَّﻡْ / ﻭَﺗَﺠَﺎﻭَﺯْ/ ﻋَﻤَّﺎ ﺗَﻌْﻠَﻢُ / ﺇﻧَّﻚَ ﺗَﻌْﻠَﻢُ/ ﻣَﺎﻻَ ﻧَﻌْﻠَﻢْ / ﺇﻧَّﻚَ/ ﺃَﻧْﺖَ اﻟﻠﻪُ / اﻷَﻋَﺰُّ اﻷَﻛْﺮَﻡ",
        'transliteration':
            "Rabbighfir warham wa'fu watakarram watajawaz 'amma ta'lam innaka ta'lamu mala na'lam. Innaka antallahul a'azzul akram",
        'translation':
            "Ya Allah ampunilah, sayangilah, maafkanlah, bermurah hatilah dan hapuskanlah apa-apa yang Engkau ketahui dari dosa kami. Sesungguhnya Engkau Maha Mengetahui apa-apa yang kami sendiri tidak tahu. Sesungguhnya Engkau Ya Allah Maha Tinggi dan Maha Pemurah",
      },
      {
        'title': 'Doa ketika mendekati Marwah',
        'arab':
            "ﺇِﻥَّ اﻟﺼَّﻔَﺎ ﻭَاﻟْﻤَﺮْﻭَﺓَ / ﻣِﻦْ ﺷَﻌَﺎﺋِﺮِ اﻟﻠﻪَ / ﻓَﻤَﻦْ ﺣَﺞَّ اﻟْﺒَﻴْﺖَ ﺃَﻭِ اﻋْﺘَﻤَﺮَ / ﻓَﻼَ ﺟُﻨَﺎﺡَ ﻋَﻠَﻴْﻪِ / ﺃَﻥْ ﻳَﻄَّﻮَّﻑَ ﺑِﻬِﻤَﺎ / ﻭَﻣَﻦْ ﺗَﻄَﻮَّﻉَ ﺧَﻴْﺮًا / ﻓَﺈِﻥَّ اﻟﻠﻪَ ﺷَﺎﻛِﺮٌ ﻋَﻠِﻴﻢ",
        'transliteration':
            "Innas safa walmarwata min sya'a irillah. Faman hajjal baita awi' tamara fala junaha 'alaihi ayyattawwafa bihima waman tatawwa'a khairan fainnallaha syakirun 'alim ",
        'translation':
            "Sesungguhnya Shafa dan Marwah sebagian dari syiar-syiar (tanda kebesaran) Allah. Maka barangsiapa yang beribadah haji ke Baitullah ataupun ber-umroh, maka tidak ada dosa baginya mengerjakan sa’i antara keduanya. Dan barangsiapa yang mengerjakan suatu kebajikan dengan kerelaan hati, maka sesungguhnya Allah Maha Penerima Kebaikan lagi Maha Mengetahui",
      },
      // Tambahkan doa lainnya untuk putaran 1
    ],
    // Sai ke 6
    [
      {
        'title': 'Sai perjalanan Keenam dari Marwah menuju Safa',
        'arab':
            "اللهُ أَكْبَرُ اَللهُ أَكْبَرُ اللهُ أَكْبَرُ وَلِلّهِ الْحَمْدُ لاَإِلَهَ إِلاَّ اللهُ وَحْدَهُ صَدَقَ وَعْدَهُ وَنَصَرَ عَبْدَهُ وَهَزَمَ الاحْزَابَ وَحْدَهُ لاَإِلَهَ إِلاَّ اللهُ وَلاَنَعْبُدُ إِلاّ إِيَّاهُ مُخْلِصِيْنَ لَهُ الدِّيْنَ وَلَوْ كَرِهَ الْكَافِرُوْنَاللّهُمَّ إِنِّيْ أَسْأَلُكَ الْهُدَى وَالتُّقىَ وَالْعَفَافَ وَالْغِنَى اللّهُمَّ لَكَ الْحَمْدُ كَالَّذِيْ نَقُوْلُ وَخَيْرًا مِمَّا نَقَوْلُ اَللّهُمَّ إِنِيْ أَسْأَلُكَ رِضَاكَ وَالْجَنَّةَ وَأَعُوْذُبِكَ مِنْ سَخَطِكَ وَالنَّارِ وَمَا يُقَرِّبُنِيْ إِلَيْهَا مْنْ قَوْلٍ أَوْفِعْلٍ أَوْعَمَلٍ. اللّهُمَّ بِنُوْرِكَ اهْتَدَيْنَا وَبِفَضْلِكَ اسْتَغْنَيْنَا وَفِيْ كَنَفِكَ وَإِنْعَامِكَ وَعَطَائِكَ وَاِحْسَانِكَ أَصْبَحْنَا وَأَمْسَيْنَا أَنْتَ اْلاَوَّلُ فَلاَ قَبْلَكَ شَيْءٌ وَاْلاَخِرُ فَلاَ بَعْدَكَ شَيْءٌ وَالظَّا هِرُ فَلاَ شَيْءَ فَوْقَكَ وَالْبَاطِنُ فَلاَ شَيْءَ دُوْنَكَ نَعُوْذُبِكَ مِنَ الْفَلَسِ وَالْكَسَلِ وَعَذَابِ الْقَبِرِ وَفِتْنَةِ الْغِنَى وَنَسْأَلُكَ الْفَوْزَ بِالْجَنَّةِ",
        'transliteration':
            "Allahu Akbar Allahu Akbar Allahu Akbar walillahil hamdu. La ilaha illallahu wahdah, sadaqa wa'dah, wanasara 'abdah wahazamal ahzaba wahdah. La ilaha illallahu wala na'budu illa iyyahu mukhlisina lahuddina walau karihal kafirun. Allahumma inni 'as'alukal huda wattuqa wal 'afafa walgina. Allahumma lakal hamdu kallazi naqulu wakhairan mimma naqulu. Allahumma inni as'aluka ridaka waljannata wa a'uzubika min sakhatika wannari wama yuqarribuni ilaiha min qaulin aufi'lin au'a malin. Allahumma binurikah tadaina wabifadlika istagnaina wa fi kanafika wa in amika wa'ata ika wa ihsanika asbahna wa amsaina antal awwalu fala qablaka syai'un wal akhiru fala ba'daka syai'un wazzahiru fala syai'a dunaka na'uzubika minal falasi wal kasali wa'azabil qabri wafitnatil gina wa nas'alukal fauza biljannah",
        'translation':
            "Allah Maha Besar, Allah Maha Besar, Allah Maha Besar Segala puji hanya untuk Allah. Tidak ada Tuhan selain Allah Yang Maha Esa, yang menepati janjiNya, menolong hambaNya dan menghancurkan musuh dengan ke-Esaan-Nya. Tiada Tuhan yang disembah selain Allah. Dan kami tidak menyembah selain dari Dia dengan ikhlas tunduk dan patuh pada agama sekalipun orang-orang kafir benci. Ya Allah aku mohon padaMu petunjuk, pemeliharaan, penjagaan dan kekayaan. Ya Allah, padaMu lah segala puji seperti yang kami ucapkan bahkan lebih baik dari yang kami sendiri ucapkan. Ya Allah, kami mohon padaMu ridho dan surga dan aku berlindung padaMu dari murkaMu dan neraka, dan apapun yang kekal yang mendekatkan daku kepadanya, baik ucapan, perbuatan maupun pekerjaan. Ya Allah, hanya dengan nur cahayaMu kami ini mendapat petunjuk, dengan pemberianMu kami merasa cukup, dalam naunganMu, nikmatMu, anugerahMu dan kebajikannMu jualah kami ini berada diwaktu pagi dan petang. Engkaulah yang mula pertama, tidak ada suatupun yang ada sebelumMu dan Engkau pulalah yang paling akhir dan tidak ada sesuatupun yang ada sebelumMu dan Engkau pulalah yang paling akhir dan tidak ada sesuatupun yang ada dibelakangMu. Engkaulah yang dzahir, maka tidak ada sesuatupun yang mengatasi Engkau. Engkau pulalah yang batin, maka tidak ada sesuatupun menghalangi Engkau. Kami berlindung padaMu dari pailit, malas,siksa kubur dan fitnah kekayaan serta kami mohon padaMu kemenangan memperoleh surga",
      },
      {
        'title': 'Doa saat di Bathnul Wadi (Lampu / Pilar Hijau)',
        'arab':
            "ﺭَﺏّ اﻏْﻔِﺮْ/ ﻭَاﺭْﺣَﻢْ / ﻭَاﻋْﻒُ/ ﻭَﺗَﻜَﺮَّﻡْ / ﻭَﺗَﺠَﺎﻭَﺯْ/ ﻋَﻤَّﺎ ﺗَﻌْﻠَﻢُ / ﺇﻧَّﻚَ ﺗَﻌْﻠَﻢُ/ ﻣَﺎﻻَ ﻧَﻌْﻠَﻢْ / ﺇﻧَّﻚَ/ ﺃَﻧْﺖَ اﻟﻠﻪُ / اﻷَﻋَﺰُّ اﻷَﻛْﺮَﻡ",
        'transliteration':
            "Rabbighfir warham wa'fu watakarram watajawaz 'amma ta'lam innaka ta'lamu mala na'lam. Innaka antallahul a'azzul akram",
        'translation':
            "Ya Allah ampunilah, sayangilah, maafkanlah, bermurah hatilah dan hapuskanlah apa-apa yang Engkau ketahui dari dosa kami. Sesungguhnya Engkau Maha Mengetahui apa-apa yang kami sendiri tidak tahu. Sesungguhnya Engkau Ya Allah Maha Tinggi dan Maha Pemurah",
      },
      {
        'title': 'Doa ketika mendekati Safa',
        'arab':
            "ﺇِﻥَّ اﻟﺼَّﻔَﺎ ﻭَاﻟْﻤَﺮْﻭَﺓَ / ﻣِﻦْ ﺷَﻌَﺎﺋِﺮِ اﻟﻠﻪَ / ﻓَﻤَﻦْ ﺣَﺞَّ اﻟْﺒَﻴْﺖَ ﺃَﻭِ اﻋْﺘَﻤَﺮَ / ﻓَﻼَ ﺟُﻨَﺎﺡَ ﻋَﻠَﻴْﻪِ / ﺃَﻥْ ﻳَﻄَّﻮَّﻑَ ﺑِﻬِﻤَﺎ / ﻭَﻣَﻦْ ﺗَﻄَﻮَّﻉَ ﺧَﻴْﺮًا / ﻓَﺈِﻥَّ اﻟﻠﻪَ ﺷَﺎﻛِﺮٌ ﻋَﻠِﻴﻢ",
        'transliteration':
            "Innas safa walmarwata min sya'a irillah. Faman hajjal baita awi' tamara fala junaha 'alaihi ayyattawwafa bihima waman tatawwa'a khairan fainnallaha syakirun 'alim ",
        'translation':
            "Sesungguhnya Shafa dan Marwah sebagian dari syiar-syiar (tanda kebesaran) Allah. Maka barangsiapa yang beribadah haji ke Baitullah ataupun ber-umroh, maka tidak ada dosa baginya mengerjakan sa’i antara keduanya. Dan barangsiapa yang mengerjakan suatu kebajikan dengan kerelaan hati, maka sesungguhnya Allah Maha Penerima Kebaikan lagi Maha Mengetahui",
      },
      // Tambahkan doa lainnya untuk putaran 1
    ],
    // Sai ke 7
    [
      {
        'title': 'Sai perjalanan Kelima dari Safa menuju Marwah',
        'arab':
            "اﻟﻠﻪُ ﺃَﻛْﺒَﺮُ / اﻟﻠﻪُ ﺃَﻛْﺒَﺮُ / اﻟﻠﻪُ ﺃَﻛْﺒَﺮُ ﻛَﺒِﻴْﺮًا / ﻭَاﻟﺤَﻤْﺪُ ﻟِﻠﻪِ ﻛَﺜِﻴْﺮًا / اﻟﻠَّﻬُﻢَّ/ ﺣَﺒِّﺐْ ﺇِﻟَﻲَّ اﻹِﻳﻤَﺎﻥَ / ﻭَﺯَﻳِّﻨْﻪُ/ ﻓِﻲ ﻗَﻠْﺒِﻲْ / ﻭَﻛَﺮِّﻩْ/ ﺇِﻟَﻲَّ اﻟْﻜُﻔْﺮَ / ﻭَاﻟْﻔُﺴُﻮﻕَ/ ﻭَاﻟْﻌِﺼْﻴَﺎﻥَ / ﻭَاﺟْﻌَﻠْﻨِﻲْ/ ﻣِﻦَ اﻟﺮَّاﺷِﺪِﻳﻦ",
        'transliteration':
            "Allahu Akbar Allahu Akbar Allahu Akbar walillahil hamdu. Subhanaka ma syakarnaaka haqqa syukrika ya Allahu subhanaka ma a'la sya'naka ya Allahu. Allahumma habbib ilainal imana wa zayyinhu fi qulubina wakarrih ilainal kufra walfu suqa wal'isyana waj'alna minar rasyidin.",
        'translation':
            "Allah Maha Besar Allah Maha Besar Allah Maha Besar. Hanya untuk Allah segala puji. Maha Suci Engkau seperti kami bersyukur pada-Mu sebenar-benar syukur wahai Allah. Maha Suci Engkau sepadan ketinggian-Mu wahai Allah. Ya Allah cintakanlah kami kepada iman dan hiaskanlah di hati kami, bencikanlah kami pada perbuatan kufur, fasiq dan durhaka. Masukanlah kami kedalam golongan orang-orang yang mendapat petunjuk",
      },
      {
        'title': 'Doa saat di Bathnul Wadi (Lampu / Pilar Hijau)',
        'arab':
            "ﺭَﺏّ اﻏْﻔِﺮْ/ ﻭَاﺭْﺣَﻢْ / ﻭَاﻋْﻒُ/ ﻭَﺗَﻜَﺮَّﻡْ / ﻭَﺗَﺠَﺎﻭَﺯْ/ ﻋَﻤَّﺎ ﺗَﻌْﻠَﻢُ / ﺇﻧَّﻚَ ﺗَﻌْﻠَﻢُ/ ﻣَﺎﻻَ ﻧَﻌْﻠَﻢْ / ﺇﻧَّﻚَ/ ﺃَﻧْﺖَ اﻟﻠﻪُ / اﻷَﻋَﺰُّ اﻷَﻛْﺮَﻡ",
        'transliteration':
            "Rabbighfir warham wa'fu watakarram watajawaz 'amma ta'lam innaka ta'lamu mala na'lam. Innaka antallahul a'azzul akram",
        'translation':
            "Ya Allah ampunilah, sayangilah, maafkanlah, bermurah hatilah dan hapuskanlah apa-apa yang Engkau ketahui dari dosa kami. Sesungguhnya Engkau Maha Mengetahui apa-apa yang kami sendiri tidak tahu. Sesungguhnya Engkau Ya Allah Maha Tinggi dan Maha Pemurah",
      },
      {
        'title': 'Doa ketika mendekati Marwah',
        'arab':
            "ﺇِﻥَّ اﻟﺼَّﻔَﺎ ﻭَاﻟْﻤَﺮْﻭَﺓَ / ﻣِﻦْ ﺷَﻌَﺎﺋِﺮِ اﻟﻠﻪَ / ﻓَﻤَﻦْ ﺣَﺞَّ اﻟْﺒَﻴْﺖَ ﺃَﻭِ اﻋْﺘَﻤَﺮَ / ﻓَﻼَ ﺟُﻨَﺎﺡَ ﻋَﻠَﻴْﻪِ / ﺃَﻥْ ﻳَﻄَّﻮَّﻑَ ﺑِﻬِﻤَﺎ / ﻭَﻣَﻦْ ﺗَﻄَﻮَّﻉَ ﺧَﻴْﺮًا / ﻓَﺈِﻥَّ اﻟﻠﻪَ ﺷَﺎﻛِﺮٌ ﻋَﻠِﻴﻢ",
        'transliteration':
            "Innas safa walmarwata min sya'a irillah. Faman hajjal baita awi' tamara fala junaha 'alaihi ayyattawwafa bihima waman tatawwa'a khairan fainnallaha syakirun 'alim ",
        'translation':
            "Sesungguhnya Shafa dan Marwah sebagian dari syiar-syiar (tanda kebesaran) Allah. Maka barangsiapa yang beribadah haji ke Baitullah ataupun ber-umroh, maka tidak ada dosa baginya mengerjakan sa’i antara keduanya. Dan barangsiapa yang mengerjakan suatu kebajikan dengan kerelaan hati, maka sesungguhnya Allah Maha Penerima Kebaikan lagi Maha Mengetahui",
      },
      {
        'title': 'Doa ketika selesai melaksanakan Sai',
        'arab':
            "اللّهُمَّ رَبَّنَا تَقَبَّلْ مِنَّا وَعَافِنَا وَاعْفُ عَنَّا وَعَلَى طَاعَتِكَ وَشُكْرِكَ أَعِنَّا وَعَلَى غَيْرِكَ لاَتَكِلْنَا وَعَلَى اْلإِيْمَانِ واْلإِسْلاَمِ الَكَامِلِ جَمِيْعًا تَوَفَّنَا وَأَنْتَ رَاضٍ عَنَّا اللّهُمَّ ارْحَمْنِيْ أَنْ أَتَكَلَّفَ مَالاَ يَعْنِيْنِيْ وَارْزُقْنِيْ حُسْنَ النَّظَرِ فِيْمَا يُرْضِيْكَ عَنِّيْ يَاأَرْحَمَ الرَّا حِمِيْنَ",
        'transliteration':
            "Allahumma rabbana taqabbal minna wa'afina wa'fu'anna wa'ala ta'atika wa syukrika a'inna wa'ala ghairika latakilna wa'ala ilman wa islamil kamil jami'an tawaffana wa anta radin 'anna. Allahumma rhamni an atakallafa mala ya'ninii wa rzuqni husnan nazari fima yurdhika 'anni ya arhamar rahimin",
        'translation':
            "Sesungguhnya Shafa dan Marwah sebagian dari syiar-syiar (tanda kebesaran) Allah. Maka barangsiapa yang beribadah haji ke Baitullah ataupun ber-umroh, maka tidak ada dosa baginya mengerjakan sa’i antara keduanya. Dan barangsiapa yang mengerjakan suatu kebajikan dengan kerelaan hati, maka sesungguhnya Allah Maha Penerima Kebaikan lagi Maha Mengetahui",
      },
      // Tambahkan doa lainnya untuk putaran 1
    ],
    // Lanjutkan hingga putaran 7
  ];

  final List<Map<String, String>> doaListTahalul = [
    {
      'title': 'Doa saat Tahalul',
      'arab':
          "ًاﻟﻠﻪُ ﺃَﻛْﺒَﺮُ / اﻟﻠﻪُ ﺃَﻛْﺒَﺮُ / اﻟﻠﻪُ ﺃَﻛْﺒَﺮُ ﻛَﺒِﻴْﺮًا / ﻭَاﻟﺤَﻤْﺪُ ﻟِﻠَّﻪِ / ﻋَﻠَﻰ ﻣَﺎ ﻫَﺪَاﻧَﺎ / ﻭَاﻟﺤَﻤْﺪُ ﻟِﻠَّﻪِ / ﻋَﻠَﻰ ﻣَﺎ ﺃَﻧْﻌَﻤَﻨَﺎ/ ﺑِﻪِ ﻋَﻠَﻴْﻨَﺎ / اﻟﻠَّﻬُﻢَّ/ ﻫَﺬِﻩِ ﻧَﺎﺻِﻴَﺘِﻲْ / ﻓَﺘَﻘَﺒَّﻞْ ﻣِﻨِّﻲْ / ﻭَاﻏْﻔِﺮْ ﺫُﻧُﻮْﺑِﻲْ / اﻟﻠَّﻬُﻢَّ اﻏْﻔِﺮْ / ﻟِﻠْﻤُﺤَﻠِّﻘِﻴْﻦَ/ ﻭَاﻟﻤُﻘَﺼِّﺮِﻳْﻦَ / ﻳَﺎ ﻭَاﺳِﻊَ اﻟﻤَﻐْﻔِﺮَﺓِ / اﻟﻠَّﻬُﻢَّ/ اﺛْﺒُﺖْ ﻟِﻲْ / ﺑِﻜُﻞِّ ﺷَﻌْﺮَﺓٍ ﺣَﺴَﻨَﺔً / ﻭَاﻣْﺢُ ﻋَﻨَّﻲْ/ ﺑِﻬَﺎ ﺳَﻴِّﺌَﺔً / ﻭَاﺭْﻓَﻊْ ﻟِﻲْ/ ﺑِﻬَﺎ ﻋِﻨْﺪَﻙَ/ ﺩَﺭَﺟَﺔ",
      'transliteration':
          "Allahu Akbar Allahu Akbar Allahu Akbar Alhamdulillahi'ala ma hadana wal hamdulillahi'ala ma an'amna bihi'alaina. Allahumma hadzihi nasibati fataqobbal minni waghfir zunubi. Allahumaghfir lilmuhalliqina wal maqsurina ya wasi'al maghfirah. Allahummasbut li bikulli sya'ratin hasanatan wamhu'anni biha sayyiatan warfa'li biha 'indika darojah",
      'translation':
          "Allah Maha Besar, Allah Maha Besar, Allah Maha Besar. Segala puji bagi Allah yang telah memberi petunjuk kepada kita dan segala puji bagi Allah tentang apa-apa yang telah Allah karuniakan kepada kami. Ya Allah ini ubun-ubunku, maka terimalah dariku (amal perbuatanku) dan ampunilah dosa-dosaku. Ya Allah, ampunilah orang-orang yang mencukur dan memendekkan rambutnya wahai Tuhan yang Maha Luas ampunan-Nya. Ya Allah tetapkanlah untuk diriku setiap helai rambut kebajikan dan hapuskanlah untukku dengan setiap helai rambut kejelekan. Dan angkatlah derajatku di sisimu",
    },
    {
      'title': 'Doa setelah Tahalul',
      'arab':
          "اﻟﺤَﻤْﺪُ ﻟِﻠَّﻪِ / اﻟَّﺬِﻱْ ﻗَﻀَﻰ ﻋَﻨَّﺎ/ ﻣَﻨَﺎﺳِﻜَﻨَﺎ / اﻟﻠَّﻬُﻢَّ/ ﺯِﺩْﻧَﺎ ﺇِﻳْﻤَﺎﻧًﺎ / ﻭَﻳَﻘِﻴْﻨًﺎ/ ﻭَﻋَﻮْﻧًﺎ / ﻭَاﻏْﻔِﺮْ ﻟَﻨَﺎ/ ﻭَﻟِﻮَاﻟِﺪِﻳْﻨَﺎ / ﻭَﻟِﺴَﺎﺋِﺮِ اﻟﻤُﺴْﻠِﻤِﻴْﻦ",
      'transliteration':
          "Alhamdulillahilladzi qada 'anna manasikana. Allahumma zidni imanan wayaqinan wa 'aunan waghfirlanan waliwalidaina walisa iril muslimina wal muslimat",
      'translation':
          "Segala puji bagi Allah yang telah menyelesaikan manasik kami, Ya Allah tambahkanlah kepada kami iman, keyakinan, dan pertolongan dan ampunilah kami, kedua orang tua kami dan seluruh kaum muslimin dan muslimat",
    },
    // Tambahkan set doa lainnya di sini
  ];
  final List<Map<String, String>> doaListTertib = [
    {
      'title': 'Tertib',
      'arab': '',
      'transliteration': '',
      'translation': 'Ya Allah, kupenuhi panggilan-Mu untuk ber-Umrah',
    },
  ];

  Widget _buildTabNiat(List<Map<String, String>> doaListNiat) {
    return Column(
      children: [
        // Tombol Switch di Bagian Atas
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("Arab", style: TextStyle(fontSize: 14.0)),
              Text("Transliterasi", style: TextStyle(fontSize: 14.0)),
              Text("Arti", style: TextStyle(fontSize: 14.0)),
            ],
          ),
        ),
        // Switch untuk menampilkan teks
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
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
        ),
        // Daftar Doa
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
              itemCount: doaListNiat.length,
              itemBuilder: (context, index) {
                final doa = doaListNiat[index];
                return Column(
                  children: [
                    const SizedBox(height: 16.0),
                    Text(
                      doa['title']!,
                      style: const TextStyle(
                        fontSize: 22.0,
                        letterSpacing: 0.29,
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    if (_switchStates['arab']!)
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20.0,
                          vertical: 10.0,
                        ),
                        child: Text(
                          doa['arab']!,
                          textDirection: TextDirection.rtl,
                          textAlign: TextAlign.right,
                          style: const TextStyle(fontSize: 32.0),
                        ),
                      ),
                    if (_switchStates['transliteration']!)
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20.0,
                          vertical: 10.0,
                        ),
                        child: Text(
                          doa['transliteration']!,
                          textAlign: TextAlign.right,
                          style: const TextStyle(fontSize: 22.0),
                        ),
                      ),
                    if (_switchStates['translation']!)
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20.0,
                          vertical: 10.0,
                        ),
                        child: Text(
                          doa['translation']!,
                          textAlign: TextAlign.right,
                          style: const TextStyle(fontSize: 15.0),
                        ),
                      ),
                    const SizedBox(height: 16.0),
                  ],
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  int _selectedRound = 0;

  Widget _buildTabTawaf(List<List<Map<String, String>>> doaListTawaf) {
    return Column(
      children: [
        // Dropdown untuk memilih putaran
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: DropdownButton<int>(
            value: _selectedRound,
            onChanged: (int? newValue) {
              setState(() {
                _selectedRound = newValue!;
              });
            },
            items: List<DropdownMenuItem<int>>.generate(
              7,
              (index) => DropdownMenuItem<int>(
                value: index,
                child: Text('Putaran ${index + 1}'),
              ),
            ),
          ),
        ),
        // Tombol Switch di Bagian Atas
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("Arab", style: TextStyle(fontSize: 14.0)),
              Text("Transliterasi", style: TextStyle(fontSize: 14.0)),
              Text("Arti", style: TextStyle(fontSize: 14.0)),
            ],
          ),
        ),
        // Switch untuk menampilkan teks
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
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
        ),
        // Daftar Doa untuk Putaran yang Dipilih
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
              itemCount: doaListTawaf[_selectedRound].length,
              itemBuilder: (context, index) {
                final doa = doaListTawaf[_selectedRound][index];
                return Column(
                  children: [
                    const SizedBox(height: 16.0),
                    Text(
                      doa['title']!,
                      style: const TextStyle(
                        fontSize: 22.0,
                        letterSpacing: 0.29,
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    if (_switchStates['arab']!)
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20.0,
                          vertical: 10.0,
                        ),
                        child: Text(
                          doa['arab']!,
                          textDirection: TextDirection.rtl,
                          textAlign: TextAlign.right,
                          style: const TextStyle(fontSize: 32.0),
                        ),
                      ),
                    if (_switchStates['transliteration']!)
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20.0,
                          vertical: 10.0,
                        ),
                        child: Text(
                          doa['transliteration']!,
                          textAlign: TextAlign.right,
                          style: const TextStyle(fontSize: 22.0),
                        ),
                      ),
                    if (_switchStates['translation']!)
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20.0,
                          vertical: 10.0,
                        ),
                        child: Text(
                          doa['translation']!,
                          textAlign: TextAlign.right,
                          style: const TextStyle(fontSize: 15.0),
                        ),
                      ),
                    const SizedBox(height: 16.0),
                  ],
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  int _selectedRoundSai = 0;

  Widget _buildTabSai(List<List<Map<String, String>>> doaListSai) {
    return Column(
      children: [
        // Dropdown untuk memilih putaran
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: DropdownButton<int>(
            value: _selectedRoundSai,
            onChanged: (int? newValue) {
              setState(() {
                _selectedRoundSai = newValue!;
              });
            },
            items: List<DropdownMenuItem<int>>.generate(
              7,
              (index) => DropdownMenuItem<int>(
                value: index,
                child: Text('Perjalanan ${index + 1}'),
              ),
            ),
          ),
        ),
        // Tombol Switch di Bagian Atas
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("Arab", style: TextStyle(fontSize: 14.0)),
              Text("Transliterasi", style: TextStyle(fontSize: 14.0)),
              Text("Arti", style: TextStyle(fontSize: 14.0)),
            ],
          ),
        ),
        // Switch untuk menampilkan teks
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
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
        ),
        // Daftar Doa untuk Putaran yang Dipilih
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
              itemCount: doaListSai[_selectedRoundSai].length,
              itemBuilder: (context, index) {
                final doa = doaListSai[_selectedRoundSai][index];
                return Column(
                  children: [
                    const SizedBox(height: 16.0),
                    Text(
                      doa['title']!,
                      style: const TextStyle(
                        fontSize: 22.0,
                        letterSpacing: 0.29,
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    if (_switchStates['arab']!)
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20.0,
                          vertical: 10.0,
                        ),
                        child: Text(
                          doa['arab']!,
                          textDirection: TextDirection.rtl,
                          textAlign: TextAlign.right,
                          style: const TextStyle(fontSize: 32.0),
                        ),
                      ),
                    if (_switchStates['transliteration']!)
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20.0,
                          vertical: 10.0,
                        ),
                        child: Text(
                          doa['transliteration']!,
                          textAlign: TextAlign.right,
                          style: const TextStyle(fontSize: 22.0),
                        ),
                      ),
                    if (_switchStates['translation']!)
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20.0,
                          vertical: 10.0,
                        ),
                        child: Text(
                          doa['translation']!,
                          textAlign: TextAlign.right,
                          style: const TextStyle(fontSize: 15.0),
                        ),
                      ),
                    const SizedBox(height: 16.0),
                  ],
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTabTahalul(List<Map<String, String>> doaListTahalul) {
    return Column(
      children: [
        // Tombol Switch di Bagian Atas
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("Arab", style: TextStyle(fontSize: 14.0)),
              Text("Transliterasi", style: TextStyle(fontSize: 14.0)),
              Text("Arti", style: TextStyle(fontSize: 14.0)),
            ],
          ),
        ),
        // Switch untuk menampilkan teks
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
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
        ),
        // Daftar Doa
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
              itemCount: doaListTahalul.length,
              itemBuilder: (context, index) {
                final doa = doaListTahalul[index];
                return Column(
                  children: [
                    const SizedBox(height: 16.0),
                    Text(
                      doa['title']!,
                      style: const TextStyle(
                        fontSize: 22.0,
                        letterSpacing: 0.29,
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    if (_switchStates['arab']!)
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20.0,
                          vertical: 10.0,
                        ),
                        child: Text(
                          doa['arab']!,
                          textDirection: TextDirection.rtl,
                          textAlign: TextAlign.right,
                          style: const TextStyle(fontSize: 32.0),
                        ),
                      ),
                    if (_switchStates['transliteration']!)
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20.0,
                          vertical: 10.0,
                        ),
                        child: Text(
                          doa['transliteration']!,
                          textAlign: TextAlign.right,
                          style: const TextStyle(fontSize: 22.0),
                        ),
                      ),
                    if (_switchStates['translation']!)
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20.0,
                          vertical: 10.0,
                        ),
                        child: Text(
                          doa['translation']!,
                          textAlign: TextAlign.right,
                          style: const TextStyle(fontSize: 15.0),
                        ),
                      ),
                    const SizedBox(height: 16.0),
                  ],
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTabTertib(List<Map<String, String>> doaListTertib) {
    return Column(
      children: [
        // Tombol Switch di Bagian Atas
        Container(
          color: const Color.fromRGBO(255, 255, 255, 1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    height: 220.0,
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: ExactAssetImage('assets/img/tertibnospace.png'),
                      ),
                    ),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(24, 0, 24, 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Tertib",
                          style: TextStyle(
                            fontSize: 35.0,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(24, 10, 24, 32),
                child: Row(
                  children: <Widget>[
                    Flexible(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Jama’ah ibadah Umroh harus melaksanakan rangkaian ibadah sesuai urutan dan aturan yang ditetapkan. Pastikan ketika melaksanakan rukun Umroh tidak boleh melewatkan atau melompati rangkaian ibadah Umroh",
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w200,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const BerandaPage(title: 'Beranda'),
                    ),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.green,
                  ),
                  alignment: Alignment.center,
                  height: 50.0,
                  width: 300.0,
                  child: const Text(
                    "Selesai",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24.0,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
