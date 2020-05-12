import 'package:auto_route/auto_route_annotations.dart';
import 'package:flutter_client/ui/views/add_transaction/add_transaction_view.dart';
import 'package:flutter_client/ui/views/home/home_view.dart';

@MaterialAutoRouter()
class $Router {
  @initial
  HomeView homeViewRoute;
  AddTransactionView addTransactionViewRoute;
}
