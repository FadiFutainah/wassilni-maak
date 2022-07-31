import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:wassilni_maak/config/style/theme.dart';
import 'package:wassilni_maak/presentation/screens/home_screen.dart';
import 'package:wassilni_maak/presentation/screens/map_screen.dart';
import 'package:wassilni_maak/presentation/screens/order_screen.dart';
import 'package:wassilni_maak/presentation/screens/splash_screen.dart';

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (
        BuildContext context,
        Orientation orientation,
        DeviceType deviceType,
      ) {
        return MaterialApp(
          home: const SafeArea(
            child: SplashScreen(),
          ),
          theme: primaryTheme,
          routes: {
            '/home': (context) => const HomeScreen(),
            '/map': (context) => const MapScreen(),
            '/order': (context) => const OrderScreen(),
          },
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
