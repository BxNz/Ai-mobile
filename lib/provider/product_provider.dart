import 'package:ai_mobile/api/productApi.dart';
import 'package:ai_mobile/components/messageHelper.dart';
import 'package:flutter/material.dart';

class ProductProvider extends ChangeNotifier {
  bool _loading = false;
  List<dynamic> _product = [];
  bool get loading => _loading;
  List<dynamic> get products => _product;

  Future<List<dynamic>?> getProduct() async {
    // ສາມາດຈະສະແດງອອກໄປໃສ່ຫນ້າອື່ນໄດ້
    _loading = true;
    notifyListeners();
    try {
      await Future.delayed(const Duration(seconds: 1));
      final result = await ProductApi.getProduct();
      if (result != null) {
        _product = result;
        _loading = false;
        notifyListeners();
      } else {
        // Use mock data when API fails
        _product = [
          {
            "image":
                "https://img.lazcdn.com/g/p/a43455ed5ba53d4a689b66fbb8bb1a0c.jpg_200x200q80.avif",
            "name":
                "ProMan-เสื้อโปโลสีตัดกัน แขนสั้นคอปกสไตล์เดียวกันสำหรับผู้ชายและผู้หญิง",
            "amount": "In Stock",
            "price": "120",
          },
          {
            "image":
                "https://img.lazcdn.com/g/p/801bcad4a66eeab519a511d74d75bfe0.jpg_200x200q80.avif",
            "name":
                "พร้อมส่ง🔥เสื้อยืดโปโล Polo shirt คอปก ทรงหลวม ผู้ชาย ใส่สบาย",
            "amount": "In Stock",
            "price": "110",
          },
          {
            "image":
                "https://img.lazcdn.com/g/p/0d40e119dd1a61977b33939ac404cc6b.png_200x200q80.png_.webp",
            "name":
                "Muse Harbor เสื้อโปโลแขนสั้นผู้ชาย สีดำสไตล์คลาสสิกสำหรับฤดูร้อน",
            "amount": "In Stock",
            "price": "100",
          },
          {
            "image":
                "https://img.lazcdn.com/g/p/6a4de6ccc3468ee407f2ac1eefbdc38a.png_200x200q80.avif",
            "name":
                "(ไซส์ S-4XL) เสื้อเชิ้ตแขนสั้น ผู้ชาย เสื้อเชิ้ตชาย โอเวอร์ไซส์ เสื้อฮาวาย",
            "amount": "In Stock",
            "price": "130",
          },
        ];
        _loading = false;
        notifyListeners();
      }
    } catch (e) {
      // Use mock data when API fails
      _product = [
        {
          "image":
              "https://img.lazcdn.com/g/p/a43455ed5ba53d4a689b66fbb8bb1a0c.jpg_200x200q80.avif",
          "name":
              "ProMan-เสื้อโปโลสีตัดกัน แขนสั้นคอปกสไตล์เดียวกันสำหรับผู้ชายและผู้หญิง",
          "amount": "In Stock",
          "price": "120",
        },
        {
          "image":
              "https://img.lazcdn.com/g/p/801bcad4a66eeab519a511d74d75bfe0.jpg_200x200q80.avif",
          "name":
              "พร้อมส่ง🔥เสื้อยืดโปโล Polo shirt คอปก ทรงหลวม ผู้ชาย ใส่สบาย",
          "amount": "In Stock",
          "price": "110",
        },
        {
          "image":
              "https://img.lazcdn.com/g/p/0d40e119dd1a61977b33939ac404cc6b.png_200x200q80.png_.webp",
          "name":
              "Muse Harbor เสื้อโปโลแขนสั้นผู้ชาย สีดำสไตล์คลาสสิกสำหรับฤดูร้อน",
          "amount": "In Stock",
          "price": "100",
        },
        {
          "image":
              "https://img.lazcdn.com/g/p/6a4de6ccc3468ee407f2ac1eefbdc38a.png_200x200q80.avif",
          "name":
              "(ไซส์ S-4XL) เสื้อเชิ้ตแขนสั้น ผู้ชาย เสื้อเชิ้ตชาย โอเวอร์ไซส์ เสื้อฮาวาย",
          "amount": "In Stock",
          "price": "130",
        },
      ];
      _loading = false;
      notifyListeners();
    }
  }
}
