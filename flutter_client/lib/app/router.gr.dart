// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_client/ui/views/home/home_view.dart';
import 'package:flutter_client/ui/views/add_transaction/add_transaction_view.dart';

abstract class Routes {
  static const homeViewRoute = '/';
  static const addTransactionViewRoute = '/add-transaction-view-route';
  static const all = {
    homeViewRoute,
    addTransactionViewRoute,
  };
}

class Router extends RouterBase {
  @override
  Set<String> get allRoutes => Routes.all;

  @Deprecated('call ExtendedNavigator.ofRouter<Router>() directly')
  static ExtendedNavigatorState get navigator =>
      ExtendedNavigator.ofRouter<Router>();

  @override
  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homeViewRoute:
        return MaterialPageRoute<dynamic>(
          builder: (context) => HomeView(),
          settings: settings,
        );
      case Routes.addTransactionViewRoute:
        return MaterialPageRoute<dynamic>(
          builder: (context) =>
              AddTransactionView(transaction: settings.arguments),
          settings: settings,
        );
      default:
        return unknownRoutePage(settings.name);
    }
  }
}
