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
    final parsedBody = jsonDecode(body);
    final type = parsedBody["type"] as String?;

    const encoder = JsonEncoder.withIndent("  ");
    final prettyBody = encoder.convert(parsedBody);

    return Data(from: from, type: type, body: prettyBody);
  }
}

