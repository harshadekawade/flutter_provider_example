import 'package:flutter/material.dart';

class ListProvider extends ChangeNotifier {
  List<int> numbers = [1, 2, 3, 4];

  void addNum() {
    int last = numbers.last;
    numbers.add(last + 1);
    notifyListeners();
  }
}
