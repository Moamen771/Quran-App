import 'package:quran_app/models/ayah.dart';

class Surah {
  final String arName;
  final String enName;
  final String revelationType;
  final List<Ayah> ayah;

  Surah(
      {required this.arName,
      required this.enName,
      required this.revelationType,
      required this.ayah});
}
