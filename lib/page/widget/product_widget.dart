import 'package:ai_mobile/provider/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductWidget extends StatefulWidget {
  const ProductWidget({super.key});

  @override
  State<ProductWidget> createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  // List<dynamic> productData = [
  //   {
  //     "image":
  //         "https://img.lazcdn.com/g/p/a43455ed5ba53d4a689b66fbb8bb1a0c.jpg_200x200q80.avif",
  //     "title":
  //         "ProMan-เสื้อโปโลสีตัดกัน แขนสั้นคอปกสไตล์เดียวกันสำหรับผู้ชายและผู้หญิง เสื้อ",
  //     "price": "120,000",
  //   },
  //   {
  //     "image":
  //         "https://img.lazcdn.com/g/p/801bcad4a66eeab519a511d74d75bfe0.jpg_200x200q80.avif",
  //     "title": "พร้อมส่ง🔥เสื้อยืดโปโล Polo shirt คอปก ทรงหลวม ผู้ชาย ใส่สบาย",
  //     "price": "110,000",
  //   },
  //   {
  //     "image":
  //         "https://img.lazcdn.com/g/p/0d40e119dd1a61977b33939ac404cc6b.png_200x200q80.png_.webp",
  //     "title":
  //         "Muse Harbor เสื้อโปโลแขนสั้นผู้ชาย สีดำสไตล์คลาสสิกสำหรับฤดูร้อน",
  //     "price": "100,000",
  //   },
  //   {
  //     "image":
  //         "https://img.lazcdn.com/g/p/6a4de6ccc3468ee407f2ac1eefbdc38a.png_200x200q80.avif",
  //     "title":
  //         "(ไซส์ S-4XL) เสื้อเชิ้ตแขนสั้น ผู้ชาย เสื้อเชิ้ตชาย โอเวอร์ไซส์ เสื้อฮาวาย OVERSIZE เสื้อเชิ้ต เสื้อผ้าผู้ชาย",
  //     "price": "130,000",
  //   },
  // ];
  int favorite = 0;
  onFavorite(index) {
    setState(() {
      favorite = index;
    });
  }

  List<dynamic> favoriteList = [];
  @override
  Widget build(BuildContext context) {
    return Consumer<ProductProvider>(
      builder: (context, product, child) {
        return GridView.builder(
          shrinkWrap: true,
          primary: false,
          itemCount: product.products.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.7,
          ),
          itemBuilder: (context, index) {
            return Card(
              elevation: 2,
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Image.network(product.products[index]['image']),
                      Positioned(
                        top: 0,
                        right: 2,
                        child: IconButton(
                          onPressed: () {
                            onFavorite(index);
                            if (favoriteList.contains(index)) {
                              favoriteList.remove(index);
                            } else {
                              favoriteList.add(index);
                            }
                          },
                          icon: Icon(
                            favoriteList.contains(index)
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color:
                                favoriteList.contains(index)
                                    ? Colors.red
                                    : Colors.black,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 5,
                        left: 5,
                        child: Container(
                          height: 25,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                              ),
                              child: Text(
                                "Nike",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Text(
                      product.products[index]['name'],
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Text(
                      product.products[index]['amount'],
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Text(
                      "₭${product.products[index]['price']}",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
