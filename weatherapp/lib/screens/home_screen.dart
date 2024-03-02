import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weatherapp/bloc/weather_bloc_bloc.dart';

// '${state.weather.areaName}', // Area name
// getWeatherIcon(state.weather.weatherConditionCode!), // Get Icon
// '${state.weather.temperature!.celsius!.round()}°C',
// state.weather.weatherDescription!, // Main weather
// DateFormat('EEEE dd,').add_jm().format(state.weather.date!), //DATE
// DateFormat().add_jm().format(state.weather.sunrise!),
// DateFormat().add_jm().format(state.weather.sunset!),
// "${state.weather.tempMax!.celsius!.round()}°C",
// "${state.weather.tempMin!.celsius!.round()}°C",


class HomeScreen extends StatelessWidget {
const HomeScreen({super.key});

  Widget getWeatherIcon(int code, double picScale){
    switch(code){
      case >200 && <=300:
        return Image.asset(
          "assets/1.png",
          scale: picScale,
        );
      case >300 && <=400:
        return Image.asset(
          "assets/2.png",
          scale: picScale,
        );
      case >400 && <=500:
        return Image.asset(
          "assets/3.png",
          scale: picScale,
        );
      case >500 && <=600:
        return Image.asset(
          "assets/3.png",
          scale: picScale,
        );
      case >600 && <=700:
        return Image.asset(
          "assets/4.png",
          scale: picScale,
        );
      case >700 && <800:
        return Image.asset(
          "assets/5.png",
          scale: picScale,
        );
      case == 800:
        return Image.asset(
          "assets/6.png",
          scale: picScale,
        ); 
      case >800 && <=804:
        return Image.asset(
          "assets/7.png",
          scale: picScale,
        );
      default:
        return Image.asset(
          "assets/7.png",
          scale: picScale,
        );
    }

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarBrightness: Brightness
                .dark // Make top bar of smartphone white so you can see percentage of battery and etc.
            ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: SizedBox(
          height: MediaQuery.of(context).size.height, // Maximum height
          child: Stack(
            children: [

              // Shapes to make beautiful back ground
              Align(
                  alignment: const AlignmentDirectional(3, -0.3),
                  child: Container(
                    height: 300,
                    width: 300,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.green),
                  )),
              Align(
                alignment: const AlignmentDirectional(-3, -0.3),
                child: Container(
                  height: 300,
                  width: 300,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.green),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0, -1.2),
                child: Container(
                  height: 300,
                  width: 600,
                  decoration: const BoxDecoration(color: Colors.blue ),
                ),
              ),


              BackdropFilter(
                // filter to make shapes blurry
                filter: ImageFilter.blur(sigmaX: 100.0, sigmaY: 100.0),
                child: Container(
                  decoration: const BoxDecoration(color: Colors.transparent),
                ),
              ),
              BlocBuilder<WeatherBlocBloc, WeatherBlocState>(
                builder: (context, state) {
                  if(state is WeatherBlocSuccess){
                  return SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // UI

                        //List of days
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            //1
                            Column(
                              children: [
                                const Text(
                                  "Today",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w300),
                                ),
                                const SizedBox(height: 3),
                                const Text(
                                  "10°C",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700),
                                ),
                                getWeatherIcon(state.weather.weatherConditionCode!, 8), // Get Icon
        
                              ],
                            ),
                            const Spacer(),

                            //2
                            Column(
                              children: [
                                const Text(
                                  "Today",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w300),
                                ),
                                const SizedBox(height: 3),
                                const Text(
                                  "10°C",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700),
                                ),
                                getWeatherIcon(state.weather.weatherConditionCode!, 8), // Get Icon
        
                              ],
                            ),
                            const Spacer(),

                            //3
                            Column(
                              children: [
                                const Text(
                                  "Today",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w300),
                                ),
                                const SizedBox(height: 3),
                                const Text(
                                  "10°C",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700),
                                ),
                                getWeatherIcon(state.weather.weatherConditionCode!, 8), // Get Icon
        
                              ],
                            ),
                            const Spacer(),

                            //4
                            Column(
                              children: [
                                const Text(
                                  "Today",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w300),
                                ),
                                const SizedBox(height: 3),
                                const Text(
                                  "10°C",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700),
                                ),
                                getWeatherIcon(state.weather.weatherConditionCode!, 8), // Get Icon
        
                              ],
                            ),
                            const Spacer(),
                            
                            //5
                            Column(
                              children: [
                                const Text(
                                  "Today",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w300),
                                ),
                                const SizedBox(height: 3),
                                const Text(
                                  "10°C",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700),
                                ),
                                getWeatherIcon(state.weather.weatherConditionCode!, 8), // Get Icon
        
                              ],
                            ),
                            
                          ],
                        ),
                        
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 35.0),
                          child: Divider(color: Colors.blueGrey),
                        ),

                        Center(
                          child:
                            Text(
                            '${state.weather.areaName}', // Area name
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.w300),
                            ),
                        ),
                        
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                const Text(

                                  "10°C",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 40,
                                    fontWeight: FontWeight.w300),
                                ),
                                getWeatherIcon(state.weather.weatherConditionCode!, 3),
                                
                              ],
                            ),


                             const Column(
                              children: [
                                Text(
                                  "7°C",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 40,
                                    fontWeight: FontWeight.w300),
                                ),
                                Text(
                                  "Feels like",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 40,
                                    fontWeight: FontWeight.w300),
                                ),
                                
                              ],
                            ),

                          ],
                        ),
                        
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 35.0),
                          child: Divider(color: Colors.blueGrey),
                        ),

                        const Text(
                          "Humidity:",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.w300),
                        ),
                        const Text(
                          "Wind:",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.w300),
                        ),
                        const Text(
                          "Pressure:",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.w300),
                        ),
                        const Text(
                          "Sunrise/Sunset:",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.w300),
                        ),

                        //UI
                      ],
                    ),
                  );
                  }else{
                    return Container();
                  }
                },
                
              ),
            ],
          ),
        ),
      ),
    );
  }
}
