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
        Weather weather = await wf.currentWeatherByLocation(
          event.position.latitude, 
          event.position.longitude,
        );

        print(weather);
        emit(WeatherBlocSuccess(weather));
      }
      catch(e)
      {
        emit(WeatherBlocFailure());
      }
    });
  }
}
