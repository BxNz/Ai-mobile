import 'package:ai_mobile/api/productApi.dart';
import 'package:ai_mobile/components/messageHelper.dart';
import 'package:flutter/material.dart';

class ProductProvider extends ChangeNotifier {
  bool _loading = false;
  List<dynamic> _product = [];
  bool get loading => _loading;
  List<dynamic> get products => _product;

  Future<void> getProduct() async {
    // ສາມາດຈະສະແດງອອກໄປໃສ່ຫນ້າອື່ນໄດ້
    _loading = true;
    notifyListeners();
    try {
      await Future.delayed(const Duration(seconds: 1));
      final result = await ProductApi.getProduct();
      print("Result: $result");
      if (result != null) {
        _loading = false;
        _product = result;
        MessageHelper.showMessage(true, "ສົ່ງຂໍ້ມູນສຳເລັດ");
        notifyListeners();
      } else {
        _loading = false;
        MessageHelper.showMessage(false, "ສົ່ງຂໍ້ມູນບໍ່ສຳເລັດ");
        notifyListeners();
      }
    } catch (e) {
      _loading = false;
      MessageHelper.showMessage(false, e.toString());
      notifyListeners();
    }
  }
}
