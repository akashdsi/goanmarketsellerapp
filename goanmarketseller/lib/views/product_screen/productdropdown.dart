import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:goanmarketseller/const/const.dart';
import 'package:goanmarketseller/views/widgets/textstyle.dart';

Widget productDropdown() {
  return DropdownButtonHideUnderline(
          child: DropdownButton<String>(
              value: null,hint: normalText(text: "choose category",color: fontGrey), isExpanded: true, items: [], onChanged: (value) {}))
      .box.padding(const EdgeInsets.symmetric(horizontal: 4))
      .roundedSM
      .white
      .make();
}
