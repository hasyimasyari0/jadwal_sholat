import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:prayer_times/models/prayer_times.dart';

class PrayerTimeService {
  Future<List<PrayerTime>> fetchPrayerTimes() async {
    final response = await http.get(Uri.parse(
        'https://raw.githubusercontent.com/lakuapik/jadwalsholatorg/master/adzan/pontianak/2023/12.json'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => PrayerTime.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load prayer times');
    }
  }
}
