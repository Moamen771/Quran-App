import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/constants/app_colors.dart';
import 'package:quran_app/manager/cubit.dart';
import 'package:quran_app/manager/state.dart';

class PrayerTime extends StatelessWidget {
  const PrayerTime({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      buildWhen: (previous, current) =>
          current is LoadingPrayerState ||
          current is LoadedPrayerState ||
          current is ErrorPrayerState,
      builder: (context, state) {
        if (state is LoadedPrayerState) {
          return ListView.builder(
            itemCount: state.prayers!.length,
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
                    state.prayers![index].name,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  Text(
                    state.prayers![index].time,
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
        } else if (state is ErrorPrayerState) {
          return Text(state.errorMessage);
        } else if (state is LoadingPrayerState) {
          return Center(
              child: CircularProgressIndicator(
            color: AppColors.darkGreen,
          ));
        } else {
          return SizedBox.shrink();
        }
      },
    );
  }
}

// ? Center(
//             child: CircularProgressIndicator(
//             color: AppColors.darkGreen,
//           ))
//         : ListView.builder(
//             itemCount: prayerNames.length,
//             itemBuilder: (context, index) => Container(
//               padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
//               margin: EdgeInsets.all(8),
//               decoration: BoxDecoration(
//                   color: AppColors.lightGreen,
//                   borderRadius: BorderRadius.circular(12)),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 spacing: 5,
//                 children: [
//                   Text(
//                     prayerNames[index],
//                     style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//                   ),
//                   Spacer(),
//                   Text(
//                     prayerTiming![prayerNames[index]],
//                     style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//                   ),
//                   IconButton(
//                       onPressed: () {},
//                       style: IconButton.styleFrom(
//                           backgroundColor: AppColors.darkGreen,
//                           foregroundColor: Colors.white),
//                       icon: Icon(Icons.notifications_none))
//                 ],
//               ),
//             ),
//           );
