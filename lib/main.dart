import 'package:flutter/material.dart';
import 'package:myapp/data/restaurants_data.dart';
import 'package:myapp/ui/_core/app_theme.dart';
import 'package:myapp/ui/_core/back_provider.dart';
import 'package:myapp/ui/splash/splash_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  RestaurantsData restaurantsData = RestaurantsData();
  await restaurantsData.getRestaurant();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) {
            return restaurantsData;
          },
        ),
        ChangeNotifierProvider(create: (context) => BagProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.appTheme,
      home: SplashScreen(),
    );
  }
}
