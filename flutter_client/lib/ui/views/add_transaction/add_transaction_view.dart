import 'package:flutter/material.dart';
import 'package:flutter_client/core/models/transaction.dart';
import 'package:flutter_client/ui/views/add_transaction/add_transaction_viewmodel.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

class AddTransactionView extends StatelessWidget {
  final Transaction transaction;

  const AddTransactionView({Key key, this.transaction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AddTransactionViewModel>.nonReactive(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text('Add Transaction'),
          actions: <Widget>[
            FlatButton(
              child: Text('save'),
              onPressed: () {
                transaction == null
                    ? model.addTransaction()
                    : model.updateTransaction(transaction.id);
              },
            ),
          ],
        ),
        body: _TextFields(transaction.text, transaction.amount),
      ),
      viewModelBuilder: () => AddTransactionViewModel(),
    );
  }
}

class _TextFields extends HookViewModelWidget<AddTransactionViewModel> {
  final String transactionText;
  final double transactionAmount;

  _TextFields(this.transactionText, this.transactionAmount);

  @override
  Widget buildViewModelWidget(
      BuildContext context, AddTransactionViewModel model) {
    var text = useTextEditingController(text: transactionText);
    var amount = useTextEditingController(text: transactionAmount.toString());

    model.text = text.text;
    model.amount = amount.text;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        TextField(
          controller: text,
          onChanged: model.updateText,
          decoration: const InputDecoration(
              prefixIcon: Icon(Icons.short_text), labelText: 'Text'),
        ),
        TextField(
          controller: amount,
          onChanged: model.updateAmount,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
              prefixIcon: Icon(Icons.attach_money), labelText: 'Amount'),
        ),
      ],
    );
  }
}
