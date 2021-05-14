import 'package:flutter/foundation.dart';
import 'package:my_shop/Config/config.dart';

import '../Config/config.dart';

class CartItemCounter extends ChangeNotifier {
  int _counter = EcommerceApp.sharedPreferences
          .getStringList(EcommerceApp.userCartList)
          .length -
      1;
  int get count => _counter;

  Future<void> displayResult() async {
    int _counter = EcommerceApp.sharedPreferences
            .getStringList(EcommerceApp.userCartList)
            .length -
        1;
    await Future.delayed(const Duration(microseconds: 100), () {
        notifyListeners();
    });
  }
}
