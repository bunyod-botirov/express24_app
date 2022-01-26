import 'package:flutter/material.dart';
import 'package:express24/screens/orders_page.dart';
import 'package:express24/screens/profile_page.dart';
import 'package:express24/screens/home_page.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _currentPage = 0;
  final List _pages = <Widget>[
    const HomePage(),
    const OrdersPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentPage],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentPage,
        selectedIconTheme: const IconThemeData(
          color: Color(0xFFFDE93E),
        ),
        selectedItemColor: Colors.black54,
        unselectedItemColor: Colors.black45,
        selectedFontSize: 12,
        iconSize: MediaQuery.of(context).size.width * 0.08,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: "Главная",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined),
            label: "Заказы",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined),
            label: "Профиль",
          ),
        ],
        onTap: (value) {
          _currentPage = value;
          setState(() {});
        },
      ),
    );
  }
}
