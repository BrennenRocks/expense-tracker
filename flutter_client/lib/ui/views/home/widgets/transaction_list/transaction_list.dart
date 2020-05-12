import 'package:flutter/material.dart';
import 'package:flutter_client/core/models/transaction.dart';
import 'package:flutter_client/ui/views/home/home_viewmodel.dart';
import 'package:stacked/stacked.dart';

class TransactionList extends ViewModelWidget<HomeViewModel> {
  @override
  Widget build(BuildContext context, HomeViewModel model) {
    return Flexible(
      child: ListView(
        children: ListTile.divideTiles(
          context: context,
          tiles: model.data
              .map(
                (Transaction transaction) =>
                    _TransactionTile(transaction: transaction),
              )
              .toList(),
        ).toList(),
      ),
    );
  }
}

class _TransactionTile extends ViewModelWidget<HomeViewModel> {
  final Transaction transaction;

  const _TransactionTile({Key key, this.transaction}) : super(key: key);

  @override
  Widget build(BuildContext context, HomeViewModel model) {
    return Dismissible(
      key: Key(transaction.id),
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            right: BorderSide(
                color: transaction.amount > 0 ? Colors.green : Colors.red,
                width: 5.0),
          ),
        ),
        child: ListTile(
          title: Text(transaction.text),
          trailing: Text(
            '${transaction.amount > 0 ? '+' : '-'} \$${transaction.amount.abs().toStringAsFixed(2)}',
          ),
        ),
      ),
      confirmDismiss: (DismissDirection direction) {
        if (direction == DismissDirection.startToEnd) {
          return model.confirmDeleteTransaction();
        }

        return Future<bool>.value(false);
      },
      onDismissed: (DismissDirection direction) {
        if (direction == DismissDirection.startToEnd) {
          model.deleteTransaction(transaction.id);
        }
      },
      background: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        alignment: Alignment.centerLeft,
        color: Colors.redAccent,
        child: Icon(
          Icons.delete_sweep,
          color: Colors.white,
        ),
      ),
      secondaryBackground: Container(),
    );
  }
}
