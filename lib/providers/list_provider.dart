import 'package:flutter/material.dart';

class ListProvider extends ChangeNotifier {
  List<int> numbers = [1, 2, 3, 4];

  void addNum() {
    if (numbers.isNotEmpty) {
      int last = numbers.last;
      numbers.add(last + 1);
    } else {
      numbers.add(1);
    }

    notifyListeners();
  }

  void removeNum(index) {
    numbers.removeAt(index);
    notifyListeners();
  }
}
