import 'dart:convert';

import 'package:flutter/cupertino.dart';

class Data {
  final String from;
  final String? type;
  final String body;

  Data({
    required this.from,
    required this.type,
    required this.body,
  });

  factory Data.fromJsonBody(String from, String body) {
    final parsedJson = jsonDecode(body);
    final type = parsedJson["type"] as String?;
    return Data(from: from, type: type, body: body);
  }
}

