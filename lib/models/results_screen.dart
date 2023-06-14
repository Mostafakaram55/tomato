
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:tomato/models/sliver_body.dart';
import 'custom_app_bar.dart';
class ResultView extends StatelessWidget {

  const ResultView(
      {
        Key? key,
        required this.imagePath,
        required this.prediction,
        required this.confidence
      })
      : super(key: key);
  final File imagePath;
  final String prediction;
  final double confidence;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          CustomScrollView(
            slivers:[
              SliverAppBarCustom(
                imagePath:imagePath ,
              ),
              SliverToBoxAdapter(
                child: SliverBody(
                  confidence: confidence,
                  prediction: prediction,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
