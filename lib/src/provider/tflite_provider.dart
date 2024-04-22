import 'dart:async';
import 'dart:convert';
import 'dart:developer' as dev;

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

import '../../env/env.dart';

class TfliteProvider extends AsyncNotifier<Map<String, String>> {
  Map<String, String> result = {};
  Future<Map<String, String>> fetchTflite(List<double> inputs) async {
    dev.log("inputs: $inputs");

    try {
      final String baseUrl = Env.baseUrl;
      final response = await http.post(
        Uri.parse('$baseUrl/predict'),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode({"input_sequence": inputs.toString()}),
      );

      if (response.statusCode == 200) {
        result = Map<String, String>.from(jsonDecode(response.body));
      } else {
        throw Exception('Response is not 200: ${response.body}');
      }
    } catch (e) {
      debugPrint(e.toString());
    }

    return result;
  }

  @override
  FutureOr<Map<String, String>> build() {
    return result;
  }
}

final tfliteProvider =
    AsyncNotifierProvider<TfliteProvider, Map<String, String>>(
        () => TfliteProvider());
