import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:home_work_1/screens/welcome_screen.dart';

import 'models/auth_controller.dart';
import 'screens/login_screen.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  await AuthController.initialize();
  //SplashScreen delay
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  Future.delayed(const Duration(seconds: 3))
      .then((value) => FlutterNativeSplash.remove());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  Widget startScreen() {
    if (AuthController.isLogin) {
      return const WelcomeScreen();
    }
    return const LoginScreen();
  }

  @override
  Widget build(BuildContext context) {
    // Navigator.of(context).
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Home Work 1',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: startScreen(),
    );
  }
}
