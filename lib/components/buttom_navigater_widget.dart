import 'package:ai_mobile/page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class ButtomNavigaterWidget extends StatefulWidget {
  const ButtomNavigaterWidget({super.key});

  @override
  State<ButtomNavigaterWidget> createState() => _ButtomNavigaterWidgetState();
}

class _ButtomNavigaterWidgetState extends State<ButtomNavigaterWidget> {
  int currentPage = 0;
  List<Widget> childern = [
    HomePage(),
    HomePage(),
    HomePage(),
    HomePage(),
    HomePage(),
  ];
  onTap(index) {
    setState(() {
      currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: childern[currentPage],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTap,
        currentIndex: currentPage,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(icon: Icon(LucideIcons.house), label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(LucideIcons.shoppingBag),
            label: "Shopping Cart",
          ),
          BottomNavigationBarItem(
            icon: Icon(LucideIcons.ticketPercent),
            label: "Promotion",
          ),

          BottomNavigationBarItem(
            icon: Icon(LucideIcons.heart),
            label: "Favorite",
          ),
          BottomNavigationBarItem(
            icon: Icon(LucideIcons.user),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
