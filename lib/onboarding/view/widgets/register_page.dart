import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Text('Rejestracja'),
        ),
      ),
    );
  }
}
