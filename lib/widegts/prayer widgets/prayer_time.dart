import 'package:flutter/material.dart';
import 'package:quran_app/constants/app_colors.dart';
import 'package:quran_app/services/api_services.dart';

class PrayerTime extends StatefulWidget {
  const PrayerTime({super.key});

  @override
  State<PrayerTime> createState() => _PrayerTimeState();
}

class _PrayerTimeState extends State<PrayerTime> {
  Map<String, dynamic>? prayerTiming;
  List prayerNames = ["Fajr", "Sunrise", "Dhuhr", "Asr", "Maghrib", "Isha"];

  getPrayerTiming() async {
    ApiServices apiServices = ApiServices();
    prayerTiming = await apiServices.getPrayerTime();
    setState(() {});
  }

  @override
  void initState() {
    getPrayerTiming();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return prayerTiming == null
        ? Center(
            child: CircularProgressIndicator(
            color: AppColors.darkGreen,
          ))
        : ListView.builder(
            itemCount: prayerNames.length,
            itemBuilder: (context, index) => Container(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              margin: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: AppColors.lightGreen,
                  borderRadius: BorderRadius.circular(12)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                spacing: 5,
                children: [
                  Text(
                    prayerNames[index],
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  Text(
                    prayerTiming![prayerNames[index]],
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                      onPressed: () {},
                      style: IconButton.styleFrom(
                          backgroundColor: AppColors.darkGreen,
                          foregroundColor: Colors.white),
                      icon: Icon(Icons.notifications_none))
                ],
              ),
            ),
          );
  }
}
