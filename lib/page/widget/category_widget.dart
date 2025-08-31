import 'package:ai_mobile/provider/category_provider.dart';
import 'package:ai_mobile/provider/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryWidget extends StatefulWidget {
  const CategoryWidget({super.key});

  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  int currentIndex = 0;
  onTap(index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CategoryProvider>(
      builder: (context, category, child) {
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:
                category.category.map((data) {
                  final index = category.category.indexOf(data);
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Consumer<ProductProvider>(
                          builder: (context, product, child) {
                            return GestureDetector(
                              onTap: () {
                                onTap(index);
                                product.getProduct();
                              },
                              child: Container(
                                width: 80,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color:
                                      currentIndex == index
                                          ? Colors.green.shade100
                                          : Colors.white,
                                ),
                                child: Center(
                                  child: Text(
                                    data['title'],
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight:
                                          currentIndex == index
                                              ? FontWeight.bold
                                              : FontWeight.normal,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  );
                }).toList(),
          ),
        );
      },
    );
  }
}
