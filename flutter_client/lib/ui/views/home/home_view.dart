import 'package:flutter/material.dart';
import 'package:flutter_client/ui/views/home/home_viewmodel.dart';
import 'package:flutter_client/ui/views/home/widgets/add_transaction_button/add_transaction_button.dart';
import 'package:flutter_client/ui/views/home/widgets/balance/balance.dart';
import 'package:flutter_client/ui/views/home/widgets/history_title/history_title.dart';
import 'package:flutter_client/ui/views/home/widgets/income_expense/income_expense.dart';
import 'package:flutter_client/ui/views/home/widgets/transaction_list/transaction_list.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      onModelReady: (model) => model.getAllTransactions(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text(model.title),
        ),
        body: Center(
          child: model.isBusy
              ? Center(child: CircularProgressIndicator())
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Balance(),
                    SizedBox(height: 15.0),
                    IncomeExpense(),
                    SizedBox(height: 15.0),
                    HistoryTitle(),
                    TransactionList(),
                    AddTransactionButton(),
                  ],
                ),
        ),
      ),
      viewModelBuilder: () => HomeViewModel(),
    );
  }
}
