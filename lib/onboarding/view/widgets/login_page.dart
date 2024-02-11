import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:second_hand_app/app/view/widgets/app_textfield.dart';
import 'package:second_hand_app/onboarding/view/widgets/background_of_page.dart';
import 'package:second_hand_app/onboarding/view/widgets/login_or_register.dart';
import 'package:second_hand_app/onboarding/view/widgets/register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
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
                      'Witaj ponownie!',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.syne(
                        fontSize: 32,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      'Zaloguj się na swoje konto i szukaj nowych perełek!',
                      textAlign: TextAlign.left,
                      style: GoogleFonts.syne(
                        fontSize: 16,
                        color: Colors.grey.shade800,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 60),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Form(
                          key: _formKey,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          child: Column(
                            children: [
                              AppTextField(
                                hintText: 'E-mail',
                                icon: const Icon(Icons.email_outlined),
                                controller: emailController,
                              ),
                              const SizedBox(height: 20),
                              AppTextField(
                                hintText: 'Hasło',
                                icon: const Icon(Icons.lock_outlined),
                                isPassword: true,
                                controller: passwordController,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        InkWell(
                          onTap: () {},
                          child: Text(
                            'Nie pamietasz hasła?',
                            textAlign: TextAlign.left,
                            style: GoogleFonts.syne(
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),
                        LoginOrRegister(
                          isLoginFirst: true,
                          onLogin: () {
                            if (_formKey.currentState!.validate()) {
                              print('Login');
                            }
                          },
                          onRegister: () {
                            Navigator.of(context).push(
                              MaterialPageRoute<dynamic>(
                                builder: (context) => const RegisterPage(),
                              ),
                            );
                          },
                        ),
                      ],
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
