import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const String apiKey = "YOUR_API_KEY"; 
const String city = "London"; 

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WeatherScreen(),
    );
  }
}

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  String temperature = "";
  String weatherDescription = "";
  String iconCode = "";

  @override
  void initState() {
    super.initState();
    fetchWeather();
  }

  Future<void> fetchWeather() async {
    final url =
        "https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey&units=metric";

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        temperature = "${data['main']['temp']}°C";
        weatherDescription = data['weather'][0]['description'];
        iconCode = data['weather'][0]['icon'];
      });
    } else {
      setState(() {
        temperature = "Error";
        weatherDescription = "Failed to load weather";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Weather App")),
      body: Center(
        child: temperature.isEmpty
            ? const CircularProgressIndicator()
            : Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              city,
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            if (iconCode.isNotEmpty)
              Image.network("https://openweathermap.org/img/w/$iconCode.png"),
            Text(
              temperature,
              style: const TextStyle(fontSize: 40),
            ),
            Text(
              weatherDescription.toUpperCase(),
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: fetchWeather,
              child: const Text("Refresh"),
            ),
          ],
        ),
      ),
    );
  }
}

