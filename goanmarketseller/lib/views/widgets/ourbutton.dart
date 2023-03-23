import 'package:flutter/material.dart';
import 'package:goanmarketseller/const/colors.dart';
import 'package:goanmarketseller/views/widgets/textstyle.dart';

Widget ourButton({title, color = purpleColor, onPress}) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      backgroundColor: color,
      padding: const EdgeInsets.all(12),
    ),
      onPressed: onPress, child: boldText(text: title, size: 19.0),);
}
