import 'package:flutter_client/app/locator.dart';
import 'package:flutter_client/app/router.gr.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();

  String _title = 'Expense Tracker';
  String get title => _title;

  void navigateToAddTransaction() async {
    await _navigationService.navigateTo(Routes.addTransactionViewRoute);
  }
}
