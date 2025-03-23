import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/manager/cubit.dart';
import 'package:quran_app/manager/state.dart';
import '../constants/app_colors.dart';
import '../widegts/quran widgets/quran_container.dart';

class QuranScreen extends StatelessWidget {
  const QuranScreen({super.key});

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
            child: BlocBuilder<AppCubit, AppState>(
              buildWhen: (previous, current) =>
                  current is LoadingSurahsState ||
                  current is LoadedSurahsState ||
                  current is ErrorSurahsState,
              builder: (context, state) {
                if (state is LoadedSurahsState) {
                  return ListView.builder(
                    itemCount: state.surahs.length,
                    itemBuilder: (context, index) => QuranContainer(
                      surah: state.surahs[index],
                    ),
                    padding: EdgeInsets.all(10),
                  );
                } else if (state is ErrorSurahsState) {
                  return Text(state.errorMessage);
                } else if (state is LoadingSurahsState) {
                  return Center(
                      child: CircularProgressIndicator(
                    color: AppColors.darkGreen,
                  ));
                } else {
                  return SizedBox.shrink();
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
