import 'package:flutter/material.dart';
import 'package:tomato/models/splash_boody.dart';
class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SplashBody(),
    );
  }
}