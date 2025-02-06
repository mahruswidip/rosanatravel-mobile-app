// ignore_for_file: deprecated_member_use

import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:rosanatravel/doa/doanew.dart';
import 'package:rosanatravel/umroh/umrohnew.dart';
import 'package:rosanatravel/voice_call_page.dart';
import 'apiHelper/dataclass.dart';
import 'artikel/detailartikel.dart';
import 'paket/detailpaket.dart';
// import 'panduan/pilihan.dart';
import 'sholat/qiblah.dart';
import 'sholat/sholat.dart';
import 'widget/button.dart';

class Service {
  Future<List<cData>> getAllData() async {
    final response = await http.get(
      Uri.parse('https://www.rosanatravel.com/artikel/get'),
    );

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body)['data'];
      return jsonResponse.map((data) => cData.fromJson(data)).toList();
    } else {
      throw Exception('Failed Load Data');
    }
  }

  Future<List<PaketData>> getListPaket() async {
    final response = await http.get(
      Uri.parse('https://www.rosanatravel.com/paket/get_paket'),
    );

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((data) => PaketData.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load paket data');
    }
  }
}

class BerandaPage extends StatefulWidget {
  const BerandaPage({super.key, required String title});

  @override
  State<BerandaPage> createState() => _BerandaPageState();
}

class _BerandaPageState extends State<BerandaPage> {
  Service serviceAPI = Service();
  late Future<List<cData>> listData;
  late Future<List<PaketData>> listPaket;

