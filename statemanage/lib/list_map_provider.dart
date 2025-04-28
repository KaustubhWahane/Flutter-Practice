import 'package:flutter/material.dart';

class ListMapProvider extends ChangeNotifier {
  List<Map<String, dynamic>> _items = [];

  List<Map<String, dynamic>> get items => _items;

  void addItem(String title) {
    _items.add({'id': DateTime.now().toString(), 'title': title});
    notifyListeners();
  }

  void removeItem(String id) {
    _items.removeWhere((element) => element['id'] == id);
    notifyListeners();
  }

  void updateItem(String id, String newTitle) {
    final index = _items.indexWhere((element) => element['id'] == id);
    if (index != -1) {
      _items[index]['title'] = newTitle;
      notifyListeners();
    }
  }
}
