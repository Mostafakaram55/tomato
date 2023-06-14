import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../core/reso.dart';
import '../core/rout_manager.dart';
class SplashBody extends StatefulWidget {
  const SplashBody({Key? key}) : super(key: key);
  @override

  State<SplashBody> createState() => _SplashBodyState();
}

class _SplashBodyState extends State<SplashBody> {
  @override
  void initState() {
    super.initState();
    nextPage();
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.topCenter,
      children:[
        Image.asset(
          AssetsData.pepo,
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
        Padding(
          padding:  EdgeInsets.symmetric(vertical:75.sp),
          child:  Text(
            'Botanist',
            style: GoogleFonts.actor(
                color:Colors.white,
                fontSize:40.sp
            ),
          ),
        ),
         Padding(
          padding:   EdgeInsets.symmetric(vertical:60.sp),
          child: const  Align(
              alignment:  AlignmentDirectional.bottomCenter,
              child:  CircularProgressIndicator(
                color: Colors.white,
              )),
        ),
      ],
    );
  }
  void nextPage(){
    Future.delayed(const Duration(seconds: 4),(){
      Navigator.pushReplacementNamed(context, NameRout.homeRoute);
    });
  }
}