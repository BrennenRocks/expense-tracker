import 'package:flutter/material.dart';
import 'package:flutter_client/app/locator.dart';
import 'package:flutter_client/app/router.gr.dart';
import 'package:flutter_client/core/models/transaction.dart';
import 'package:flutter_client/core/server_response.dart';
import 'package:flutter_client/core/services/transaction_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends FutureViewModel<List<Transaction>> {
  final NavigationService _navigationService = locator<NavigationService>();
  final DialogService _dialogService = locator<DialogService>();
  final SnackbarService _snackbarService = locator<SnackbarService>();
  final TransactionService _transactionService = locator<TransactionService>();

  String _title = 'Expense Tracker';
  String get title => _title;

  @override
  Future<List<Transaction>> futureToRun() => getAllTransactions();

  @override
  void onError(error) {
    _snackbarService.showCustomSnackBar(
      backgroundColor: Colors.red,
      title: 'Error',
      message: error,
      duration: Duration(seconds: 3),
    );
  }

  Future<List<Transaction>> getAllTransactions() async {
    ServerResponse res = await _transactionService.getAllTransactions();
    if (!res.success) {
      _snackbarService.showCustomSnackBar(
        backgroundColor: Colors.red,
        title: 'Error',
        message: res.error['message'],
        duration: Duration(seconds: 3),
      );

      return [];
    }

    _snackbarService.showCustomSnackBar(
      backgroundColor: Colors.green,
      title: 'Success',
      message: 'GET Transactions',
      duration: Duration(seconds: 3),
    );

    return res.data
        .map((transaction) => Transaction.fromJson(transaction))
        .toList();
  }

  Future<bool> confirmDeleteTransaction() async {
    DialogResponse res = await _dialogService.showConfirmationDialog(
      title: 'Delete',
      description: 'Are you sure you want to delete this transaction?',
      confirmationTitle: 'Delete',
      cancelTitle: 'Cancel',
    );

    return res.confirmed;
  }

  Future<List<Transaction>> deleteTransaction(String id) async {
    ServerResponse res = await _transactionService.deleteTransaction(id);
    if (!res.success) {
      _snackbarService.showCustomSnackBar(
        backgroundColor: Colors.red,
        title: 'Error',
        message: res.error['message'],
        duration: Duration(seconds: 3),
      );

      return [];
    }

    _snackbarService.showCustomSnackBar(
      backgroundColor: Colors.green,
      title: 'Success',
      message: Transaction.fromJson(res.data[0]).text,
      duration: Duration(seconds: 3),
    );

    return res.data
        .map((transaction) => Transaction.fromJson(transaction))
        .toList();
  }

  List<double> _getAmountsList() {
    return data.map((Transaction transaction) => transaction.amount).toList();
  }

  double getAmount() {
    return _getAmountsList().reduce((acc, item) => (acc += item));
  }

  double getIncome() {
    return _getAmountsList()
        .where((double amount) => amount > 0)
        .reduce((acc, item) => (acc += item));
  }

  double getExpense() {
    return _getAmountsList()
        .where((double amount) => amount < 0)
        .reduce((acc, item) => (acc += item))
        .abs();
  }

  void navigateToAddTransaction() async {
    await _navigationService.navigateTo(Routes.addTransactionViewRoute);
  }
}
