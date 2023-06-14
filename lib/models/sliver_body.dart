
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tomato/core/reso.dart';
import 'package:lottie/lottie.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:url_launcher/url_launcher.dart';

class SliverBody extends StatelessWidget {
  const SliverBody({Key? key, required this.prediction, required this.confidence,}) : super(key: key);
  final String prediction;
  final double confidence;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 12.sp,vertical: 12.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:[
          Text(
           ' DiseaseName' ,
            style: GoogleFonts.montserrat(
                fontSize: 25.sp,
                fontWeight: FontWeight.bold,
              color: Theme.of(context).disabledColor
            ),
          ),
          SizedBox(
            height: 15.h,
          ),
          Row(
            children: [
              Text(
                prediction,
                style: GoogleFonts.montserrat(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).disabledColor
                ),
              ),
              const Spacer(),
              Text(
                '$confidence %',
                style: GoogleFonts.montserrat(
                  fontSize: 30.sp,
                  fontWeight: FontWeight.w600,
                  color:Theme.of(context).disabledColor,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          Text(
            'Description',
            style: GoogleFonts.montserrat(
                color:Colors.blueGrey,
                fontSize: 20,
                fontWeight: FontWeight.bold
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            prediction=='Potato__Early_blight'?'Irregular brown to black spots with overlapping circles that sometimes fuse to include the whole leaf and on the fruits, usually sunken spots at the neck of the fruit in brown to black overlapping circles'
                :'Late Symposium on Tomatoes - Agricultural EngineeringThis fungus infects all vegetative parts above the soil surface, and the infection appears in the form of watery spots on the edges and base of the leaves, and as the infection progresses, they turn black and may unite together until they cover the entire surface of the leaf',
            textAlign: TextAlign.justify,
            maxLines: 9,
            style: GoogleFonts.montserrat(
                fontSize:16,
                color: Colors.grey,
                fontWeight: FontWeight.bold
            ),
          ),
          SizedBox(
            height: 22.h,
          ),
          InkWell(
            onTap: (){
              showDialog(
                  context: context,
                  builder: (context)=>AlertDialog(
                    backgroundColor: Theme.of(context).backgroundColor,
                    title: Column(
                      children: [
                        IconButton(onPressed: (){
                          Navigator.pop(context,);
                        }, icon: Icon(
                            Icons.close_rounded,
                          size: 30.sp,
                          color: Colors.green,
                        )),
                        Text(
                         'Medicine Methods',
                          style:GoogleFonts.montserrat(
                            color:Theme.of(context).disabledColor,
                          ),
                        ),
                      ],
                    ),
                    content: ConditionalBuilder(
                        condition: prediction=='Early_blight',
                        builder: (context)=>SizedBox(
                            width: double.infinity,
                            child:  Padding(
                              padding:  EdgeInsets.all(20.sp),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                      'Pesticide',
                                      style: GoogleFonts.aBeeZee(
                                          color: Theme.of(context).disabledColor,
                                          fontSize: 30.sp
                                      )
                                  ),
                                  SizedBox(
                                    height:4.h,
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Amistar Top pesticide:-',
                                        style: TextStyle(
                                            color:Theme.of(context).disabledColor,
                                            fontSize: 20.sp,
                                            fontWeight: FontWeight.bold
                                        ),
                                      ),
                                      Text(
                                        ' at a rate of 50 cm3 / 100 liters of water.',
                                        style: TextStyle(
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.w400,
                                            color:Colors.grey
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 4.h,
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Pellez pesticide:-',
                                        style: TextStyle(
                                            color:Theme.of(context).disabledColor,
                                            fontSize:20,
                                            fontWeight: FontWeight.bold
                                        ),
                                      ),
                                      Text(
                                        '  at a rate of 50 g / 100 liters of water .',
                                        style: TextStyle(
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.grey
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 4.h,
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Score pesticide:-',
                                        style: TextStyle(
                                            color:Theme.of(context).disabledColor,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold
                                        ),
                                      ),
                                      Text(
                                        ' at a rate of 50 g / 100 liters of water .',
                                        style: TextStyle(
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.grey
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height:10.h,
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Divider(
                                    color: Theme.of(context).disabledColor,
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'feedback',
                                        style: GoogleFonts.acme(
                                            fontSize: 22.sp,
                                            color: Theme.of(context).disabledColor
                                        ),
                                      ),

                                    ],
                                  ),
                                ],
                              ),
                            )
                        ),
                        fallback: (context)=>SizedBox(
                            width: double.infinity,
                            child:  Padding(
                              padding:  EdgeInsets.all(20.sp),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                      'Pesticide',
                                      style: GoogleFonts.aBeeZee(
                                          color: Theme.of(context).disabledColor,
                                          fontSize: 30.sp
                                      )
                                  ),
                                  SizedBox(
                                    height: 4.h,
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Copper aerobatics:-',
                                        style: TextStyle(
                                            color:Theme.of(context).disabledColor,
                                            fontSize: 20.sp,
                                            fontWeight: FontWeight.bold
                                        ),
                                      ),
                                      Text(
                                        ' 46% at a rate of 250 gm/100 liters of water.',
                                        style: TextStyle(
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.w400,
                                            color:Colors.grey
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 4.h,
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Amistar:-',
                                        style: TextStyle(
                                            color:Theme.of(context).disabledColor,
                                            fontSize: 20.sp,
                                            fontWeight: FontWeight.bold
                                        ),
                                      ),
                                      Text(
                                        '  25% at a rate of 50 cm/100 liters of water.',
                                        style: TextStyle(
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.grey
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 4.h,
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Rivas:-',
                                        style: TextStyle(
                                            color:Theme.of(context).disabledColor,
                                            fontSize: 20.sp,
                                            fontWeight: FontWeight.bold
                                        ),
                                      ),
                                      Text(
                                        '  25% at a rate of 50 cm/100 liters of water.',
                                        style: TextStyle(
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.grey
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 4.h,
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Belize:-',
                                        style: TextStyle(
                                            color:Theme.of(context).disabledColor,
                                            fontSize:20,
                                            fontWeight: FontWeight.bold
                                        ),),
                                      Text(
                                        ' 75gm/100 liters of water.',
                                        style: TextStyle(
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.grey
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height:10.h,
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Divider(
                                    color: Theme.of(context).disabledColor,
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      InkWell(
                                        onTap:(){
                                          openLink('https://wa.me/+2001010798860');
                                        },
                                        child: Text(
                                          'feedback',
                                          style: GoogleFonts.acme(
                                              fontSize: 22.sp,
                                              color: Theme.of(context).disabledColor
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )
                        )
                    ),
                  ));
            },
            child: Card(
              color: Theme.of(context).backgroundColor,
              child: Padding(
                padding:  EdgeInsets.all(8.0.sp),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                        'Medicine Methods',
                      style:TextStyle(
                          color: Theme.of(context).disabledColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 15.sp
                      ),
                    ),
                   Image(
                       image:const AssetImage(AssetsData.medicine),
                     height: 70.h,
                     width: 50.w,
                   ),
                    SizedBox(
                      height: 70.h,
                      child: Lottie.network(
                        'https://assets7.lottiefiles.com/packages/lf20_tutvdkg0.json',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  Future<void>openLink(String link)async{
    var urlink=link;
    if(await canLaunch((urlink))){
      await launch (urlink);
    }
    else{
      await launch (urlink);
    }
  }
}