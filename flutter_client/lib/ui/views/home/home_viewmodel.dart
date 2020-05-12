import 'package:flutter_client/app/locator.dart';
import 'package:flutter_client/app/router.gr.dart';
import 'package:flutter_client/core/models/transaction.dart';
import 'package:flutter_client/core/server_response.dart';
import 'package:flutter_client/core/services/transaction_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final TransactionService _transactionService = locator<TransactionService>();

  String _title = 'Expense Tracker';
  String get title => _title;

  List<Transaction> _transactionList;
  List<Transaction> get transactionList => _transactionList;

  void navigateToAddTransaction() async {
    await _navigationService.navigateTo(Routes.addTransactionViewRoute);
  }

  void getAllTransactions() async {
    ServerResponse res = await _transactionService.getAllTransactions();
    _transactionList = res.data
        .map((transaction) => Transaction.fromJson(transaction))
        .toList();
  }
}
