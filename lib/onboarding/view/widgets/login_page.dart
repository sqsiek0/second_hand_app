import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: InkWell(
          onTap: () => Navigator.of(context).pop(),
          child: const Text('Login Page'),
        ),
      ),
    );
  }
}
