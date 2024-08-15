import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prayer_times/viewmodels/prayer_time_viewmodel.dart';

class PrayerTimesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pontianak Prayer Times'),
        backgroundColor: Colors.teal,
      ),
      body: Consumer<PrayerTimeViewModel>(
        builder: (context, viewModel, child) {
          if (viewModel.loading) {
            return Center(
              child: CircularProgressIndicator(
                color: Colors.teal,
              ),
            );
          }

          if (viewModel.prayerTimes.isEmpty) {
            return Center(
              child: Text('No prayer times available.'),
            );
          }

          return ListView.builder(
            padding: EdgeInsets.all(16.0),
            itemCount: viewModel.prayerTimes.length,
            itemBuilder: (context, index) {
              final prayerTime = viewModel.prayerTimes[index];
              final today = DateTime.now();
              final formattedDate = _formatDate(prayerTime.tanggal, today.year);

              return Card(
                margin: EdgeInsets.symmetric(vertical: 8.0),
                elevation: 4.0,
                child: ListTile(
                  contentPadding: EdgeInsets.all(16.0),
                  title: Text(
                    formattedDate,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 8.0),
                      _buildPrayerTimeRow('Imsyak', prayerTime.imsyak),
                      _buildPrayerTimeRow('Shubuh', prayerTime.shubuh),
                      _buildPrayerTimeRow('Terbit', prayerTime.terbit),
                      _buildPrayerTimeRow('Dhuha', prayerTime.dhuha),
                      _buildPrayerTimeRow('Dzuhur', prayerTime.dzuhur),
                      _buildPrayerTimeRow('Ashr', prayerTime.ashr),
                      _buildPrayerTimeRow('Maghrib', prayerTime.magrib),
                      _buildPrayerTimeRow('Isya', prayerTime.isya),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  String _formatDate(String dateStr, int year) {
    try {
      final parsedDate = DateTime.parse(dateStr);
      final newDate = DateTime(year, parsedDate.month, parsedDate.day);
      return "${newDate.day.toString().padLeft(2, '0')} ${_monthName(newDate.month)} ${newDate.year}";
    } catch (e) {
      return dateStr;
    }
  }

  String _monthName(int month) {
    const monthNames = [
      "Januari", "Februari", "Maret", "April", "Mei", "Juni",
      "Juli", "Agustus", "September", "Oktober", "November", "Desember"
    ];
    return monthNames[month - 1];
  }

  Widget _buildPrayerTimeRow(String label, String time) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.teal,
            ),
          ),
          Text(
            time,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }
}
