import 'dart:convert';
import 'package:http/http.dart' as http;

import 'dataclass.dart';

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
