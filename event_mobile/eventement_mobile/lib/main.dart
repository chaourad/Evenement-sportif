import 'package:eventement_mobile/cache/cacheHelper.dart';
import 'package:eventement_mobile/ui/pages/Login.dart';
import 'package:eventement_mobile/ui/navbar/MyNavBarButtom.dart';
import 'package:eventement_mobile/ui/pages/Register.dart';
import 'package:eventement_mobile/ui/pages/homePage.dart';
import 'package:eventement_mobile/ui/pages/onboarding_screen.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheData.init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'login',
      routes: {
        'main': (context) => const OnboardingScreen(),
        'login': (context) => const LoginPage(),
        'Register': (context) => const Register(),
        'home': (context) => const MyNavBarButtom(),
        'evenement': (context) => const HomePage()
      },
    );
  }
}
