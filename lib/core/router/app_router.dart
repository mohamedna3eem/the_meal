import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_meal/core/di/di.dart';
import 'package:the_meal/core/router/routes_name.dart';
import 'package:the_meal/presentation/meals/view/meals_Screen.dart';
import 'package:the_meal/presentation/meals/view_model/meals_view_model.dart';
import 'package:the_meal/presentation/meals_categories/view/categories_screen.dart';
import 'package:the_meal/presentation/meals_categories/view_model/categories_view_model.dart';
import 'package:the_meal/presentation/meals_details/view/meals_detalis_screen.dart';
import 'package:the_meal/presentation/meals_details/view_model/meals_details_view_model.dart';

abstract class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.categoryScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<CategoriesCubit>(),
            child: CategoriesScreen(),
          ),
        );
      case RouteNames.mealsDetailsScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) =>
                getIt<MealsDetailsCubit>(param1: settings.arguments),
            child: MealDetailsScreen(),
          ),
        );
      case RouteNames.mealsScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<MealsCubit>(param1: settings.arguments),
            child: MealsScreen(categoryName: settings.arguments as String),
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<CategoriesCubit>(),
            child: CategoriesScreen(),
          ),
        );
    }
  }
}
