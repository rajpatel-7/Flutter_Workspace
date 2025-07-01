Future<String> fetchWeatherData() async {
  print("Fetching weather data...");
  await Future.delayed(Duration(seconds: 2));
  print("Still loading weather data...");
  await Future.delayed(Duration(seconds: 2));
  return "Weather data loaded successfully.";
}

void main() async {
  String result = await fetchWeatherData();
  print(result);
}
