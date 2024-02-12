import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:second_hand_app/app/bloc/app_bloc.dart';
import 'package:second_hand_app/onboarding/view/widgets/login_page.dart';
import 'package:second_hand_app/onboarding/view/widgets/register_page.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    void onClik(double direction) => Navigator.of(context).push(
          PageRouteBuilder<dynamic>(
            pageBuilder: (
              _,
              animation,
              secondaryAnimation,
            ) =>
                direction == 1
                    ? BlocProvider.value(
                        value: context.read<AppBloc>(),
                        child: const LoginPage(),
                      )
                    : BlocProvider.value(
                        value: context.read<AppBloc>(),
                        child: const RegisterPage(),
                      ),
            transitionDuration: const Duration(milliseconds: 200),
            reverseTransitionDuration: const Duration(milliseconds: 200),
            transitionsBuilder: (
              context,
              animation,
              secondaryAnimation,
              child,
            ) {
              return SlideTransition(
                position: Tween<Offset>(
                  begin: Offset(direction, 0),
                  end: Offset.zero,
                ).animate(animation),
                child: child,
              );
            },
          ),
        );

    return Scaffold(
      body: GestureDetector(
        onHorizontalDragStart: (details) {
          details.localPosition.dx < MediaQuery.of(context).size.width / 2
              ? onClik(-1)
              : onClik(1);
        },
        child: Column(
          children: [
            Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Image.asset(
                  'assets/images/antique_shop.jpg',
                  fit: BoxFit.cover,
                  height: MediaQuery.of(context).size.height,
                ),
                Stack(
                  alignment: AlignmentDirectional.topCenter,
                  clipBehavior: Clip.none,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.3),
                                spreadRadius: 25,
                                blurRadius: 25,
                                offset: const Offset(15, 0),
                              ),
                            ],
                            backgroundBlendMode: BlendMode.darken,
                            gradient: LinearGradient(
                              colors: [
                                Colors.black.withOpacity(0.7),
                                Colors.transparent,
                              ],
                            ),
                          ),
                          height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: InkWell(
                              onTap: () => onClik(-1),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Rejestracja',
                                    textScaler: TextScaler.linear(
                                      MediaQuery.of(context).size.height /
                                          (MediaQuery.of(context).size.width *
                                                  0.4 -
                                              20) /
                                          6,
                                    ),
                                    style: GoogleFonts.syne(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 24,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  const Icon(
                                    Icons.arrow_back_rounded,
                                    size: 40,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.3),
                                spreadRadius: 25,
                                blurRadius: 25,
                                offset: const Offset(-15, 0),
                              ),
                            ],
                            backgroundBlendMode: BlendMode.darken,
                            gradient: LinearGradient(
                              colors: [
                                Colors.transparent,
                                Colors.black.withOpacity(0.7),
                              ],
                            ),
                          ),
                          height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: InkWell(
                              onTap: () => onClik(1),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Logowanie',
                                    textScaler: TextScaler.linear(
                                      MediaQuery.of(context).size.height /
                                          (MediaQuery.of(context).size.width *
                                                  0.4 -
                                              20) /
                                          6,
                                    ),
                                    style: GoogleFonts.syne(
                                      color: Colors.white,
                                      fontSize: 24,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  const Icon(
                                    Icons.arrow_forward_rounded,
                                    size: 40,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                      top: 0,
                      child: SafeArea(
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: 100,
                            left: 20,
                            right: 20,
                          ),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: Text(
                              'Witaj w Second Hand App',
                              textScaler: TextScaler.linear(
                                MediaQuery.of(context).size.height /
                                    (MediaQuery.of(context).size.width * 0.4 -
                                        20) /
                                    6,
                              ),
                              textAlign: TextAlign.center,
                              style: GoogleFonts.syne(
                                color: Colors.white,
                                fontSize: 28,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
