import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:flutter_client/core/server_response.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class TransactionService {
  final String rootUrl = 'http://192.168.1.9:5000/api/v1';

  Future<ServerResponse> getAllTransactions() async {
    final res = await http.get(rootUrl + '/transactions');
    return ServerResponse.fromJson(json.decode(res.body));
  }
}
