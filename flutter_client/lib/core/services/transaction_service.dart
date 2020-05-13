import 'dart:convert';

import 'package:flutter_client/core/models/transaction.dart';
import 'package:http/http.dart' as http;

import 'package:flutter_client/core/server_response.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class TransactionService {
  final String rootUrl = 'http://192.168.1.9:5000/api/v1';

  List<Transaction> transactionList = [];

  Future<ServerResponse> getAllTransactions() async {
    final res = await http.get(rootUrl + '/transactions');
    return ServerResponse.fromJson(json.decode(res.body));
  }

  Future<ServerResponse> deleteTransaction(String id) async {
    final res = await http.delete(rootUrl + '/transactions/$id');
    return ServerResponse.fromJson(json.decode(res.body));
  }

  Future<ServerResponse> addTransaction(String text, double amount) async {
    String jsonBody =
        jsonEncode(<String, dynamic>{'text': text, 'amount': amount});

    final res = await http.post(
      rootUrl + '/transactions',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8'
      },
      body: jsonBody,
    );
    return ServerResponse.fromJson(json.decode(res.body));
  }

  List<double> getAmountsList() {
    return transactionList
        .map((Transaction transaction) => transaction.amount)
        .toList();
  }
}
