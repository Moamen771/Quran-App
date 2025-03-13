import 'package:flutter/material.dart';
import 'package:quran_app/models/surah.dart';
import 'package:quran_app/services/api_services.dart';
import '../constants/app_colors.dart';
import '../widegts/quran widgets/quran_container.dart';

class QuranScreen extends StatefulWidget {
  const QuranScreen({super.key});

  @override
  State<QuranScreen> createState() => _QuranScreenState();
}

class _QuranScreenState extends State<QuranScreen> {
  List<Surah>? surahs;

  getSurahs() async {
    ApiServices apiServices = ApiServices();
    surahs = await apiServices.getSurahName();
    setState(() {});
  }

  @override
  void initState() {
    getSurahs();
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
                    image: AssetImage('assets/muslim_img3.jpg'),
                    fit: BoxFit.fill)),
            child: Text(
              'السور القرأنية',
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
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(32),
                  topRight: Radius.circular(32),
                )),
            child: surahs == null
                ? Center(
                    child: CircularProgressIndicator(
                    color: AppColors.darkGreen,
                  ))
                : ListView.builder(
                    itemCount: surahs!.length,
                    itemBuilder: (context, index) => QuranContainer(
                      surah: surahs![index],
                    ),
                    padding: EdgeInsets.all(10),
                  ),
          )
        ],
      ),
    );
  }
}
