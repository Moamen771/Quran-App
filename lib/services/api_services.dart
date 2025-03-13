import 'package:dio/dio.dart';
import 'package:quran_app/models/surah.dart';

class ApiServices {
  final Dio dio = Dio();

  getSurahName() async {
    var response = await dio.get('https://api.alquran.cloud/v1/surah');
    List json = response.data["data"];
    List<Surah> surahs = [];
    for (Map<String, dynamic> i in json) {
      surahs.add(Surah(
          arName: i["name"],
          enName: i["englishName"],
          revelationType: i["revelationType"],
          numberOfAyahs: i["numberOfAyahs"]));
    }
    return surahs;
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

main() async {
  ApiServices apiServices = ApiServices();
  print(await apiServices.getSurahName());
}
//getGeneralNews() async {
//     var response = await dio.get(
//         "https://newsapi.org/v2/top-headlines?category=general&apiKey=e8c60ff2a3f1432691182a739600404d");
//     Map json = response.data;
//     List<Article> articles = [];
//     for (var i in json["articles"]) {
//       articles.add(Article(
//           name: i["title"],
//           description: i["description"],
//           imageUrl: i["urlToImage"]));
//     }
//     return articles;
//   }
