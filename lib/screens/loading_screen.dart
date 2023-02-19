import 'package:flutter/material.dart';
import 'package:weather/screens/location_screen.dart';
import 'package:weather/services/location.dart';
import 'package:weather/services/weather_data_handler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../utilities/constants.dart';


class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  

  void getLocationData()
  async {
    Location location = Location();
    await location.getCurrentLocation();
    var url = 'https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric';
    WeatherData weatherData = WeatherData(url: url);

    var weathData = await weatherData.getData();

    Navigator.of(context).push(MaterialPageRoute(builder: (context){
      return LocationScreen(locationWeatherData: weathData,);
    }));
  }

  @override
  void initState() {
    getLocationData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100,
        ),
      ),
    );
  }
}