import 'package:flutter/material.dart';
import 'package:quran_app/models/ayah.dart';
import 'package:quran_app/services/api_services.dart';
import 'package:quran_app/widegts/surah%20widgets/ayah_container.dart';
import '../constants/app_colors.dart';

class SurahScreen extends StatefulWidget {
  const SurahScreen({super.key, required this.surahName});

  final String surahName;

  @override
  State<SurahScreen> createState() => _SurahScreenState();
}

class _SurahScreenState extends State<SurahScreen> {
  List? surahAyahs;

  getSurah() async {
    ApiServices apiServices = ApiServices();
    surahAyahs = await apiServices.getSurahAyahs(widget.surahName);
    setState(() {});
  }

  @override
  void initState() {
    getSurah();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 130,
            width: double.infinity,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/muslim_img4.jpg'),
                    fit: BoxFit.fill)),
            child: Text(
              widget.surahName,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 100),
            padding: EdgeInsets.all(12),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(32),
                topRight: Radius.circular(32),
              ),
            ),
            child: surahAyahs == null
                ? Center(
                    child: CircularProgressIndicator(
                      color: AppColors.darkGreen,
                    ),
                  )
                : ListView.builder(
                    itemCount: surahAyahs!.length,
                    itemBuilder: (context, index) => AyahContainer(
                      ayah: Ayah(
                          surahName: widget.surahName,
                          text: surahAyahs![index]["text"],
                          numberInSurah: surahAyahs![index]["numberInSurah"],
                          juz: surahAyahs![index]["juz"],
                          hizbQuarter: surahAyahs![index]["hizbQuarter"],
                          hasSajda: surahAyahs![index]["sajda"]),
                    ),
                    padding: EdgeInsets.all(10),
                  ),
          )
        ],
      ),
    );
  }
}
