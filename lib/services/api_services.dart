import 'package:dio/dio.dart';

class ApiServices {
  final Dio dio = Dio();

  getSurahName() async {
    var response = await dio.get('https://api.alquran.cloud/v1/surah');
    return response;
  }

  getSurah() async {
    var response =
        await dio.get('https://api.alquran.cloud/v1/quran/quran-uthmani');
    return response;
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
}
