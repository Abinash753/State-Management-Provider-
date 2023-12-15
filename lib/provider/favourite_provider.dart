import 'package:flutter/material.dart';

class FavouriteProvider with ChangeNotifier {
  List<int> _selectedItems = [];
  List<int> get seletedItems => _selectedItems;
  void addItem(int value) {
    seletedItems.add(value);
    notifyListeners();
  }

  //for removing the selected item
  void removeItem(int value) {
    seletedItems.remove(value);
    notifyListeners();
  }
}
