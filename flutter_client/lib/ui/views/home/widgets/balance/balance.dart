import 'package:flutter/material.dart';
import 'package:flutter_client/ui/views/home/home_viewmodel.dart';
import 'package:stacked/stacked.dart';

class Balance extends ViewModelWidget<HomeViewModel> {
  @override
  Widget build(BuildContext context, HomeViewModel model) {
    double amount = model.getAmount();

    return Container(
      child: RichText(
        text: TextSpan(
          text: 'YOUR BALANCE',
          children: <TextSpan>[
            TextSpan(text: '\n'),
            TextSpan(
              text:
                  '${amount > 0 ? '' : '-'} \$${amount.abs().toStringAsFixed(2)}',
              style: TextStyle(fontSize: 40),
            ),
          ],
        ),
      ),
    );
  }
}
