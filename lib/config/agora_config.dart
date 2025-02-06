import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>> fetchAgoraConfig() async {
  final response = await http.get(
    Uri.parse('https://www.rosanatravel.com/agora/get_config'),
  );

  if (response.statusCode == 200) {
    return jsonDecode(response.body);
  } else {
    throw Exception('Failed to load Agora config');
  }
}

class AgoraConfig {
  static String appId = '';
  static String token = '';
  static String channelId = '';
  static int uid = 0;

  static Future<void> initialize() async {
    try {
      final config = await fetchAgoraConfig();
      appId = config['appId'];
      token = config['token'];
      channelId = config['channelId'];
    } catch (e) {
      print('Error initializing Agora config: $e');
    }
  }
}
