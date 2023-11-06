import 'package:flutter/material.dart';

import 'News_home_Screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(
        const Duration(
          milliseconds: 1200,
        ), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const NewsHomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        child: Center(
          child: Image.asset(
            'assets/giphy.gif',
            width: 250,
            height: 250,
          ),
        ),
      ),
    );
  }
}
