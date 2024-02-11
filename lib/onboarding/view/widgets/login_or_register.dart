import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginOrRegister extends StatelessWidget {
  const LoginOrRegister({
    required this.isLoginFirst,
    super.key,
    this.onLogin,
    this.onRegister,
  });
  final VoidCallback? onLogin;
  final VoidCallback? onRegister;
  final bool isLoginFirst;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: isLoginFirst ? onLogin : onRegister,
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
                isLoginFirst ? 'Zaloguj się' : 'Zarejestruj się',
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
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                height: 1,
                color: Colors.grey.shade700,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                'lub',
                style: GoogleFonts.syne(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
            ),
            Expanded(
              child: Container(
                height: 1,
                color: Colors.grey.shade700,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        InkWell(
          onTap: isLoginFirst ? onRegister : onLogin,
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: Colors.grey.shade200,
              border: Border.all(),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 20,
              ),
              child: Text(
                isLoginFirst ? 'Zarejestruj się' : 'Zaloguj się',
                textAlign: TextAlign.center,
                style: GoogleFonts.syne(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
