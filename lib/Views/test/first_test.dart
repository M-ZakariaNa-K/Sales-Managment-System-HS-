import 'package:flutter/material.dart';

class StockAppState extends ChangeNotifier {
  // If non-null: show the search page with this initial query.
  // String get searchQuery;
  String? _searchQuery;
set searchQuery(String value) {
    if (value == _searchQuery) {
      return;
    }
    _searchQuery = value;
    notifyListeners();
  }

  // If non-null: Show the details page for this symbol.
  // String get stockSymbol;
  String? _stockSymbol;
  set stockSymbol(String value) {
    if (value == _stockSymbol) {
      return;
    }
    _stockSymbol = value;
    notifyListeners();
  }

  // Show these symbols on the home screen.
  final List<String> favoriteStockSymbols=[]; // Loaded from e.g. a database.
}
