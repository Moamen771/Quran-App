import 'package:flutter/material.dart';
import 'package:quran_app/services/api_services.dart';
import 'package:quran_app/widegts/radio%20widgets/radio_item_container.dart';

import '../constants/app_colors.dart';

class RadioScreen extends StatefulWidget {
  const RadioScreen({super.key});

  @override
  State<RadioScreen> createState() => _RadioScreenState();
}

class _RadioScreenState extends State<RadioScreen> {
  List? radioItem;

  getRadioItems() async {
    ApiServices apiServices = ApiServices();
    radioItem = await apiServices.getRadio();
    setState(() {});
  }

  @override
  void initState() {
    getRadioItems();

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
                    image: AssetImage('assets/muslim_img2.jpg'),
                    fit: BoxFit.fill)),
            child: Text(
              'الراديو',
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
              ),
            ),
            child: radioItem == null
                ? Center(
                    child: CircularProgressIndicator(
                      color: AppColors.darkGreen,
                    ),
                  )
                : ListView.builder(
                    itemCount: radioItem!.length,
                    itemBuilder: (context, index) => RadioItemContainer(
                      radioItem: radioItem![index],
                    ),
                    padding: EdgeInsets.all(10),
                  ),
          )
        ],
      ),
    );
  }
}
