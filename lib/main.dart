import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prayer_times/viewmodels/prayer_time_viewmodel.dart';
import 'package:prayer_times/screens/home_screen.dart'; // Pastikan path benar
import 'package:prayer_times/screens/prayer_times_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PrayerTimeViewModel()),
      ],
      child: MaterialApp(
        title: 'Prayer Times',
        theme: ThemeData(
          primarySwatch: Colors.teal,
        ),
        home: HomeScreen(), // Pastikan ini adalah screen awal
        routes: {
          '/prayer_times': (context) => PrayerTimesScreen(),
        },
      ),
    );
  }
}
