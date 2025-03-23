import 'package:dio/dio.dart';
import 'package:quran_app/models/ayah.dart';
import 'package:quran_app/models/prayer.dart';
import 'package:quran_app/models/radio_item.dart';
import 'package:quran_app/models/surahs.dart';

class ApiServices {
  final Dio dio = Dio();

  Future<List<Surahs>> getSurahName() async {
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

  Future<List<Ayah>> getSurahAyahs(String name) async {
    var response =
        await dio.get('https://api.alquran.cloud/v1/quran/quran-uthmani');
    List json = response.data["data"]["surahs"];
    List<Ayah> ayahs = [];
    for (Map<String, dynamic> i in json) {
      if (i["name"] == name) {
        for (var j in i["ayahs"]) {
          ayahs.add(Ayah(
              surahName: name,
              text: j["text"],
              numberInSurah: j["numberInSurah"],
              juz: j["juz"],
              hizbQuarter: j["hizbQuarter"],
              hasSajda: j["hasSajda"]));
        }
      }
    }
    return ayahs;
  }

  Future<List<Prayer>> getPrayerTime() async {
    var response = await dio.get(
        'https://api.aladhan.com/v1/timingsByCity/15-02-2024?country=egypt&city=cairo');
    Map<String, dynamic> json = response.data["data"]["timings"];
    List<Prayer> prayers = [];

    for (var i in json.keys) {
      prayers.add(Prayer(name: i, time: json[i]));
    }

    return prayers;
  }

  // getHesnElmuslim() async {
  //   var response = await dio.get(
  //       'https://api3.islamhouse.com/v3/paV29H2gm56kvLPy/main/get-item/2522/ar/json');
  //   Map json = response.data;
  //   return json;
  // }

  Future<List<RadioItem>> getRadio() async {
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
