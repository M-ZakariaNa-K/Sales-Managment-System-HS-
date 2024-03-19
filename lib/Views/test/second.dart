import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sales_management_system/Views/admins/admins.dart';
import 'package:sales_management_system/Views/home/home.dart';
import 'package:sales_management_system/Views/reports/report.dart';
import 'package:sales_management_system/Views/test/first_test.dart';

class StockAppRouteDelegate extends RouterDelegate<RouteSettings>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<RouteSettings> {
  StockAppRouteDelegate(this.state);

  final StockAppState state;

  @override
  GlobalKey<NavigatorState> get navigatorKey => GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: [
        MaterialPage(
          key: ValueKey('home'),
          child: HomePage(),
        ),
        // if (state.searchQuery != null)
          MaterialPage(
            key: ValueKey('search'),
            child: AdminsPage(),
          ),
        // if (state.stockSymbol != null)
          MaterialPage(
            key: ValueKey('details'),
            child: ReportsPage(),
          ),
      ],
      onPopPage: (route, result) {
        if (!route.didPop(result)) {
          return false;
        }

      if (route.settings.name == 'search') {
          state.searchQuery = "";
        }
        if (route.settings.name == 'details') {
          state.stockSymbol = "";
        }
        return true;
      },
    );
  }

  @override
  Future<void> setNewRoutePath(RouteSettings configuration) async {
    // This method is not necessary for this delegate
    // as we are not supporting deep linking.
  }

  @override
  Future<bool> popRoute() {
    // This method is not necessary for this delegate
    // as we are using onPopPage to handle navigation.
    return SynchronousFuture<bool>(false);
  }
}
