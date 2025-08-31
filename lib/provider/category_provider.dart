import 'package:ai_mobile/api/categoryApi.dart';
import 'package:ai_mobile/components/messageHelper.dart';
import 'package:flutter/material.dart';

class CategoryProvider extends ChangeNotifier {
  bool _loading = false;
  List<dynamic> _category = [];
  bool get loading => _loading;
  List<dynamic> get category => _category;

  Future<List<dynamic>?> getCategory() async {
    // ສາມາດຈະສະແດງອອກໄປໃສ່ຫນ້າອື່ນໄດ້
    _loading = true;
    notifyListeners();
    try {
      await Future.delayed(const Duration(seconds: 1));
      final result = await CategoryApi.getCategory();
      if (result != null) {
        _category = result;
        _loading = false;
        notifyListeners();
      } else {
        // Use mock data when API fails
        _category = [
          {"title": "Nike"},
          {"title": "Adidas"},
          {"title": "Puma"},
          {"title": "Zara"},
          {"title": "The North Face"},
        ];
        _loading = false;
        notifyListeners();
      }
    } catch (e) {
      // Use mock data when API fails
      _category = [
        {"title": "Nike"},
        {"title": "Adidas"},
        {"title": "Puma"},
        {"title": "Zara"},
        {"title": "The North Face"},
      ];
      _loading = false;
      notifyListeners();
    }
  }
}
