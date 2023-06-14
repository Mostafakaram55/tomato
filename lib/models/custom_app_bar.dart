
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SliverAppBarCustom extends StatelessWidget {
  const SliverAppBarCustom({Key? key, required this.imagePath, }) : super(key: key);
  final File imagePath;
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      stretch: true,
      pinned: true,
      leading:Container(
        margin:  EdgeInsets.only(left: 20.sp),
        width: 60.w,
        height: 60.h,
        decoration: BoxDecoration(
          shape:  BoxShape.circle,
            color: Theme.of(context).disabledColor
        ),
        child: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon:const Icon(
            Icons.arrow_back_ios,
            color:Colors.green,
          ),
        ),
      ),
      expandedHeight: 300.sp,
      flexibleSpace: FlexibleSpaceBar(
        background:  Image.file(
          imagePath,
          fit: BoxFit.cover,
        ),
        stretchModes:const [
          StretchMode.blurBackground,
          StretchMode.zoomBackground
        ],
      ),
      bottom: PreferredSize(
        preferredSize:  Size.fromHeight(0.0.sp),
        child: Stack(
          alignment: AlignmentDirectional.topCenter,
          children: [
            Container(
              height: 30.h,
              decoration: BoxDecoration(
                  color: Theme.of(context).disabledColor,
                borderRadius:  BorderRadius.only(
                    topRight: Radius.circular(30.sp),
                    topLeft: Radius.circular(30.sp)
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: Colors.grey,
                width: 50,
                height: 4,
              ),
            ),
          ],
        ),
      ),

    );
  }
}