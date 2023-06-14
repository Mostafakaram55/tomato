import 'dart:convert';
import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tomato/controller/app_states.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:tomato/models/weather/weather_models.dart';

import '../core/const.dart';
import '../core/share.dart';
import 'dio_weather.dart';

class AppCubit extends Cubit<AppState>{
  AppCubit(this.weatherCall):super(InitialState());
  static AppCubit get(context)=>BlocProvider.of(context);
  WeatherModel? weatherModel;
  final WeatherCall weatherCall;
  File? selectedImage;
  String? Prediction = "";
  double confidence = 0;
  Future takeImage()async
  {
    final pickedImage =
    await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage == null) return;
    selectedImage = File(pickedImage.path);
  }
  Future camera()async{
    final pickedImage =
    await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedImage == null) return;
    selectedImage = File(pickedImage.path);
  }
  Future uploadImage() async {
    await takeImage();
    //emit(SuccessScanState());
    Prediction = "";
    confidence = 0;
    emit(LoadingState());
    final request = http.MultipartRequest(
        "post", Uri.parse("https://647b-41-35-128-255.ngrok-free.app/predict"));
    request.headers['Content-Type'] = 'multipart/form-data';
    request.files.add(await http.MultipartFile.fromPath(
      'image',
      selectedImage!.path,
    ));

    final response = await request.send();
    if (response.statusCode != 200) return;

    final resJson = await response.stream.bytesToString().then(jsonDecode);
    emit(SuccessState());
    return resJson;
  }

  void getWeather({
    required String lat,
    required String long,
  }){
    emit(WeatherLoadingState());
    weatherCall.getWeather(
        endpoint: EndPoint.forecast,parameters:{
      'q':'$lat,$long',
      'Key':EndPoint.key,
      'days':3,
    }).then((value){
      weatherModel=WeatherModel.fromJson(value);
      emit(WeatherSuccessState());
      print('**********************************');
      print(weatherModel?.current!.tempC);
      print('**********************************');
    }).catchError((error){
      emit(WeatherErrorState(error.toString()));
    });
  }
  bool isDark=false;
  void changeMode({
    bool? fromShared,
  }) {
    if (fromShared != null) {
      isDark = fromShared;
      emit(ShareSuccessState());
    } else {
      isDark = !isDark;
      Shared.putBoolData(key: 'isDark', value: isDark);
      emit(ShareSuccessState());
      print(isDark);
    }
  }

}