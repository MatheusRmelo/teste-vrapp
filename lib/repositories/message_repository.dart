import 'dart:convert';

import 'package:app/models/message.dart';
import 'package:http/http.dart' as http;

class MessageRepository {
  final String _baseUrl = 'http://10.0.2.2:8080/api';

  Future<void> sendMessage(Message message) async {
    final response = await http.post(
        Uri.parse(
          '$_baseUrl/notificar',
        ),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode(message.toJson()));
    if (response.statusCode > 200 && response.statusCode < 300) {
      return;
    }
    throw Exception('Failed to send message');
  }
}
