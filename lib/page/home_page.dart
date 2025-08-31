import 'package:ai_mobile/page/widget/appbar_widget_der.dart';
import 'package:ai_mobile/page/widget/banner_widget.dart';
import 'package:ai_mobile/page/widget/category_widget.dart';
import 'package:ai_mobile/page/widget/page_controller_widget.dart';
import 'package:ai_mobile/page/widget/product_widget.dart';
import 'package:ai_mobile/provider/banner_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarWidgetDer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              BannerWidget(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Office Barnd',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(onPressed: () {}, child: Text("View All")),
                  ],
                ),
              ),

              CategoryWidget(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Best Seller',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(onPressed: () {}, child: Text("View All")),
                  ],
                ),
              ),
              ProductWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
