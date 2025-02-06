// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:intl/intl.dart';

class DetailPaketPage extends StatefulWidget {
  const DetailPaketPage(this.idPaket, {super.key});

  final String idPaket;

  @override
  _DetailPaketPageState createState() => _DetailPaketPageState();
}

class _DetailPaketPageState extends State<DetailPaketPage> {
  Map<String, dynamic> _paket = {};

  @override
  void initState() {
    super.initState();
    _fetchPaket();
  }

  _fetchPaket() async {
    try {
      var uri = Uri.parse(
        'https://www.rosanatravel.com/paket/get_detail_paket/${widget.idPaket}',
      );

      var response = await http.get(uri);

      if (response.statusCode == 200) {
        var responseData = json.decode(response.body);

        if (responseData != null && responseData is Map<String, dynamic>) {
          setState(() {
            _paket = responseData;
          });
        } else {
          print('Invalid response data');
        }
      } else {
        print('Error ${response.statusCode}: ${response.reasonPhrase}');
      }
    } catch (error) {
      print('Error: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0, title: const Text('Detail Paket')),
      body:
          _paket.isEmpty
              ? const Center(child: CircularProgressIndicator())
              : Stack(
                children: [
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        if (_paket['paket_img'] != null)
                          SizedBox(
                            width: double.infinity,
                            child: Card(
                              clipBehavior: Clip.none,
                              elevation: 1,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(4.0),
                                  bottom: Radius.circular(4.0),
                                ),
                              ),
                              child: ClipRRect(
                                borderRadius: const BorderRadius.vertical(
                                  top: Radius.circular(4.0),
                                  bottom: Radius.circular(4.0),
                                ),
                                child: Image.network(
                                  'https://rosantravel.com/admin/assets/images/' +
                                      _paket['paket_img'],
                                  fit: BoxFit.cover,
                                  height: 300,
                                  width: double.infinity,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Container(
                                      height: 150,
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
                            ),
                          ),
                        const SizedBox(height: 5),
                        const Padding(
                          padding: EdgeInsets.fromLTRB(22.0, 10.0, 22.0, 0.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Add your details like travel, kategori, nama_program, etc.
                            ],
                          ),
                        ),
                        if (_paket['nama_program'] != null &&
                            _paket['nama_program'] != 'No title')
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
                                        _paket['nama_program']?.isNotEmpty ==
                                                true
                                            ? _paket['nama_program']
                                                .toLowerCase()
                                                .split(' ')
                                                ?.where(
                                                  (String s) => s.isNotEmpty,
                                                )
                                                ?.map(
                                                  (s) =>
                                                      s[0].toUpperCase() +
                                                      s.substring(1),
                                                )
                                                ?.join(' ')
                                            : '',
                                        style: const TextStyle(
                                          fontSize: 24.0,
                                          fontWeight: FontWeight.w400,
                                        ),
                                        softWrap: true,
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        if (_paket['paket'] != null &&
                            _paket['paket'] != 'No content')
                          Padding(
                            padding: const EdgeInsets.fromLTRB(
                              22.0,
                              10.0,
                              22.0,
                              0.0,
                            ),
                            child: Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0,
                                    vertical: 6.0,
                                  ),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.green),
                                    borderRadius: BorderRadius.circular(50.0),
                                  ),
                                  child: Text(
                                    _paket['paket'],
                                    style: const TextStyle(
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 5),
                                Row(
                                  children: List.generate(
                                    int.parse(_paket['bintang_mekkah']),
                                    (index) => const Icon(
                                      Icons.star_rounded,
                                      color: Color.fromARGB(255, 255, 213, 0),
                                      size: 22.0,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(
                            22.0,
                            10.0,
                            22.0,
                            0.0,
                          ),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.calendar_month,
                                color: Colors.orange,
                                size: 18.0,
                              ),
                              const SizedBox(width: 5),
                              if (_paket['tanggal_keberangkatan'] != null)
                                Text(
                                  DateFormat('dd MMMM yyyy').format(
                                    DateTime.parse(
                                      _paket['tanggal_keberangkatan'],
                                    ),
                                  ),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 14.0,
                                  ),
                                )
                              else
                                const SizedBox.shrink(),
                            ],
                          ),
                        ),
                        // if (_paket['uang_muka'] != null &&
                        //     _paket['uang_muka'] != 'No content')
                        //   Padding(
                        //     padding: const EdgeInsets.symmetric(
                        //       horizontal: 20.0,
                        //     ),
                        //     child: Html(
                        //       data: _paket['uang_muka'],
                        //       style: {
                        //         'body': Style(
                        //           lineHeight: const LineHeight(1.4),
                        //         ),
                        //       },
                        //     ),
                        //   ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      color: Colors.white,
                      child: Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Text(
                                      'Uang Muka:',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      'Rp. ${NumberFormat.decimalPattern().format(int.parse(_paket['uang_muka']))}',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: ElevatedButton(
                              onPressed: () {
                                // launch(
                                //   'https://api.whatsapp.com/send?phone=628113003258&text=Halo%2C%20saya%20ingin%20tahu%20lebih%20lanjut%20mengenai%20produk%20yang%20ada%20di%20Website%2C%20%F0%9F%98%8A',
                                // );
                              },
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 12.0,
                                  horizontal: 36.0,
                                ),
                                backgroundColor: Colors.green,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                              child: const Text(
                                'Pesan',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
    );
  }
}
