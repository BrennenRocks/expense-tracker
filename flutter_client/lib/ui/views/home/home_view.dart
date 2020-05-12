import 'package:flutter/material.dart';
import 'package:flutter_client/core/models/transaction.dart';
import 'package:flutter_client/ui/views/home/home_viewmodel.dart';
import 'package:flutter_client/ui/views/home/widgets/balance/balance.dart';
import 'package:flutter_client/ui/views/home/widgets/transaction_list/transaction_list.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
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
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Balance(),
                    ),
                    Flexible(
                      child: TransactionList(),
                    ),
                    RaisedButton(
                      child: Text('Add Transaction'),
                      onPressed: () => model.navigateToAddTransaction(),
                    ),
                  ],
                ),
        ),
      ),
      viewModelBuilder: () => HomeViewModel(),
    );
  }
}
