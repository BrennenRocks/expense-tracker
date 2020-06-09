import 'package:flutter/material.dart';
import 'package:flutter_client/app/locator.dart';
import 'package:flutter_client/app/router.gr.dart';
import 'package:flutter_client/core/models/transaction.dart';
import 'package:flutter_client/core/server_response.dart';
import 'package:flutter_client/core/services/transaction_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final DialogService _dialogService = locator<DialogService>();
  final SnackbarService _snackbarService = locator<SnackbarService>();
  final TransactionService _transactionService = locator<TransactionService>();

  String _title = 'Expense Tracker';
  String get title => _title;

  List<Transaction> get transactionList => _transactionService.transactionList;

  void getAllTransactions() async {
    setBusy(true);

    ServerResponse res = await _transactionService.getAllTransactions();
    if (!res.success) {
      _snackbarService.showCustomSnackBar(
        backgroundColor: Colors.red,
        title: 'Error',
        message: res.error['message'],
        duration: Duration(seconds: 3),
      );

      setBusy(false);
      return;
    }

    _snackbarService.showCustomSnackBar(
      backgroundColor: Colors.green,
      title: 'Success',
      message: 'GET Transactions',
      duration: Duration(seconds: 3),
    );

    _transactionService.transactionList = res.data
        .map((transaction) => Transaction.fromJson(transaction))
        .toList();

    setBusy(false);
  }

  void deleteTransaction(String id) async {
    ServerResponse res = await _transactionService.deleteTransaction(id);
    if (!res.success) {
      _snackbarService.showCustomSnackBar(
        backgroundColor: Colors.red,
        title: 'Error',
        message: res.error['message'],
        duration: Duration(seconds: 3),
      );

      return;
    }

    Transaction transaction = Transaction.fromJson(res.data[0]);

    _snackbarService.showCustomSnackBar(
      backgroundColor: Colors.green,
      title: 'Success',
      message: '${transaction.text} successfully deleted',
      duration: Duration(seconds: 3),
    );

    _transactionService.transactionList.remove(transaction);
    notifyListeners();
  }

  Future<bool> confirmDeleteTransaction() async {
    DialogResponse res = await _dialogService.showConfirmationDialog(
      title: 'Delete',
      description: 'Are you sure you want to delete this transaction?',
      confirmText: 'Delete',
      cancelText: 'Cancel',
    );

    return res.confirmed;
  }

  double getAmount() {
    return _transactionService
        .getAmountsList()
        .fold(0.00, (acc, item) => (acc += item));
  }

  double getIncome() {
    return _transactionService
        .getAmountsList()
        .where((double amount) => amount > 0)
        .fold(0.00, (acc, item) => (acc += item));
  }

  double getExpense() {
    return _transactionService
        .getAmountsList()
        .where((double amount) => amount < 0)
        .fold(0.00, (acc, item) => (acc += item))
        .abs();
  }

  void navigateToAddTransaction(Transaction transaction) async {
    var res = await _navigationService.navigateTo(
        Routes.addTransactionViewRoute,
        arguments: AddTransactionViewArguments(transaction: transaction));

    if (res == null) {
      return;
    }

    Transaction newTransaction = res['transaction'][0];

    _snackbarService.showCustomSnackBar(
      backgroundColor: Colors.green,
      title: 'Success',
      message:
          '${newTransaction.text} successfully ${transaction == null ? 'added' : 'updated'}',
      duration: Duration(seconds: 3),
    );

    if (transaction == null) {
      _transactionService.transactionList.add(newTransaction);
    } else {
      int index = _transactionService.transactionList.indexOf(newTransaction);
      _transactionService.transactionList[index] = newTransaction;
    }
    notifyListeners();
  }
}
