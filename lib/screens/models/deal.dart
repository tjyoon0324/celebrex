import 'dart:convert';

import 'package:flutter/cupertino.dart';

class Deal {
  final String id;
  final String body;

  Deal({
    required this.id,
    required this.body,
  });

  factory Deal.fromJsonBody(String body) {
    final parsedBody = jsonDecode(body);
    final id = parsedBody["id"] as String;

    const encoder = JsonEncoder.withIndent("  ");
    final prettyBody = encoder.convert(parsedBody);

    return Deal(id: id, body: prettyBody);
  }
}

