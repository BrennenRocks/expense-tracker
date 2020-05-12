import 'package:flutter/material.dart';
import 'package:flutter_client/ui/views/add_transaction/add_transaction_viewmodel.dart';
import 'package:stacked/stacked.dart';

class AddTransactionView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AddTransactionViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text('Add Transaction'),
        ),
        body: Center(
          child: Text('Add a transaction'),
        ),
      ),
      viewModelBuilder: () => AddTransactionViewModel(),
    );
  }
}
