import 'package:flutter/material.dart';
import 'package:flutter_client/ui/views/home/home_viewmodel.dart';
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
          child: RaisedButton(
            child: Text('Add Transaction'),
            onPressed: () => model.navigateToAddTransaction(),
          ),
        ),
      ),
      viewModelBuilder: () => HomeViewModel(),
    );
  }
}
