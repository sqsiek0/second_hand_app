import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onHorizontalDragStart: (details) {
          details.localPosition.dx < MediaQuery.of(context).size.width / 2
              ? print('Rejestracja')
              : print('Logowanie');
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
                              onTap: () {
                                print('Rejestracja');
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('Rejestracja',
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
                                      )
                                      // style: const TextStyle(
                                      //   color: Colors.white,
                                      //   fontSize: 24,
                                      // ),
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
                              onTap: () {
                                print('Logowanie');
                              },
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
