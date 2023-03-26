
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:goanmarketseller/const/colors.dart';

Widget LoadingIndica({circlecolor = purpleColor}){
  return  Center(
    child:CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation(circlecolor),
    ),
  );
}