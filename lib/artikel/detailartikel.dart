import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DetailArtikelPage extends StatefulWidget {
  const DetailArtikelPage(this.idArtikel, {Key? key}) : super(key: key);

  final String idArtikel;

  @override
  _DetailArtikelPageState createState() => _DetailArtikelPageState();
}

class _DetailArtikelPageState extends State<DetailArtikelPage> {
  Map<String, dynamic> _artikel = {};

  @override
  void initState() {
    super.initState();
    _fetchArtikel();
  }

  _fetchArtikel() async {
    var uri = Uri.parse(
      'https://www.rosanatravel.com/artikel/get_detail_artikel/${widget.idArtikel}',
    );

    var response = await http.post(
      uri,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({"id_artikel": widget.idArtikel}),
    );

    if (response.statusCode == 200) {
      setState(() {
        _artikel = json.decode(response.body)['data'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0, title: const Text('Detail Artikel')),
      body:
          _artikel.isEmpty
              ? const Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
                child: Column(
                  children: [
                    if (_artikel['artikel_img'] != null)
                      SizedBox(
                        width: double.infinity,
                        child: Card(
                          clipBehavior: Clip.none,
                          elevation: 4,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(0.0),
                              bottom: Radius.circular(15.0),
                            ),
                          ),
                          child: ClipRRect(
                            borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(0.0),
                              bottom: Radius.circular(15.0),
                            ),
                            child: FadeInImage(
                              placeholder: const AssetImage(
                                'assets/img/card.png',
                              ),
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                'https://rosanatravel.com/admin/assets/images/artikel/' +
                                    _artikel['artikel_img'],
                              ),
                            ),
                          ),
                        ),
                      ),
                    const SizedBox(height: 5),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(22.0, 10.0, 22.0, 0.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          if (_artikel['penulis'] != null &&
                              _artikel['penulis'] != 'No title')
                            Text(
                              // ignore: prefer_interpolation_to_compose_strings
                              "Ditulis Oleh " + _artikel['penulis'],
                              style: const TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.w400,
                                color: Colors.black54,
                              ),
                            ),
                          const SizedBox(width: 80.0),
                          if (_artikel['kategori'] != null &&
                              _artikel['kategori'] != 'No title')
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 6,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.amber,
                              ),
                              child: Text(
                                _artikel['kategori'],
                                style: const TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black87,
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    if (_artikel['judul_artikel'] != null &&
                        _artikel['judul_artikel'] != 'No title')
                      LayoutBuilder(
                        builder: (
                          BuildContext context,
                          BoxConstraints constraints,
                        ) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0,
                                ),
                                child: SizedBox(
                                  width: constraints.maxWidth - 40,
                                  child: Text(
                                    _artikel['judul_artikel']?.isNotEmpty ==
                                            true
                                        ? _artikel['judul_artikel']
                                            .toLowerCase()
                                            .split(' ')
                                            ?.where((String s) => s.isNotEmpty)
                                            ?.map(
                                              (s) =>
                                                  s[0].toUpperCase() +
                                                  s.substring(1),
                                            )
                                            ?.join(' ')
                                        : '',
                                    style: const TextStyle(
                                      fontSize: 24.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    softWrap: true,
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    if (_artikel['konten'] != null &&
                        _artikel['konten'] != 'No content')
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Html(
                          data: _artikel['konten'],
                          style: {
                            'body': Style(lineHeight: const LineHeight(1.4)),
                          },
                        ),
                      ),
                  ],
                ),
              ),
    );
  }
}
