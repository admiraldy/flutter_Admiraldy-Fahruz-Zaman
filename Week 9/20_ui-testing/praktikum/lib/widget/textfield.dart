import 'package:flutter/material.dart';
import 'package:praktikum/style.dart';

class TextFieldWidget extends StatelessWidget {
  final TextEditingController textController;
  final String textLabel;
  final String textHint;

  const TextFieldWidget({
    required this.textController,
    required this.textLabel,
    required this.textHint,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      padding: const EdgeInsets.symmetric(horizontal: 17),
      child: TextField(
        controller: textController,
        decoration: InputDecoration(
          hintStyle: TextAppStyle().m3bodylarge,
          hintText: textHint,
          labelStyle: TextAppStyle().m3bodysmall,
          labelText: textLabel,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          filled: true,
          fillColor: AppColor().surfaceVariant,
        ),
      ),
    );
  }
}
