import '../models/radio_item.dart';
import '../models/surahs.dart';

abstract class AppState {}

class InitialState extends AppState {}

class LoadingState extends AppState {}

class LoadedState extends AppState {
  final Map<String, dynamic>? prayers;
  final List<Surahs>? surahs;
  final List? ayahs;
  final List<RadioItem>? radioItems;

  LoadedState({this.prayers, this.surahs, this.ayahs, this.radioItems});
}

class ErrorState extends AppState {
  final String errorMessage;

  ErrorState({required this.errorMessage});
}
