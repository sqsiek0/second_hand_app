import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:second_hand_app/app/view/widgets/app_textfield.dart';
import 'package:second_hand_app/onboarding/view/widgets/background_of_page.dart';
import 'package:second_hand_app/onboarding/view/widgets/login_or_register.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  late final TextEditingController repeatPasswordController;
  late final TextEditingController nameController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    repeatPasswordController = TextEditingController();
    nameController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    repeatPasswordController.dispose();
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: BackgroundPage(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(
              left: 16,
              right: 16,
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Witaj użytkowniku!',
                      textAlign: TextAlign.left,
                      style: GoogleFonts.syne(
                        fontSize: 32,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      'Zarejestruj się i stań się łowcą nowych perełek!',
                      textAlign: TextAlign.left,
                      style: GoogleFonts.syne(
                        fontSize: 16,
                        color: Colors.grey.shade800,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 60),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          AppTextField(
                            hintText: 'Imię',
                            controller: nameController,
                            icon: const Icon(Icons.person_outlined),
                          ),
                          const SizedBox(height: 20),
                          AppTextField(
                            controller: emailController,
                            hintText: 'Email',
                            icon: const Icon(Icons.email_outlined),
                          ),
                          const SizedBox(height: 20),
                          AppTextField(
                            controller: passwordController,
                            hintText: 'Hasło',
                            isPassword: true,
                            icon: const Icon(Icons.lock_outlined),
                          ),
                          const SizedBox(height: 20),
                          AppTextField(
                            controller: repeatPasswordController,
                            isPassword: true,
                            hintText: 'Powtórz hasło',
                            icon: const Icon(Icons.lock_outlined),
                          ),
                          const SizedBox(height: 30),
                          LoginOrRegister(
                            isLoginFirst: false,
                            onLogin: () {
                              Navigator.of(context).pop();
                            },
                            onRegister: () {
                              if (_formKey.currentState!.validate()) {}
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
