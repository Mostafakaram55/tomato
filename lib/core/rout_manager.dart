import 'dart:io';

import 'package:flutter/material.dart';

import '../models/home_screen.dart';
import '../models/results_screen.dart';
import '../models/splash_screen.dart';

class NameRout {
  static const splashRoute = '/';
  static const homeRoute = '/homeView';
  static const detailsRoute = '/detailsView';
  static const resultView = '/ResultView';

}
class ResultVariables {
  final File imagePath;
  final String prediction;
  final double confidence;

  const ResultVariables(
      {required this.imagePath,
        required this.prediction,
        required this.confidence});
}
class RouteGenerator {
  static Route<dynamic> getRout(RouteSettings settings) {
    switch (settings.name) {
      case NameRout.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case NameRout.homeRoute:
      //final bookModel = settings.arguments as BookModel;
        return MaterialPageRoute(builder: (_) => const HomeView());
      case NameRout.resultView:
        final data = settings.arguments as ResultVariables;
        return MaterialPageRoute(
            builder: (_) => ResultView(
              confidence: data.confidence,
              imagePath: data.imagePath,
              prediction: data.prediction,
            ));
    }
    return noFoundRoute();
  }

  static Route<dynamic> noFoundRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
          appBar: AppBar(
            title: const Text('NO FOUND ROUT'),
          ),
        ));
  }
}