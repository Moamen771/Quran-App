import 'package:quran_app/models/ayah.dart';
import 'package:quran_app/models/prayer.dart';
import 'package:quran_app/models/radio_item.dart';
import 'package:quran_app/models/surahs.dart';

abstract class AppState {}

class InitialState extends AppState {}

class LoadingPrayerState extends AppState {}

class LoadedPrayerState extends AppState {
  final List<Prayer>? prayers;

  LoadedPrayerState({required this.prayers});
}

class ErrorPrayerState extends AppState {
  final String errorMessage;

  ErrorPrayerState({required this.errorMessage});
}

////////////////////////////////////////

class LoadingRadioState extends AppState {}

class LoadedRadioState extends AppState {
  final List<RadioItem> radioItems;

  LoadedRadioState({required this.radioItems});
}

class ErrorRadioState extends AppState {
  final String errorMessage;

  ErrorRadioState({required this.errorMessage});
}

////////////////////////////////////////

class LoadingSurahsState extends AppState {}

class LoadedSurahsState extends AppState {
  final List<Surahs> surahs;

  LoadedSurahsState({required this.surahs});
}

class ErrorSurahsState extends AppState {
  final String errorMessage;

  ErrorSurahsState({required this.errorMessage});
}

////////////////////////////////////////

class LoadingAyahsState extends AppState {}

class LoadedAyahsState extends AppState {
  final List<Ayah> ayahs;

  LoadedAyahsState({required this.ayahs});
}

class ErrorAyahsState extends AppState {
  final String errorMessage;

  ErrorAyahsState({required this.errorMessage});
}
