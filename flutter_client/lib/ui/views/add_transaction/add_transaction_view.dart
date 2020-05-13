import 'package:flutter/material.dart';
import 'package:flutter_client/ui/views/add_transaction/add_transaction_viewmodel.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

class AddTransactionView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AddTransactionViewModel>.nonReactive(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text('Add Transaction'),
          actions: <Widget>[
            FlatButton(
              child: Text('save'),
              onPressed: model.addTransaction,
            ),
          ],
        ),
        body: _TextFields(),
      ),
      viewModelBuilder: () => AddTransactionViewModel(),
    );
  }
}

class _TextFields extends HookViewModelWidget<AddTransactionViewModel> {
  @override
  Widget buildViewModelWidget(
      BuildContext context, AddTransactionViewModel model) {
    var text = useTextEditingController();
    var amount = useTextEditingController();

    return Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
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
    ]);
  }
}
