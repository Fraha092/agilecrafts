import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter_data/flutter_data.dart';

mixin JSONPlaceholderAdapter<T extends DataModel<T>> on RemoteAdapter<T> {
  @override
  String get baseUrl => 'https://stg-zero.propertyproplus.com.au/api';

  @override
  FutureOr<Map<String, String>> get defaultHeaders async {
    return await super.defaultHeaders &
    {
      'Abp.TenantId': '10',
      'Content-Type': 'application/json',
    };
  }

  @override
  Future<Map<String, dynamic>> authenticateUser(String username, String password) async {
    final apiUrl = '$baseUrl/TokenAuth/Authenticate';

    final body = jsonEncode({
      'userNameOrEmailAddress': username,
      'password': password,
    });

    final response = await http.post(Uri.parse(apiUrl), headers: await defaultHeaders, body: jsonEncode(body));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      print('response body::: $data');
      return data;
    } else {
      throw Exception('Authentication failed');
    }
  }
}