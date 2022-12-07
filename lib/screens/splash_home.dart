import 'dart:async';

import 'package:flutter/material.dart';

class SplashHome extends StatefulWidget {
  const SplashHome({super.key});

  @override
  State<SplashHome> createState() => _SplashHomeState();


}

class _SplashHomeState extends State<SplashHome> {

    @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5),
        () => Navigator.pushReplacementNamed(context, "home"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/fondo_pelicula.png"),
            fit: BoxFit.cover
          )
        ),
      ),
    );
  }
}