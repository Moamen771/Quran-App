import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/manager/state.dart';
import 'package:quran_app/models/ayah.dart';
import 'package:quran_app/services/api_services.dart';
import '../models/radio_item.dart';
import '../models/surahs.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(InitialState());
  ApiServices apiServices = ApiServices();

  getSurahs() async {
    emit(LoadingSurahsState());
    try {
      List<Surahs> json = await apiServices.getSurahName();
      emit(LoadedSurahsState(surahs: json));
    } catch (e) {
      emit(ErrorSurahsState(errorMessage: e.toString()));
    }
  }

  getAyahs(String name) async {
    emit(LoadingAyahsState());
    try {
      List<Ayah> json = await apiServices.getSurahAyahs(name);
      emit(LoadedAyahsState(ayahs: json));
    } catch (e) {
      emit(ErrorAyahsState(errorMessage: e.toString()));
    }
  }

  getPrayers() async {
    emit(LoadingPrayerState());
    try {
      var json = await apiServices.getPrayerTime();
      emit(LoadedPrayerState(prayers: json));
    } catch (e) {
      emit(ErrorPrayerState(errorMessage: e.toString()));
    }
  }

  getRadio() async {
    emit(LoadingRadioState());
    try {
      List<RadioItem> json = await apiServices.getRadio();
      emit(LoadedRadioState(radioItems: json));
    } catch (e) {
      emit(ErrorRadioState(errorMessage: e.toString()));
    }
  }
}
