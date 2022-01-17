import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:furniture_shop_app/repositry/also_like_repositor.dart';
import 'package:furniture_shop_app/repositry/auth_repositry.dart';
import 'package:furniture_shop_app/repositry/trending_repository.dart';
import 'package:furniture_shop_app/screens/on_boarding/onboarding_screen.dart';
import 'package:furniture_shop_app/screens/test.dart';
import 'package:furniture_shop_app/services/cart_provider.dart';
import 'package:furniture_shop_app/services/counter_sevice.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CartProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => TrendingRepository(),
        ),
        ChangeNotifierProvider(
          create: (context) => CounterService(),
        ),
        ChangeNotifierProvider(
          create: (context) => AuthRepositry(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            primaryColor: const Color(0xfff9c678),
            scaffoldBackgroundColor: Colors.white,
            appBarTheme: const AppBarTheme(
                color: Colors.white,
                elevation: 0,
                iconTheme: IconThemeData(
                  color: Colors.black,
                )),
            colorScheme: ColorScheme.fromSwatch()
                .copyWith(secondary: const Color(0xffff2d55))),
        debugShowCheckedModeBanner: false,
        home:
            // TestProvider(),
            const OnBoardingScreen(),
      ),
    );
  }
}
