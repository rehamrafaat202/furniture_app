import 'package:flutter/cupertino.dart';

class CounterService with ChangeNotifier {
  int count = 0;
  int addCount() {
    notifyListeners();
    return count++;
  }
}
