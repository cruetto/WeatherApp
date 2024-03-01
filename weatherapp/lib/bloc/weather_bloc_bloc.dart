// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather/weather.dart';

part 'weather_bloc_event.dart';
part 'weather_bloc_state.dart';

class WeatherBlocBloc extends Bloc<WeatherBlocEvent, WeatherBlocState> {
  WeatherBlocBloc() : super(WeatherBlocInitial()) {
    on<Fetchweather>((event, emit) {
      try{
        WeatherFactory wf = WeatherFactory("API_KEY", language: Language.ENGLISH);
        Weather weather = await wf.Curr
        emit(WeatherBlocLoading());
      }
      catch(e)
      {
        emit(WeatherBlocFailure());
      }
    });
  }
}
