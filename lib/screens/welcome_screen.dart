import 'package:flutter/material.dart';
import 'package:home_work_1/screens/login_screen.dart';

import '../models/auth_controller.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  _logout(BuildContext context) {
    AuthController.logout();
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Welcome'), actions: [
        IconButton(
          onPressed: () => _logout(context),
          icon: const Icon(Icons.logout_outlined),
        )
      ]),
      body: const SafeArea(
        child: Center(
          child: Text('Вітаю!'),
        ),
      ),
    );
  }
}
