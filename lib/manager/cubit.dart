import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/manager/state.dart';
import 'package:quran_app/services/api_services.dart';
import '../models/radio_item.dart';
import '../models/surahs.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(InitialState());
  ApiServices apiServices = ApiServices();

  getSurahs() async {
    emit(LoadingState());
    try {
      List json = apiServices.getSurahName()["data"];
      List<Surahs> surahs = [];
      for (Map<String, dynamic> i in json) {
        surahs.add(Surahs(
            arName: i["name"],
            enName: i["englishName"],
            revelationType: i["revelationType"],
            numberOfAyahs: i["numberOfAyahs"]));
      }
      emit(LoadedState(surahs: surahs));
    } catch (e) {
      emit(ErrorState(errorMessage: e.toString()));
    }
  }

  getAyahs(String name) async {
    emit(LoadingState());
    try {
      List json = apiServices.getSurahAyahs(name)["data"]["surahs"];
      List ayahs = [];
      for (Map<String, dynamic> i in json) {
        if (i["name"] == name) {
          ayahs = i["ayahs"];
        }
      }
      emit(LoadedState(ayahs: ayahs));
    } catch (e) {
      emit(ErrorState(errorMessage: e.toString()));
    }
  }

  getPrayers() async {
    emit(LoadingState());

    try {
      Map json = apiServices.getPrayerTime();
      Map<String, dynamic> prayers = json["data"]["timings"];
      emit(LoadedState(prayers: prayers));
    } catch (e) {
      emit(ErrorState(errorMessage: e.toString()));
    }
  }

  getRadio() async {
    emit(LoadingState());

    try {
      List json = apiServices.getRadio()["radios"];
      List<RadioItem> radioItems = [];
      for (Map<String, dynamic> i in json) {
        radioItems.add(RadioItem(id: i["id"], name: i["name"], url: i["url"]));
      }
      emit(LoadedState(radioItems: radioItems));
    } catch (e) {
      emit(ErrorState(errorMessage: e.toString()));
    }
  }
}
