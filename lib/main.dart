import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:the_meal/core/di/di.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_meal/core/localization/en.dart';
import 'package:the_meal/core/provider/provider.dart';
import 'package:the_meal/core/router/app_router.dart';
import 'package:the_meal/core/router/routes_name.dart';
import 'package:provider/provider.dart';
import 'package:the_meal/presentation/favorites/view_model/favorites_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await configureDependencies();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => BottomNavProvider()),
        BlocProvider(create: (_) => getIt<FavoritesCubit>()..loadFavorites()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      locale: const Locale('en'),
      fallbackLocale: const Locale('en'),
      translations: AppTranslations(),
      debugShowCheckedModeBanner: false,
      title: 'The Meal App',
      onGenerateRoute: AppRouter.onGenerateRoute,
      initialRoute: RouteNames.home,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        useMaterial3: true,
      ),
    );
  }
}
