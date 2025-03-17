import 'package:dio/dio.dart';
import 'package:quran_app/models/radio_item.dart';
import 'package:quran_app/models/surahs.dart';

class ApiServices {
  final Dio dio = Dio();

  getSurahName() async {
    var response = await dio.get('https://api.alquran.cloud/v1/surah');
    List json = response.data["data"];
    List<Surahs> surahs = [];
    for (Map<String, dynamic> i in json) {
      surahs.add(Surahs(
          arName: i["name"],
          enName: i["englishName"],
          revelationType: i["revelationType"],
          numberOfAyahs: i["numberOfAyahs"]));
    }
    return surahs;
  }

  getSurahAyahs(String name) async {
    var response =
        await dio.get('https://api.alquran.cloud/v1/quran/quran-uthmani');
    List json = response.data["data"]["surahs"];
    List ayahs = [];
    for (Map<String, dynamic> i in json) {
      if (i["name"] == name) {
        ayahs = i["ayahs"];
      }
    }
    return ayahs;
  }

  getPrayerTime() async {
    var response = await dio.get(
        'https://api.aladhan.com/v1/timingsByCity/15-02-2024?country=egypt&city=cairo');
    Map json = response.data;
    Map<String, dynamic> prayers = json["data"]["timings"];
    return prayers;
  }

  getHesnElmuslim() async {
    var response = await dio.get(
        'https://api3.islamhouse.com/v3/paV29H2gm56kvLPy/main/get-item/2522/ar/json');
    Map json = response.data;
    return json;
  }

  getRadio() async {
    var response =
        await dio.get('https://mp3quran.net/api/v3/radios?language=ar');
    List json = response.data["radios"];
    List<RadioItem> radioItems = [];
    for (Map<String, dynamic> i in json) {
      radioItems.add(RadioItem(id: i["id"], name: i["name"], url: i["url"]));
    }
    return radioItems;
  }
}
