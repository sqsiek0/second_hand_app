import 'package:flutter/material.dart';

class BackgroundPage extends StatelessWidget {
  const BackgroundPage({required this.child, super.key});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: -MediaQuery.of(context).size.height * 0.1,
          left: -MediaQuery.of(context).size.width * 0.6,
          child: Container(
            width: MediaQuery.of(context).size.width * 1.5,
            height: MediaQuery.of(context).size.width * 1.5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(1000),
              color: Colors.blueGrey.shade100,
            ),
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height * 0.2,
          left: MediaQuery.of(context).size.width * 0.25,
          child: Container(
            width: MediaQuery.of(context).size.width * 1.5,
            height: MediaQuery.of(context).size.width * 1.5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(1000),
              color: Colors.blueGrey.shade300,
            ),
          ),
        ),
        child,
      ],
    );
  }
}
