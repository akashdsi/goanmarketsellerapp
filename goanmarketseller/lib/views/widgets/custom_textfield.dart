import 'package:goanmarketseller/const/const.dart';
import 'package:goanmarketseller/views/widgets/textstyle.dart';

Widget CustomeTextField({label, hint, controller,isDesc = false}) {
  return TextFormField(
    style: TextStyle(color: Colors.black),
    maxLines: isDesc ? 4:1,

    decoration: InputDecoration(
      label: normalText(text: label, color: fontGrey),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.black)),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.black)),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.black)),
      hintText: hint,

    ),
  );
}
