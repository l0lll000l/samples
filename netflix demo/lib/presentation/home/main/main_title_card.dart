// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:netflix/core/constants.dart';
// import 'package:netflix/main_title.dart';
// import 'package:netflix/presentation/home/main_card.dart';

// class MainTitleCard extends StatelessWidget {
//   final String Title;
//   const MainTitleCard({
//     super.key,
//     required this.Title,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         MainTitle(
//           title: Title,
//         ),
//         kHeight,
//         LimitedBox(
//           maxHeight: 200,
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: ListView(
//               scrollDirection: Axis.horizontal,
//               children: List.generate(10, (index) {
//                 return const MainCard1();
//               }),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
