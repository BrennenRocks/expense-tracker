import 'package:flutter/material.dart';
import 'package:flutter_client/ui/views/home/home_viewmodel.dart';
import 'package:stacked/stacked.dart';

class IncomeExpense extends ViewModelWidget<HomeViewModel> {
  @override
  Widget build(BuildContext context, HomeViewModel model) {
    return Center(
      child: Container(
        height: 100.0,
        width: MediaQuery.of(context).size.width / 1.5,
        child: Card(
          elevation: 10,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RichText(
                text: TextSpan(
                  text: 'INCOME',
                  children: <TextSpan>[
                    TextSpan(text: '\n'),
                    TextSpan(
                      text: '\$${model.getIncome().toStringAsFixed(2)}',
                      style: TextStyle(color: Colors.green),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 35.0),
              VerticalDivider(
                indent: 20,
                endIndent: 20,
                width: 2.0,
                thickness: 2.0,
              ),
              SizedBox(width: 35.0),
              RichText(
                text: TextSpan(
                  text: 'EXPENSE',
                  children: <TextSpan>[
                    TextSpan(text: '\n'),
                    TextSpan(
                      text: '\$${model.getExpense().toStringAsFixed(2)}',
                      style: TextStyle(color: Colors.red),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
