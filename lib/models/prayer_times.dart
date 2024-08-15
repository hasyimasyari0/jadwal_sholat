class PrayerTime {
  final String tanggal;
  final String imsyak;
  final String shubuh;
  final String terbit;
  final String dhuha;
  final String dzuhur;
  final String ashr;
  final String magrib;
  final String isya;

  PrayerTime({
    required this.tanggal,
    required this.imsyak,
    required this.shubuh,
    required this.terbit,
    required this.dhuha,
    required this.dzuhur,
    required this.ashr,
    required this.magrib,
    required this.isya,
  });

  factory PrayerTime.fromJson(Map<String, dynamic> json) {
    return PrayerTime(
      tanggal: json['tanggal'] as String,
      imsyak: json['imsyak'] as String,
      shubuh: json['shubuh'] as String,
      terbit: json['terbit'] as String,
      dhuha: json['dhuha'] as String,
      dzuhur: json['dzuhur'] as String,
      ashr: json['ashr'] as String,
      magrib: json['magrib'] as String,
      isya: json['isya'] as String,
    );
  }
}
