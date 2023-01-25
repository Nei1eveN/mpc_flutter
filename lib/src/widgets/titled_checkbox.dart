import 'package:flutter/material.dart';
import 'package:mpc_flutter/generated/assets/colors.gen.dart';

class TitledCheckbox extends StatelessWidget {
  final String title;
  final double fontSize;
  final FontWeight? fontWeight;

  final bool checkboxValue;
  final ValueChanged<bool?>? onChanged;

  const TitledCheckbox({
    super.key,
    required this.title,
    this.fontSize = 16.0,
    this.fontWeight,
    this.checkboxValue = true,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: fontWeight,
            color: Colors.black.withOpacity(0.6),
          ),
        ),
        SizedBox(
          width: 20.0,
          height: 20.0,
          child: Checkbox(
            value: checkboxValue,
            onChanged: onChanged,
            activeColor: ColorName.green,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(2.0),
            ),
          ),
        ),
      ],
    );
  }
}
