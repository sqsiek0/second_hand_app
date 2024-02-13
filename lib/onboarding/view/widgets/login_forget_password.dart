import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:second_hand_app/app/bloc/app_bloc.dart';
import 'package:second_hand_app/app/view/widgets/app_textfield.dart';
import 'package:second_hand_app/onboarding/view/widgets/background_of_page.dart';

class LoginForgetPassword extends StatefulWidget {
  const LoginForgetPassword({super.key});

  @override
  State<LoginForgetPassword> createState() => _LoginForgetPasswordState();
}

class _LoginForgetPasswordState extends State<LoginForgetPassword> {
  late final TextEditingController emailController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currentState = context.watch<AppBloc>().state;

    return BackgroundPage(
      child: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              left: 16,
              right: 16,
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Nie pamiętasz hasła?',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.syne(
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  'Nie ma problemu, podaj swój adres email, a my wyślemy Ci link do zresetowania hasła.',
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
                  child: AppTextField(
                    hintText: 'E-mail',
                    icon: const Icon(Icons.email_outlined),
                    controller: emailController,
                  ),
                ),
                const SizedBox(height: 25),
                if (currentState.errorMessage.isNotEmpty)
                  Align(
                    child: Text(
                      currentState.errorMessage,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.syne(
                        fontSize: 14,
                        color: Colors.red.shade700,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                const SizedBox(
                  height: 5,
                ),
                InkWell(
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      context.read<AppBloc>().add(
                            AppResetPassword(
                              email: emailController.text,
                            ),
                          );
                    }
                  },
                  child: Opacity(
                    opacity: currentState.isLoading ? 0.5 : 1.0,
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.black,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 20,
                        ),
                        child: Text(
                          'Wyślij link do resetowania hasła',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.syne(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
