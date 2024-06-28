import 'package:flutter/material.dart';
import 'package:flutter_application_1/Common/widgets/customShapes/circular_container.dart';
import 'package:flutter_application_1/Utils/Helpers/helper_functions.dart';

class TchoiceChip extends StatelessWidget {
  const TchoiceChip({
    super.key,
    required this.text,
    required this.selected,
    this.onselected,
  });
  final String text;
  final bool selected;
  final void Function(bool)? onselected;
  @override
  Widget build(BuildContext context) {
    final iscolor = THelperFunctions.getColor(text) != null;
    return ChoiceChip(
        label: iscolor ? const SizedBox() : Text(text),
        selected: selected,
        onSelected: onselected,
        labelStyle: TextStyle(color: selected ? Colors.white : null),
        avatar: iscolor
            ? TCircularContainer(
                width: 50,
                height: 50,
                backgroundColor: THelperFunctions.getColor(text)!,
              )
            : null,
        labelPadding: iscolor ? const EdgeInsets.all(0) : null,
        padding: iscolor ? const EdgeInsets.all(0) : null,
        shape: iscolor ? const CircleBorder(eccentricity: 0) : null,
        backgroundColor: iscolor ? THelperFunctions.getColor(text)! : null);
  }
}
