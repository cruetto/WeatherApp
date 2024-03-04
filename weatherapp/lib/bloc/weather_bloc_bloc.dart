// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/weather.dart';

import '../data/my_data.dart';


part 'weather_bloc_event.dart';
part 'weather_bloc_state.dart';


class WeatherBlocBloc extends Bloc<WeatherBlocEvent, WeatherBlocState> {

  WeatherBlocBloc() : super(WeatherBlocInitial()) {
    on<Fetchweather>((event, emit) async {

      emit(WeatherBlocLoading());
      try{
        //Connect to API
        WeatherFactory wf = WeatherFactory(API_KEY, language: Language.ENGLISH);


        // Also here five day forecast
        
        List<Weather> weatherList = await wf.fiveDayForecastByLocation(
          event.position.latitude, 
          event.position.longitude,
        );

        // Weather weather = await wf.currentWeatherByLocation(
        //   event.position.latitude, 
        //   event.position.longitude,
        // );

        print("Length of LIST:${weatherList.length}");
        for (var i = 0; i < weatherList.length; i++) {
          print("${weatherList[i]}");
        }
        
        
        emit(WeatherBlocSuccess(weatherList));
      }
      catch(e)
      {
        emit(WeatherBlocFailure());
      }

    });
  }
}

