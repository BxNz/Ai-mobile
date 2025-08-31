import 'dart:convert';
import 'dart:io';
import 'package:ai_mobile/api/apiPart.dart';
import 'package:http/http.dart' as http;

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

class CategoryApi {
  static Future<List<dynamic>?> getCategory() async {
    try {
      // Bypass SSL certificate verification for development
      HttpOverrides.global = MyHttpOverrides();

      final header = {"content-type": "application/json"};
      final url = Uri.parse(ApiPath.getCategoryAll);
      final response = await http.get(url, headers: header);
      print("Category Response: ${response.statusCode} - ${response.body}");
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data;
      } else {
        print("Category failed: ${response.body}");
        return null;
      }
    } catch (e) {
      print("Category error: $e");
      return null;
    }
  }
}
