import 'package:flutter/material.dart';
import 'package:meal_app/screens/categories_screen.dart';
import 'package:meal_app/screens/favorite_screen.dart';

import '../widgets/main_drawer.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({Key? key}) : super(key: key);

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  final List<Map<String, Object>> _pages = [
    {'page': const CategoriesScreen(), 'title': 'Categories'},
    {'page': const FavoriteScreen(), 'title': 'Favorite'}
  ];
  int _selectedPageIndex = 0;

  void _selectedPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        initialIndex: 1,
        child: Scaffold(
          appBar: AppBar(
            title: Text(_pages[_selectedPageIndex]['title'].toString()),
          ),
          drawer: MainDrawer(),
          body: _pages[_selectedPageIndex]['page'] as Widget,
          bottomNavigationBar: BottomNavigationBar(
            onTap: _selectedPage,
            backgroundColor: Theme.of(context).primaryColor,
            unselectedItemColor: Colors.white,
            selectedItemColor: Theme.of(context).accentColor,
            currentIndex: _selectedPageIndex,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.category),
                label: 'Categories',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.star),
                label: 'Favorite',
              )
            ],
          ),
        ));
  }
}
