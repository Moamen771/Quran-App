import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/manager/cubit.dart';
import 'package:quran_app/manager/state.dart';
import 'package:quran_app/widegts/surah%20widgets/ayah_container.dart';
import '../constants/app_colors.dart';

class SurahScreen extends StatelessWidget {
  const SurahScreen({super.key, required this.surahName});

  final String surahName;

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
              surahName,
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
            child: BlocBuilder<AppCubit, AppState>(
              buildWhen: (previous, current) =>
                  current is LoadingAyahsState ||
                  current is LoadedAyahsState ||
                  current is ErrorAyahsState,
              builder: (context, state) {
                if (state is LoadedAyahsState) {
                  return ListView.builder(
                    itemCount: state.ayahs.length,
                    itemBuilder: (context, index) => AyahContainer(
                      ayah: state.ayahs[index],
                    ),
                    padding: EdgeInsets.all(10),
                  );
                } else if (state is ErrorAyahsState) {
                  return Text(state.errorMessage);
                } else if (state is LoadingAyahsState) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: AppColors.darkGreen,
                    ),
                  );
                } else {
                  return Text("Error");
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
