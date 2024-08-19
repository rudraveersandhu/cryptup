import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/status.dart' as status;

class AmpiyWebSocketService {
  final WebSocketChannel channel;
  final Function(Map<String, Map<String, dynamic>>) onDataReceived;
  final Map<String, Map<String, dynamic>> _coinData = {};

  AmpiyWebSocketService(this.onDataReceived)
      : channel = WebSocketChannel.connect(
    Uri.parse('ws://prereg.ex.api.ampiy.com/prices'),
  ) {
    _initConnection();
  }

  void _initConnection() {
    final subscriptionMessage = jsonEncode({
      "method": "SUBSCRIBE",
      "params": ["all@ticker"],
      "cid": 1,
    });

    channel.sink.add(subscriptionMessage);

    channel.stream.listen((message) {
      final decodedMessage = jsonDecode(message);
      final List<dynamic> data = decodedMessage['data'] ?? [];
      for (var item in data) {
        _coinData[item['s']] = item;
      }
      onDataReceived(_coinData);
    });
  }

  void dispose() {
    channel.sink.close(status.normalClosure);
  }
}
