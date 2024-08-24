import 'package:flutter/material.dart';
import 'package:geocode/geocode.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:uzi_weather_app/model.dart';
import 'package:geolocator/geolocator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late double lat;
  late double lon;

  //
  //
  //Get location method
  Future<Position> _getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition();
  }
  //
  //
  //

  //
  //
  //Weather
  Map<String, dynamic> weatherJson = {};
  String output = 'City:\nTemp:\nMain:';

  Future getWeather(String lat, String lon) async {
    var uri = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&units=metric&appid=ebadab488c34c63f81646f67c7239595');
    var response = await http.get(uri);

    weatherJson = jsonDecode(response.body);
  }
  //
  //
  //

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Uzi Weather App"),
        centerTitle: true,
      ),
      body: Center(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'The Coordinates Are:',
              ),
              Text(
                output,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: () async {
                  await _getCurrentLocation().then((value) {
                    lat = value.latitude;
                    lon = value.longitude;
                  });

                  await getWeather(
                      lat.toStringAsFixed(2), lon.toStringAsFixed(2));
                  var address = await GeoCode()
                      .reverseGeocoding(latitude: lat, longitude: lon);

                  final weatherCoord = Model.fromJson(weatherJson);

                  setState(() {
                    output =
                        "City: ${address.city}\nTemp: ${weatherCoord.main.temp}°\nMain: ${weatherCoord.weather[0].main}";
                  });
                },
                child: Text("Check Local Weather"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
