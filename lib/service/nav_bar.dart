import 'package:flutter/material.dart';

import '../pages/browsing_page.dart';
import '../pages/favorite_page.dart';
import '../pages/history_page.dart';
import '../pages/learn_page.dart';
import '../pages/news_page.dart';
import '../pages/trading_page.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _selectedIndex = 0;

  /*final List<Widget> _pages = [
    Navigator(
      onGenerateRoute: (settings) {
        return MaterialPageRoute(builder: (context) => FavoritePage());
      },
    ),
    Navigator(
      onGenerateRoute: (settings) {
        return MaterialPageRoute(builder: (context) => BrowsingPage());
      },
    ),
    Navigator(
      onGenerateRoute: (settings) {
        return MaterialPageRoute(builder: (context) => HistoryPage());
      },
    ),
    Navigator(
      onGenerateRoute: (settings) {
        return MaterialPageRoute(builder: (context) => LearnPage());
      },
    ),
    Navigator(
      onGenerateRoute: (settings) {
        return MaterialPageRoute(builder: (context) => TradinPage());
      },
    ),
  ]; */

  void _navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    FavoritePage(),
    BrowsingPage(),
    NewsPage(),
    HistoryPage(),
    LearnPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _navigateBottomBar,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Fav'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.newspaper), label: 'News'),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: 'History'),
          BottomNavigationBarItem(icon: Icon(Icons.school), label: 'Learn'),
        ],
      ),
    );
  }
}
