import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:intl/intl.dart';
import 'package:weatherapp/bloc/weather_bloc_bloc.dart';
import 'package:weather/weather.dart';

// '${state.weather.areaName}', // Area name
// getWeatherIcon(state.weather.weatherConditionCode!), // Get Icon
// '${state.weather.temperature!.celsius!.round()}°C',
// state.weather.weatherDescription!, // Main weather
// DateFormat('EEEE dd,').add_jm().format(state.weather.date!), //DATE
// DateFormat().add_jm().format(state.weather.sunrise!),
// DateFormat().add_jm().format(state.weather.sunset!),
// "${state.weather.tempMax!.celsius!.round()}°C",
// "${state.weather.tempMin!.celsius!.round()}°C",

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
  

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
    

    final ButtonStyle upperMenuStyle = TextButton.styleFrom(
      foregroundColor: Colors.black87, 
      minimumSize: const Size(50, 20),
      padding: const EdgeInsets.symmetric(horizontal: 0),
      
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
    );

    

  

    return Scaffold(
      backgroundColor: Colors.blueGrey,
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
              // Align(
              //     alignment: const AlignmentDirectional(1.5, -0.3),
              //     child: Container(
              //       height: 300,
              //       width: 300,
              //       decoration: const BoxDecoration(
              //           shape: BoxShape.circle, color: Colors.green),
              //     )),
              // Align(
              //   alignment: const AlignmentDirectional(-1.5, -0.3),
              //   child: Container(
              //     height: 300,
              //     width: 300,
              //     decoration: const BoxDecoration(
              //         shape: BoxShape.circle, color: Colors.green),
              //   ),
              // ),
              // Align(
              //   alignment: const AlignmentDirectional(0, -1.2),
              //   child: Container(
              //     height: 300,
              //     width: 600,
              //     decoration: const BoxDecoration(color: Colors.blue ),
              //   ),
              // ),
              // Align(
              //   alignment: const AlignmentDirectional(0, 1.2),
              //   child: Container(
              //     height: 300,
              //     width: 150,
              //     decoration: const BoxDecoration(color: Colors.yellow ),
              //   ),
              // ),


              // BackdropFilter(
              //   // filter to make shapes blurry
              //   filter: ImageFilter.blur(sigmaX: 100.0, sigmaY: 100.0),
              //   child: Container(
              //     decoration: const BoxDecoration(color: Colors.transparent),
              //   ),
              // ),



              BlocBuilder<WeatherBlocBloc, WeatherBlocState>(
                builder: (context, state) {
                  if(state is WeatherBlocSuccess){
            
                  Weather displayWeather = state.weatherList[0];

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
                            //0
                            TextButton(
                              onPressed: () => {},
                              style: upperMenuStyle,
                              child: Column(
                                children: [
                                  const Text(
                                    "Today",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w300),
                                  ),
                                  const SizedBox(height: 3),
                                  Text(
                                    '${state.weatherList[0].temperature!.celsius!.round()}°C',
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  getWeatherIcon(state.weatherList[0].weatherConditionCode!, 8), // Get Icon
          
                                ],
                              ),
                            ),
                            
                            const Spacer(),

                            //1
                             TextButton(
                              onPressed: () => {
                                  print("Button 1 clicked"),
                                  // setState(() {displayWeather = state.weatherList[8];}),
                                  
                                },
                              style: upperMenuStyle,
                              child: Column(
                                children: [
                                  Text(
                                    DateFormat('EEEE').format(state.weatherList[8].date!),
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w300),
                                  ),
                                  const SizedBox(height: 3),
                                  Text(
                                    '${state.weatherList[8].temperature!.celsius!.round()}°C',
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  getWeatherIcon(state.weatherList[8].weatherConditionCode!, 8), // Get Icon
          
                                ],
                              ),
                            ),

                            const Spacer(),

                            //2
                            TextButton(
                              onPressed: () => {},
                              style: upperMenuStyle,
                              child: Column(
                                children: [
                                  Text(
                                    DateFormat('EEEE').format(state.weatherList[16].date!),
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w300),
                                  ),
                                  const SizedBox(height: 3),
                                  Text(
                                    '${state.weatherList[16].temperature!.celsius!.round()}°C',
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  getWeatherIcon(state.weatherList[16].weatherConditionCode!, 8), // Get Icon
          
                                ],
                              ),
                            ),

                            const Spacer(),

                            //3
                           TextButton(
                              onPressed: () => {},
                              style: upperMenuStyle,
                              child: Column(
                                children: [
                                  Text(
                                    DateFormat('EEEE').format(state.weatherList[24].date!),
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w300),
                                  ),
                                  const SizedBox(height: 3),
                                  Text(
                                    '${state.weatherList[24].temperature!.celsius!.round()}°C',
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  getWeatherIcon(state.weatherList[24].weatherConditionCode!, 8), // Get Icon
          
                                ],
                              ),
                            ),

                            const Spacer(),
                            
                            //4
                            TextButton(
                              onPressed: () => {},
                              style: upperMenuStyle,
                              child: Column(
                                children: [
                                  Text(
                                    DateFormat('EEEE').format(state.weatherList[32].date!),
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w300),
                                  ),
                                  const SizedBox(height: 3),
                                  Text(
                                    '${state.weatherList[30].temperature!.celsius!.round()}°C',
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  getWeatherIcon(state.weatherList[32].weatherConditionCode!, 8), // Get Icon
          
                                ],
                              ),
                            ),
                            
                          ],
                        ),
                        
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 35.0),
                          child: Divider(color: Colors.blueGrey),
                        ),

                        GlassmorphicContainer(
                          
                          // TODO resize
                          width: 400,
                          height: 300,
                          borderRadius: 20,
                          blur: 20,
                          alignment: Alignment.center,
                          border: 2,
                          linearGradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                const Color(0xFFffffff).withOpacity(0.1),
                                const Color(0xFFFFFFFF).withOpacity(0.05),
                              ],
                              stops: const [
                                0.1,
                                1,
                              ]),
                          borderGradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              const Color(0xFFffffff).withOpacity(0.5),
                              const Color((0xFFFFFFFF)).withOpacity(0.5),
                            ],
                          ),
                          child: Column(
                            children: 
                              [
                                Center(
                          child:
                            Text(
                            '${displayWeather.areaName}', // Area name
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
                                Text(

                                  '${displayWeather.temperature!.celsius!.round()}°C',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 40,
                                    fontWeight: FontWeight.w300),
                                ),
                                getWeatherIcon(displayWeather.weatherConditionCode!, 3),
                                
                              ],
                            ),


                            Column(
                              children: [
                                Text(
                                  '${displayWeather.tempFeelsLike!.celsius!.round()}°C',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 40,
                                    fontWeight: FontWeight.w300),
                                ),
                                const Text(
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
                              ]
                          )
                        ),
                        
                        
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 35.0),
                          child: Divider(color: Colors.blueGrey),
                        ),

                        Text(
                          "Humidity: ${displayWeather.humidity}",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.w300),
                        ),
                        Text(
                          "Wind: ${displayWeather.windSpeed}",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.w300),
                        ),
                        Text(
                          "Pressure: ${displayWeather.pressure}",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.w300),
                        ),
                        // const Text(
                        //   "Sunrise/Sunset:"
                        //   style: TextStyle(
                        //     color: Colors.white,
                        //     fontSize: 30,
                        //     fontWeight: FontWeight.w300),
                        // ),

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
// class HomeScreen extends StatelessWidget {
// const HomeScreen({super.key});

 
// }

