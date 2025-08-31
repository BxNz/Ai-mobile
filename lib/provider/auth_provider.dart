import 'dart:io';

import 'package:ai_mobile/api/%E2%80%8BauthApi.dart';
import 'package:ai_mobile/components/messageHelper.dart';
import 'package:ai_mobile/router/router.dart';
import 'package:flutter/material.dart';
import 'package:nav_service/nav_service.dart';

class AuthProvider extends ChangeNotifier {
  bool _loading = false;
  dynamic _user;
  // ຕົວປ່ຽນທີ່ເອີ້ນອອກໄປໃສ່ຫນ້າອື່ນໄດ້
  bool get loading => _loading;
  dynamic get user => _user;

  Future<void> login({
    required String phoneNumber,
    required String password,
  }) async {
    _loading = true;
    notifyListeners();
    try {
      final result = await AuthApi.Login(
        phoneNumber: phoneNumber,
        password: password,
      );
      if (result == true) {
        _loading = false;
        MessageHelper.showMessage(true, "ເຂົ້າສູ່ລະບົບສຳເລັດ");
        NavService.pushReplacementNamed(RouterPath.bottomBar);
        notifyListeners();
      } else {
        _loading = false;
        MessageHelper.showMessage(false, "ເຂົ້າສູ່ລະບົບບໍ່ສຳເລັດ");
        notifyListeners();
      }
    } catch (e) {
      _loading = false;
      MessageHelper.showMessage(false, e.toString());
      notifyListeners();
    }
  }

  Future<void> Register({
    required String fullname,
    required String email,
    required String phoneNumber,
    required String password,
  }) async {
    _loading = true;
    notifyListeners();
    try {
      final result = await AuthApi.Register(
        fullname: fullname,
        email: email,
        phoneNumber: phoneNumber,
        password: password,
      );
      if (result == true) {
        _loading = false;
        MessageHelper.showMessage(true, "ລົງທະບຽນສຳເລັດ");
        NavService.pushReplacementNamed(RouterPath.bottomBar);
        notifyListeners();
      } else {
        _loading = false;
        MessageHelper.showMessage(false, "ລົງທະບຽນບໍ່ສຳເລັດ");
        notifyListeners();
      }
    } catch (e) {
      _loading = false;
      MessageHelper.showMessage(false, e.toString());
      notifyListeners();
    }
  }

  Future<void> Forgot({
    required String phoneNumber,
    required String password,
    required String confirmPassword,
  }) async {
    _loading = true;
    notifyListeners();
    try {
      final result = await AuthApi.Forgot(
        phoneNumber: phoneNumber,
        password: password,
        confirmPassword: confirmPassword,
      );
      if (result == true) {
        _loading = false;
        MessageHelper.showMessage(true, "ປ່ຽນລະຫັດຜ່ານສຳເລັດ");
        notifyListeners();
      } else {
        _loading = false;
        MessageHelper.showMessage(false, "ປ່ຽນລະຫັດຜ່ານບໍ່ສຳເລັດ");
        notifyListeners();
      }
    } catch (e) {
      _loading = false;
      MessageHelper.showMessage(false, e.toString());
      notifyListeners();
    }
  }

  Future<void> RefreshToken() async {
    _loading = true;
    notifyListeners();
    try {
      final result = await AuthApi.RefreshToken();
      if (result == true) {
        _loading = false;
        notifyListeners();
      }
    } catch (e) {
      _loading = false;
      notifyListeners();
    }
  }

  Future<void> ChangePassword({
    required String newpassword,
    required String oldpassword,
  }) async {
    _loading = true;
    notifyListeners();
    try {
      final result = await AuthApi.ChangePassword(
        newpassword: newpassword,
        oldpassword: oldpassword,
      );
      if (result == true) {
        _loading = false;
        notifyListeners();
      }
    } catch (e) {
      _loading = false;
      notifyListeners();
    }
  }

  Future<void> UpdateProfile({
    required String fullname,
    required String email,
    required File file,
  }) async {
    _loading = true;
    notifyListeners();
    try {
      final result = await AuthApi.UpdateProfile(
        fullname: fullname,
        email: email,
        file: file,
      );
      if (result == true) {
        _loading = false;
        notifyListeners();
      }
    } catch (e) {
      _loading = false;
      notifyListeners();
    }
  }
}
