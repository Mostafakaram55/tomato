
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tomato/controller/app_cubit.dart';
import 'package:tomato/controller/app_states.dart';
import 'package:tomato/core/reso.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:tomato/models/weather/weather_models.dart';
import 'package:url_launcher/url_launcher.dart';
import '../controller/location.dart';
import '../core/rout_manager.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  void initState() {
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit,AppState>(
      builder: (context,state){
        //WeatherModel? weatherModel=AppCubit.get(context).weatherModel;
        return  Scaffold(
          backgroundColor: Theme.of(context).backgroundColor,
          body:  Padding(
            padding:  EdgeInsets.symmetric(horizontal: 20.sp,vertical: 40.sp),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Botanist',
                        style: GoogleFonts.adamina(
                            fontSize: 22.sp,
                          color: Theme.of(context).disabledColor
                        ),
                      ),
                      SizedBox(
                        height: 50.h,
                        child: Lottie.network(
                          'https://assets9.lottiefiles.com/packages/lf20_xd9ypluc.json',
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: (){
                          AppCubit.get(context).changeMode();
                        },
                        icon:  Icon(
                          Icons.dark_mode_outlined,
                          color: Theme.of(context).disabledColor,
                          size: 36.sp,
                        ),
                      )
                    ],
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
                            content: SizedBox(
                              width: 300.w,
                              height: 300.h,
                              child: Column(
                                children: [
                                   Text(
                                      'Infection appears on leaves, stems and fruits in periods of moderate heat and high humidity. Infection appears on leaves, stems and fruits in periods of moderate heat and high humidity',
                                    style: TextStyle(
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.bold,
                                        color: Theme.of(context).disabledColor
                                    ),
                                  ),
                                  InkWell(
                                    onTap: (){
                                      openLink('https://www.youtube.com/watch?v=ld9-5D2l3qA');
                                    },
                                    child: Image.asset(
                                        AssetsData.ope,
                                      height: 50.h,
                                      width: 100.w,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ));
                    },
                    child: Card(
                      color: Theme.of(context).primaryColor,
                      elevation: 9,
                      child: Padding(
                        padding:  EdgeInsets.all(8.0.sp),
                        child: Column(
                          children: [
                            Padding(
                              padding:  EdgeInsets.all(8.0.sp),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children:[
                                  Expanded(
                                    child: Text(
                                      'Disease symptoms appear on plants while they are still small in the form of black spots on old leaves',
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.aBeeZee(
                                          fontSize: 20.sp,
                                        color: Theme.of(context).disabledColor
                                      ),
                                    ),
                                  ),
                                  const Spacer(),
                                  Container(
                                    width: 100.w,
                                    height: 100.h,
                                    decoration: BoxDecoration(
                                        image: const DecorationImage(
                                          fit: BoxFit.cover,
                                            image: AssetImage(
                                              AssetsData.tomato1,
                                            )
                                        ),
                                        borderRadius: BorderRadius.circular(10.sp)
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
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
                            content: SizedBox(
                              width: 300.w,
                              height: 300.h,
                              child: Column(
                                children: [
                                  Text(
                                    'Symptoms of the disease appear in the form of brown spots that start from the tips of the leaf, then white scales appear covering the lower surface of the leaf, and then gray or brown spots with a wrinkled appearance appear on the fruits.',
                                    maxLines: 10,
                                    style: TextStyle(
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(context).disabledColor
                                    ),
                                  ),
                                  InkWell(
                                    onTap: (){
                                      //openLink('https://www.youtube.com/watch?v=UM7mOoJRci4');
                                      openLink('https://www.youtube.com/watch?v=UM7mOoJRci4');
                                    },
                                    child: Image.asset(
                                      AssetsData.ope,
                                      height: 50.h,
                                      width: 100.w,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ));
                    },
                    child: Card(
                      color: Theme.of(context).primaryColor,
                      elevation: 9,
                      child: Padding(
                        padding:  EdgeInsets.all(8.0.sp),
                        child: Column(
                          children: [
                            Padding(
                              padding:  EdgeInsets.all(8.0.sp),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children:[
                                  Expanded(
                                    child: Text(
                                      'Disease symptoms appear on plants while they are still small in the form of black spots on old leaves',
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.aBeeZee(
                                          fontSize: 20.sp,
                                          color: Theme.of(context).disabledColor
                                      ),
                                    ),
                                  ),
                                  const Spacer(),
                                  Container(
                                    width: 100.w,
                                    height: 100.h,
                                    decoration: BoxDecoration(
                                        image: const DecorationImage(
                                            fit: BoxFit.cover,
                                            image: AssetImage(
                                              AssetsData.tomato2,
                                            )
                                        ),
                                        borderRadius: BorderRadius.circular(10.sp)
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Card(
                      color: Theme.of(context).primaryColor,
                      elevation: 9,
                      child: Padding(
                        padding:  EdgeInsets.all(10.sp),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              child: Image(
                                image: const AssetImage(AssetsData.gallery),
                                width: 70.w,
                                height: 80.h,
                              ),
                              onTap: (){
                                AppCubit.get(context).uploadImage().then((value) {
                                  Navigator.pushNamed(context, NameRout.resultView,
                                      arguments: ResultVariables(
                                          imagePath: AppCubit.get(context).selectedImage!,
                                          prediction: value['Prediction'],
                                          confidence: value['confidence']));
                                });
                              },
                            ),
                            Image(
                              width: 40.w,
                              height: 40.h,
                              image: const AssetImage(AssetsData.scan),
                            ),
                            InkWell(
                              onTap: (){
                                AppCubit.get(context).camera();
                              },
                              child: Image(image: const AssetImage(AssetsData.camera), width: 70.w,
                                height: 80.h,
                              ),
                            ),
                          ],
                        ),
                      )
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:[
                       Text(
                          'Step 1:- Select the image',
                        style: TextStyle(
                            color: Theme.of(context).disabledColor
                        ),
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                       Text(
                           'Step 2:- Wait a few minutesSelect the image',
                         style: TextStyle(
                             color: Theme.of(context).disabledColor
                         ),
                       ),
                      SizedBox(
                        height: 3.h,
                      ),
                       Text(
                           'Step 3:-Click on the treatment button to see the treatment',
                         style: TextStyle(
                             color: Theme.of(context).disabledColor
                         ),
                       ),
                      Divider(
                        height: 1.h,
                        thickness: 1.sp,
                        color: Colors.grey,
                      ),
                      Text(
                        'The application helps to explore two tomato diseases, which are the most common',
                        maxLines: 2,
                        style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w500,
                          fontSize: 13.sp,
                          color:Theme.of(context).disabledColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
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
