import 'package:ai_mobile/page/home_page.dart';
import 'package:ai_mobile/provider/auth_provider.dart';
import 'package:ai_mobile/components/messageHelper.dart';
import 'package:ai_mobile/provider/banner_provider.dart';
import 'package:ai_mobile/provider/category_provider.dart';
import 'package:ai_mobile/provider/product_provider.dart';
import 'package:ai_mobile/router/router.dart';
import 'package:flutter/material.dart';
import 'package:nav_service/nav_service.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthProvider()),
        ChangeNotifierProvider(
          create: (context) => BannerProvider()..getBanner(),
        ),
        ChangeNotifierProvider(
          create: (context) => CategoryProvider()..getCategory(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProductProvider()..getProduct(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AuthProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
        navigatorKey: NavService.navigatorKey,
        scaffoldMessengerKey: MessageHelper.scaffoldMessagerKey,
        initialRoute: RouterPath.home,
        onGenerateRoute: RouterPath.generateRoute,
      ),
    );
  }
}
