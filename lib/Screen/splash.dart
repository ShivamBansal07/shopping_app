import 'dart:async';
import 'package:flutter/material.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(
      const Duration(seconds: 2),
      () => Navigator.of(context).pushReplacementNamed("/"),
    );
    return const Scaffold(
      body: Center(
        child: Text("Shopping App"),
      ),
    );
  }
}
