import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/manager/cubit.dart';
import 'package:quran_app/manager/state.dart';
import 'package:quran_app/widegts/radio%20widgets/radio_item_container.dart';
import '../constants/app_colors.dart';

class RadioScreen extends StatelessWidget {
  const RadioScreen({super.key});

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
            child: BlocBuilder<AppCubit, AppState>(
              buildWhen: (previous, current) =>
                  current is LoadingRadioState ||
                  current is LoadedRadioState ||
                  current is ErrorRadioState,
              builder: (context, state) {
                if (state is LoadedRadioState) {
                  return ListView.builder(
                    itemCount: state.radioItems.length,
                    itemBuilder: (context, index) => RadioItemContainer(
                      radioItem: state.radioItems[index],
                    ),
                    padding: EdgeInsets.all(10),
                  );
                } else if (state is ErrorRadioState) {
                  return Text(state.errorMessage);
                } else if (state is LoadingRadioState) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: AppColors.darkGreen,
                    ),
                  );
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

//Scaffold(
//         body: Stack(
//           children: [
//             Container(
//               height: 130,
//               width: double.infinity,
//               alignment: Alignment.center,
//               decoration: BoxDecoration(
//                   image: DecorationImage(
//                       image: AssetImage('assets/muslim_img2.jpg'),
//                       fit: BoxFit.fill)),
//               child: Text(
//                 'الراديو',
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontWeight: FontWeight.bold,
//                   fontSize: 30,
//                 ),
//               ),
//             ),
//             Container(
//               margin: EdgeInsets.only(top: 100),
//               padding: EdgeInsets.all(12),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(32),
//                   topRight: Radius.circular(32),
//                 ),
//               ),
//               child: radioItem == null
//                   ? Center(
//                       child: CircularProgressIndicator(
//                         color: AppColors.darkGreen,
//                       ),
//                     )
//                   : ListView.builder(
//                       itemCount: radioItem!.length,
//                       itemBuilder: (context, index) => RadioItemContainer(
//                         radioItem: radioItem![index],
//                       ),
//                       padding: EdgeInsets.all(10),
//                     ),
//             )
//           ],
//         ),
//       ),
