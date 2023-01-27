import 'dart:convert';

import 'package:flutter/cupertino.dart';

class Deal {
  final String id;
  final String dataType;
  final String body;

  Deal({
    required this.id,
    required this.dataType,
    required this.body,
  });

  factory Deal.fromJsonBody(String body) {
    final parsedBody = jsonDecode(body);
    final id = parsedBody["id"] as String;
    final dataType = parsedBody["data_type"] as String;

    const encoder = JsonEncoder.withIndent("  ");
    final prettyBody = encoder.convert(parsedBody);

    return Deal(id: id, dataType: dataType, body: prettyBody);
  }
}

