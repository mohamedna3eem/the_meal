import 'package:flutter/material.dart';
import 'package:the_meal/core/di/di.dart';
import 'package:the_meal/core/router/app_router.dart';
import 'package:the_meal/core/router/routes_name.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
   configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'The Meal App',
      onGenerateRoute: AppRouter.onGenerateRoute,
      initialRoute: RouteNames.categoryScreen,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        useMaterial3: true,
      ),
    );
  }
}


