import 'package:flutter/material.dart';
import 'package:prayer_times/models/prayer_times.dart';
import 'package:prayer_times/services/prayer_times_services.dart';

class PrayerTimeViewModel extends ChangeNotifier {
  final PrayerTimeService _service = PrayerTimeService();
  List<PrayerTime> _prayerTimes = [];
  bool _loading = true;

  List<PrayerTime> get prayerTimes => _prayerTimes;
  bool get loading => _loading;

  PrayerTimeViewModel() {
    fetchPrayerTimes();
  }

  Future<void> fetchPrayerTimes() async {
    _loading = true;
    notifyListeners();

    try {
      _prayerTimes = await _service.fetchPrayerTimes();
      print('Prayer times fetched successfully: $_prayerTimes');
    } catch (e) {
      print('Error fetching prayer times: $e');
    }

    _loading = false;
    notifyListeners();
  }
}
