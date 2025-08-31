import 'package:ai_mobile/provider/banner_provider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BannerWidget extends StatefulWidget {
  const BannerWidget({super.key});

  @override
  State<BannerWidget> createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {
  // List<String> data = [
  //   "https://img.lazcdn.com/us/domino/cd0c7535-1068-43a9-a10a-ac8b910c1bf0_TH-1976-688.jpg_2200x2200q80.jpg_.avif",
  //   "https://img.lazcdn.com/us/domino/2669e9fe-0435-4b2e-8baf-cf94189401a1_TH-1976-688.jpg_2200x2200q80.jpg_.avif",
  //   "https://img.lazcdn.com/us/domino/5e194b93-9c6a-4ec0-b1bd-1dbdbf6c8cba_TH-1976-688.jpg_2200x2200q80.jpg_.avif",
  // ];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Consumer<BannerProvider>(
      builder: (context, banner, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CarouselSlider.builder(
              itemCount: banner.banners.length,
              itemBuilder: (context, index, i) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      banner.banners[index]['image'],
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),
                );
              },
              options: CarouselOptions(
                autoPlay: true,
                viewportFraction: 1,
                enlargeCenterPage: true,
                height: 150,
                onPageChanged:
                    (index, reason) => setState(() {
                      currentIndex = index;
                    }),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:
                  banner.banners.map((e) {
                    final _index = banner.banners.indexOf(e);
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 2),
                      child: Container(
                        height: currentIndex == _index ? 6 : 5,
                        width: currentIndex == _index ? 10 : 5,
                        padding: EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          color:
                              currentIndex == _index
                                  ? Colors.green
                                  : Colors.grey,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    );
                  }).toList(),
            ),
          ],
        );
      },
    );
  }
}
