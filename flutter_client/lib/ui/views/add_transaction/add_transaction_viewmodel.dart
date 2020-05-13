import 'package:flutter/material.dart';
import 'package:flutter_client/app/locator.dart';
import 'package:flutter_client/core/models/transaction.dart';
import 'package:flutter_client/core/server_response.dart';
import 'package:flutter_client/core/services/transaction_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class AddTransactionViewModel extends BaseViewModel {
  final TransactionService _transactionService = locator<TransactionService>();
  final SnackbarService _snackbarService = locator<SnackbarService>();
  final NavigationService _navigationService = locator<NavigationService>();

  String _text;
  double _amount;

  void updateText(String text) {
    _text = text;
    notifyListeners();
  }

  void updateAmount(String amount) {
    _amount = double.parse(amount);
    notifyListeners();
  }

  void addTransaction() async {
    final ServerResponse res =
        await _transactionService.addTransaction(_text, _amount);

    if (!res.success) {
      _snackbarService.showCustomSnackBar(
        backgroundColor: Colors.red,
        title: 'Error',
        message: res.error['message'],
        duration: Duration(seconds: 3),
      );

      return;
    }

    List<Transaction> transactionList = res.data
        .map((transaction) => Transaction.fromJson(transaction))
        .toList();

    _navigationService.back(result: {'transaction': transactionList});
  }
}
