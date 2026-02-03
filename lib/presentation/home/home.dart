import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_meal/core/provider/provider.dart';
import 'package:the_meal/presentation/favorites/view/favorites_Screen.dart';
import 'package:the_meal/presentation/meals/view/meals_Screen.dart';
import 'package:the_meal/presentation/meals_categories/view/categories_screen.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({super.key});

  final List<Widget> _screens = [
  CategoriesScreen(),
    const FavoritesScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final navProvider = context.watch<BottomNavProvider>();

    return Scaffold(
      body: _screens[navProvider.currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: navProvider.currentIndex,
        onTap: (index) => context.read<BottomNavProvider>().setIndex(index),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.restaurant),
            label: 'Meals',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}
