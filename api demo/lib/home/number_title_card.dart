import 'package:apidemo/constant/constant.dart';
import 'package:apidemo/main_title.dart';
import 'package:flutter/material.dart';

import 'number_card.dart';

class NumberTitleCard extends StatelessWidget {
  const NumberTitleCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const MainTitle(
        title: 'top 10 tv shows in india',
      ),
      kHeight,
      LimitedBox(
          maxHeight: 200,
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: List.generate(10, (index) {
                    return NumberCard(index: index);
                  }))))
    ]);
  }
}
