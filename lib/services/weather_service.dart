import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:water_tracking/utils/secrets.dart';

class WeatherService {
  Future<double> fetchCurrentWeather(String cityName) async {
    final apiKey = Secrets.getWeatherApiKey();

    final response = await http.get(Uri.parse(
        'http://api.weatherapi.com/v1/current.json?key=$apiKey&q=$cityName'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final currentTemp = data['current']['temp_c'] as double;
      return currentTemp;
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}
