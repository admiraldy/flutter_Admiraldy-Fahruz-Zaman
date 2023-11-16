import 'package:flutter/material.dart';
import 'package:praktikum/style.dart';

class ButtonWidget extends StatelessWidget {
  final String titleText;
  final Function()? onPressed;

  const ButtonWidget({
    required this.titleText,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 21),
          child: ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColor().lightPrimary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: Text(titleText, style: TextAppStyle().m3labelLarge),
          ),
        ),
      ],
    );
  }
}
