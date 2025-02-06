import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../apiHelper/dataclass.dart';

class Service {
  Future<List<DoaData>> getAllDoa() async {
    final response = await http.get(
      Uri.parse('https://www.rosanatravel.com/doa/get'),
    );

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body)['data'];
      return jsonResponse.map((data) => DoaData.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }
}

class DoaApp extends StatefulWidget {
  const DoaApp({super.key});

  @override
  _DoaAppState createState() => _DoaAppState();
}

class _DoaAppState extends State<DoaApp> {
  List<DoaData> allDoaList = [];
  List<DoaData> filteredDoaList = [];
  String searchQuery = '';

  @override
  void initState() {
    super.initState();
    fetchDoa();
  }

  Future<void> fetchDoa() async {
    Service service = Service();
    allDoaList = await service.getAllDoa();
    setState(() {
      filteredDoaList = allDoaList; // Tampilkan semua doa setelah diambil
    });
  }

  void updateSearchQuery(String query) {
    setState(() {
      searchQuery = query;
      if (query.isEmpty) {
        filteredDoaList = allDoaList; // Tampilkan semua jika query kosong
      } else {
        filteredDoaList =
            allDoaList
                .where(
                  (doa) =>
                      doa.title.toLowerCase().contains(query.toLowerCase()),
                )
                .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          toolbarHeight: kToolbarHeight + 30,
          centerTitle: false,
          backgroundColor: Colors.green,
          elevation: 0,
          title: Padding(
            padding: const EdgeInsets.only(left: 0, top: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  onChanged: updateSearchQuery,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color.fromARGB(255, 255, 255, 255),
                    hintText: 'Cari Doa',
                    hintStyle: const TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                    ),
                    prefixIcon: const Icon(Icons.search, color: Colors.grey),
                  ),
                ),
              ],
            ),
          ),
        ),
        body:
            filteredDoaList.isEmpty
                ? Center(
                  child: Text(
                    'Tidak ada hasil ditemukan',
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                )
                : ListView.builder(
                  itemCount: filteredDoaList.length * 2 - 1,
                  itemBuilder: (context, index) {
                    if (index.isOdd) {
                      // Divider antar item
                      return Divider(height: 1, color: Colors.grey.shade300);
                    } else {
                      final doaIndex = index ~/ 2;
                      final doa = filteredDoaList[doaIndex];
                      final category = doa.category;

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (index == 0 ||
                              (category !=
                                  filteredDoaList[doaIndex - 1].category))
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 16,
                                top: 8,
                                bottom: 8,
                              ),
                              child: Text(
                                category,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22.0,
                                ),
                              ),
                            ),
                          ListTile(
                            title: Text(
                              doa.title,
                              style: const TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.w500,
                                color: Color.fromARGB(221, 40, 40, 40),
                              ),
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DoaDetailPage(doa: doa),
                                ),
                              );
                            },
                          ),
                        ],
                      );
                    }
                  },
                ),
      ),
    );
  }
}

class DoaDetailPage extends StatefulWidget {
  final DoaData doa;

  const DoaDetailPage({super.key, required this.doa});

  @override
  _DoaDetailPageState createState() => _DoaDetailPageState();
}

class _DoaDetailPageState extends State<DoaDetailPage> {
  bool isArabOn = true;
  bool isTransOn = true;
  bool isArtiOn = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.doa.title),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Judul Doa
              Center(
                child: Text(
                  widget.doa.title,
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 20),
              // Switch Arab, Transliteration, Arti
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text("Arab", style: TextStyle(fontSize: 16)),
                      Switch(
                        activeColor: Colors.white,
                        activeTrackColor: Colors.amber,
                        inactiveThumbColor: Colors.white,
                        inactiveTrackColor: Colors.grey,
                        value: isArabOn,
                        onChanged: (newValue) {
                          setState(() {
                            isArabOn = newValue;
                          });
                        },
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text("Transliterasi", style: TextStyle(fontSize: 16)),
                      Switch(
                        activeColor: Colors.white,
                        activeTrackColor: Colors.amber,
                        inactiveThumbColor: Colors.white,
                        inactiveTrackColor: Colors.grey,
                        value: isTransOn,
                        onChanged: (newValue) {
                          setState(() {
                            isTransOn = newValue;
                          });
                        },
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text("Arti", style: TextStyle(fontSize: 16)),
                      Switch(
                        activeColor: Colors.white,
                        activeTrackColor: Colors.amber,
                        inactiveThumbColor: Colors.white,
                        inactiveTrackColor: Colors.grey,
                        value: isArtiOn,
                        onChanged: (newValue) {
                          setState(() {
                            isArtiOn = newValue;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),

              SizedBox(height: 20),

              // Doa dalam Bahasa Arab
              Visibility(
                visible: isArabOn,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    widget.doa.arab,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.right,
                  ),
                ),
              ),

              // Transliterasi
              Visibility(
                visible: isTransOn,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Transliterasi:",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        widget.doa.transliteration,
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),

              // Arti Doa
              Visibility(
                visible: isArtiOn,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Arti:",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        widget.doa.translation,
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 20),

              // Divider
              Center(
                child: Container(
                  height: 2,
                  width: 200,
                  color: Colors.grey[300],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(DoaApp());
}
