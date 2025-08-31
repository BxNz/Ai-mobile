import 'package:ai_mobile/api/bannerApi.dart';
import 'package:ai_mobile/components/messageHelper.dart';
import 'package:flutter/material.dart';

class BannerProvider extends ChangeNotifier {
  bool _loading = false;
  List<dynamic> _banner = [];
  bool get loading => _loading;
  List<dynamic> get banners => _banner;

  Future<List<dynamic>?> getBanner() async {
    // ສາມາດຈະສະແດງອອກໄປໃສ່ຫນ້າອື່ນໄດ້
    _loading = true;
    notifyListeners();
    try {
      await Future.delayed(const Duration(seconds: 1));
      final result = await BannerApi.getBanner();
      if (result != null) {
        _banner = result;
        _loading = false;
        notifyListeners();
      } else {
        // Use mock data when API fails
        _banner = [
          {
            "image":
                "https://img.lazcdn.com/us/domino/cd0c7535-1068-43a9-a10a-ac8b910c1bf0_TH-1976-688.jpg_2200x2200q80.jpg_.avif",
          },
          {
            "image":
                "https://img.lazcdn.com/us/domino/2669e9fe-0435-4b2e-8baf-cf94189401a1_TH-1976-688.jpg_2200x2200q80.jpg_.avif",
          },
          {
            "image":
                "https://img.lazcdn.com/us/domino/5e194b93-9c6a-4ec0-b1bd-1dbdbf6c8cba_TH-1976-688.jpg_2200x2200q80.jpg_.avif",
          },
        ];
        _loading = false;
        notifyListeners();
      }
    } catch (e) {
      // Use mock data when API fails
      _banner = [
        {
          "image":
              "https://img.lazcdn.com/us/domino/cd0c7535-1068-43a9-a10a-ac8b910c1bf0_TH-1976-688.jpg_2200x2200q80.jpg_.avif",
        },
        {
          "image":
              "https://img.lazcdn.com/us/domino/2669e9fe-0435-4b2e-8baf-cf94189401a1_TH-1976-688.jpg_2200x2200q80.jpg_.avif",
        },
        {
          "image":
              "https://img.lazcdn.com/us/domino/5e194b93-9c6a-4ec0-b1bd-1dbdbf6c8cba_TH-1976-688.jpg_2200x2200q80.jpg_.avif",
        },
      ];
      _loading = false;
      notifyListeners();
    }
  }
}
