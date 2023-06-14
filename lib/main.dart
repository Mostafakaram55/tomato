import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tomato/controller/app_cubit.dart';
import 'package:tomato/controller/app_states.dart';
import 'package:tomato/controller/dio_weather.dart';
import 'package:tomato/core/light.dart';
import 'package:tomato/models/splash_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/dark.dart';
import 'core/rout_manager.dart';
import 'core/share.dart';
void main() async
{
  WidgetsFlutterBinding.ensureInitialized();
  await Shared.init();
  bool isDark = Shared.getBoolData(key: 'isDark')??false;
  runApp(MyApp(isDark: isDark,));
}
class MyApp extends StatelessWidget {
  final bool isDark;
  const MyApp({super.key, required this.isDark});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (BuildContext context, Widget? child) {
        return MultiBlocProvider(
          providers:[
            BlocProvider(create:(context)=>AppCubit(WeatherCall())..changeMode(fromShared: isDark)),
          ],
          child:BlocBuilder<AppCubit,AppState>(
            builder: (context,state){
              return  MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: AppCubit.get(context).isDark?getThemeDataDark():getThemeDataLight(),
                onGenerateRoute: RouteGenerator.getRout,
                //initialRoute: NameRout.splashRoute,
                home:const SplashView() ,
              );
            },
          ),
        );
      },
    );
  }
}


