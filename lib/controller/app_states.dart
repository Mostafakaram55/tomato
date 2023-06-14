abstract class AppState{}
class InitialState extends AppState{}
class LoadingState extends AppState{}
class SuccessState extends AppState{}
class ErrorState extends AppState{}
class WeatherLoadingState extends AppState{}
class WeatherSuccessState extends AppState{}
class ShareSuccessState extends AppState{}
class WeatherErrorState extends AppState{
  final String error;

  WeatherErrorState(this.error);

}
