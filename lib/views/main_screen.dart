import 'package:cakecab/views/my_orders/my_order_page.dart';
import 'package:cakecab/views/profile/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'cart/cart_page.dart';
import 'home/home_page.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    HomePage(),
    Container(child: Center(child: Text("Categories")),),
    MyOrdersPage(),
    ProfilePage(allCakes: [],),
  ];

  @override
  Widget build(BuildContext context) {
    final brown = Color(0xFF6D4C41);
    final pink = Color(0xFFDC2652);

    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _currentIndex,
        onTap: (i) => setState(() => _currentIndex = i),
        selectedItemColor: brown,
        unselectedItemColor: pink,
        items: [
          SalomonBottomBarItem(
            icon: Icon(Icons.home,size: 30,),
            title: Text("Home"),
            selectedColor: brown,
          ),
          SalomonBottomBarItem(
            icon: Icon(Icons.cake,size: 30,),
            title: Text("Categories"),
            selectedColor: brown,
          ),
          SalomonBottomBarItem(
            icon: Icon(Icons.receipt_long,size: 30,),
            title: Text("Orders"),
            selectedColor: brown,
          ),
          SalomonBottomBarItem(
            icon: Icon(Icons.person_outline,size: 30,),
            title: Text("User"),
            selectedColor: brown,
          ),
        ],
      ),
    );
  }
}
