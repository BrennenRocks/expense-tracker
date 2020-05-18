import 'package:flutter/material.dart';
import 'package:flutter_client/ui/views/home/home_viewmodel.dart';
import 'package:stacked/stacked.dart';

class AddTransactionButton extends ViewModelWidget<HomeViewModel> {
  @override
  Widget build(BuildContext context, HomeViewModel model) {
    return Flexible(
      child: Center(
        child: ButtonTheme(
          minWidth: MediaQuery.of(context).size.width / 1.5,
          child: RaisedButton(
            child: Text('Add Transaction'),
            onPressed: () => model.navigateToAddTransaction(null),
          ),
        ),
      ),
    );
  }
}