  @override
  void initState() {
    super.initState();
    listData = serviceAPI.getAllData();
    listPaket = serviceAPI.getListPaket();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(245, 255, 250, 1),
      appBar: AppBar(
        toolbarHeight: kToolbarHeight + 100,
        centerTitle: false,
        backgroundColor: Colors.green,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.only(left: 8.0, top: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Assalamualaikum,',
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.8,
                ),
              ),
              const Text(
                'Mau mencari doa apa ?',
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: TextStyle(
                  fontSize: 24.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.8,
                ),
              ),
              const SizedBox(height: 12.0),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DoaApp()),
                  );
                },
                child: Container(
                  height: 48.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: const Row(
                    children: [
                      Icon(Icons.search, color: Colors.grey),
                      SizedBox(width: 16.0),
                      Text(
                        'Doa saat Masuk Masjid',
                        style: TextStyle(color: Colors.grey, fontSize: 16.0),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
              child: SafeArea(
                child: Center(
                  // Menempatkan Column di tengah layar
                  child: Column(
                    mainAxisAlignment:
                        MainAxisAlignment
                            .spaceEvenly, // Membagi ruang secara merata
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 10.0),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 2,
                              offset: const Offset(2, 3),
                            ),
                          ],
                        ),
                        padding: const EdgeInsets.symmetric(
                          vertical: 20.0,
                          horizontal: 15.0,
                        ),
                        child: Wrap(
                          alignment:
                              WrapAlignment
                                  .center, // Menyelaraskan widget di tengah
                          spacing: 10.0, // Jarak horizontal antar widget
                          runSpacing: 10.0, // Jarak vertikal antar baris
                          children: [
                            MyHomeMainButton(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DoaApp(),
                                  ),
                                );
                              },
                              color: Colors.amber,
                              asset: 'assets/svg/menu_utama/book.svg',
                              text: 'Daftar Doa',
                            ),
                            MyHomeMainButton(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const UmrohPage(),
                                  ),
                                );
                              },
                              color: Colors.amber,
                              asset: 'assets/svg/menu_utama/umroh.svg',
                              text: 'Panduan',
                            ),
                            MyHomeMainButtonAmber(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const Sholat(),
                                  ),
                                );
                              },
                              color: Colors.amber,
                              asset: 'assets/svg/menu_utama/sholat.svg',
                              text: 'Sholat',
                            ),
                            MyHomeMainButtonAmber(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const Qiblah(),
                                  ),
                                );
                              },
                              color: Colors.amber,
                              asset: 'assets/svg/menu_utama/compass.svg',
                              text: 'Kiblat',
                            ),
                            MyHomeMainButtonAmber(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder:
                                        (context) => JoinChannelAudio(
                                          title: 'Audio Join',
                                        ),
                                  ),
                                );
                              },
                              color: Colors.amber,
                              asset: 'assets/svg/menu_utama/headset.svg',
                              text: 'Ear Hajj Virtual',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            const Padding(
              padding: EdgeInsets.fromLTRB(18, 20, 0, 0),
              child: Text(
                'Paket',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Color.fromARGB(221, 40, 40, 40),
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.8,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 10),
              child: FutureBuilder<List<PaketData>>(
                future: listPaket,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(child: Text('No data available'));
                  }

                  List<PaketData> isiPaket = snapshot.data!;
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children:
                          isiPaket.map((paket) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder:
                                        (_) => DetailPaketPage(paket.idPaket),
                                  ),
                                );
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Material(
                                  surfaceTintColor: Color.fromRGBO(
                                    245,
                                    255,
                                    250,
                                    1,
                                  ),
                                  elevation: 0,
                                  borderRadius: BorderRadius.circular(15.0),
                                  child: Container(
                                    width: 150,
                                    height: 250,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: Colors.transparent,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                            8.0,
                                          ),
                                          child: CachedNetworkImage(
                                            imageUrl: paket.paketImg,
                                            fit: BoxFit.cover,
                                            height: 150,
                                            width: double.infinity,
                                            placeholder:
                                                (context, url) => Center(
                                                  child:
                                                      CircularProgressIndicator(),
                                                ),
                                            errorWidget:
                                                (context, url, error) =>
                                                    Container(
                                                      height: 150,
                                                      color: Colors.grey,
                                                      child: const Center(
                                                        child: Icon(
                                                          Icons.error,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ),
                                          ),
                                        ),
                                        const SizedBox(height: 8),
                                        Text(
                                          paket.paket,
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                          style: const TextStyle(
                                            color: Colors.black54,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12,
                                          ),
                                        ),
                                        const SizedBox(height: 2),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            right: 8.0,
                                          ),
                                          child: Text(
                                            paket.namaProgram
                                                .toLowerCase()
                                                .replaceAllMapped(
                                                  RegExp(r'\b\w'),
                                                  (match) =>
                                                      match
                                                          .group(0)!
                                                          .toUpperCase(),
                                                ),
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                            style: const TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 14,
                                              color: Color.fromARGB(
                                                221,
                                                40,
                                                40,
                                                40,
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 2),
                                        const Text(
                                          'Uang Muka',
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                          style: TextStyle(
                                            color: Colors.black54,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 8,
                                          ),
                                        ),
                                        const SizedBox(height: 0),
                                        Text(
                                          'Rp. ${NumberFormat.decimalPattern().format(int.parse(paket.uangMuka))}',
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                          style: const TextStyle(
                                            color: Colors.green,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 1.0),
            const Padding(
              padding: EdgeInsets.fromLTRB(18, 8, 0, 0),
              child: Text(
                'Artikel',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Color.fromARGB(221, 40, 40, 40),
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.8,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 10),
              child: FutureBuilder<List<cData>>(
                future: listData,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(child: Text('No data available'));
                  }

                  List<cData> isiData = snapshot.data!;
                  return ListView.builder(
                    scrollDirection: Axis.vertical,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: isiData.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 0.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (_) => DetailArtikelPage(
                                      isiData[index].idArtikel,
                                    ),
                              ),
                            );
                          },
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width - 10,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Material(
                                elevation: 0,
                                borderRadius: BorderRadius.circular(15.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.transparent,
                                  ),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(
                                          8.0,
                                        ),
                                        child: Image.network(
                                          isiData[index].artikelImg,
                                          fit: BoxFit.cover,
                                          height: 100,
                                          width: 100,
                                          errorBuilder: (
                                            context,
                                            error,
                                            stackTrace,
                                          ) {
                                            return Container(
                                              height: 100,
                                              width: 100,
                                              color: Colors.grey,
                                              child: const Center(
                                                child: Icon(
                                                  Icons.error,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                      const SizedBox(width: 15),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                right: 22.0,
                                              ),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    isiData[index].judulArtikel
                                                        .toLowerCase()
                                                        .replaceAllMapped(
                                                          RegExp(r'\b\w'),
                                                          (match) =>
                                                              match
                                                                  .group(0)!
                                                                  .toUpperCase(),
                                                        ),
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    maxLines: 2,
                                                    textAlign: TextAlign.left,
                                                    style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 16,
                                                      color: Color.fromARGB(
                                                        221,
                                                        40,
                                                        40,
                                                        40,
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(height: 8),
                                                  Text(
                                                    isiData[index].konten
                                                        .replaceAll(
                                                          RegExp(
                                                            r'<[^>]*>|&[^;]+;',
                                                          ),
                                                          '',
                                                        ),
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    maxLines: 2,
                                                    textAlign: TextAlign.left,
                                                    style: const TextStyle(
                                                      color: Colors.black54,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 14,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(height: 10),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
