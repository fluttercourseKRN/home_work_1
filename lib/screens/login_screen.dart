import 'package:flutter/material.dart';
import 'package:home_work_1/screens/welcome_screen.dart';

import '../models/auth_controller.dart';
import '../widgets/stand_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final TextEditingController _loginController;
  late final TextEditingController _passwordController;
  late final GlobalKey<FormState> _formKey;

  bool _isSaveLogin = false;

  @override
  void initState() {
    super.initState();
    _loginController = TextEditingController();
    _passwordController = TextEditingController();
    _formKey = GlobalKey<FormState>();
  }

  _toggleCheckbox() {
    setState(() => _isSaveLogin = !_isSaveLogin);
  }

  _login() {
    final bool isLogin = AuthController.login(
      login: _loginController.text,
      password: _passwordController.text,
      saveLoginState: _isSaveLogin,
    );
    if (isLogin) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const WelcomeScreen(),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Невірні данні для входу'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Image.asset('assets/logo2.png'),

                /// Login text field
                TextField(
                  controller: _loginController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Login"),
                  ),
                ),

                /// TextField space
                const SizedBox(
                  height: 8,
                ),

                /// Password text field
                TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Password"),
                  ),
                ),

                /// Save login state checkbox
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        InkWell(
                          onTap: _toggleCheckbox,
                          child: const Text('Запам\'ятати мене'),
                        ),
                        Checkbox(
                          value: _isSaveLogin,
                          onChanged: (_) => _toggleCheckbox(),
                        ),
                      ],
                    ),

                    /// Login button
                    MaterialButton(
                      color: Colors.blue,
                      shape: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.blue),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      onPressed: _login,
                      child: const Text(
                        'Увійти',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                const StandWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
