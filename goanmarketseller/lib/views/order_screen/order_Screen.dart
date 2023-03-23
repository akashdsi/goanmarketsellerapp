import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:goanmarketseller/views/order_screen/order_details.dart';
import 'package:intl/intl.dart' as intl;
import '../../const/const.dart';
import '../widgets/textstyle.dart';

class orderScreen extends StatelessWidget {
  const orderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,

          actions: [
            Center(
              child: normalText(
                  text: intl.DateFormat('EEE, MMM d, ' 'yy')
                      .format(DateTime.now()),
                  color: purpleColor),
            ),
            10.widthBox
          ],
          automaticallyImplyLeading: false,
          title: boldText(text: "Orders", color: darkGrey, size: 16.0),
        ),

        body: Padding(
          padding: EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: List.generate(
                  20,
                  (index) => ListTile(
                      onTap: () {
                        Get.to(()=>Orderdetails());
                      },
                      tileColor: textfieldGrey,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      title: boldText(
                          text: 'Product Title ',
                          color: purpleColor,
                          size: 14.0),
                      subtitle: Column(
                        children: [
                          Row(children: [
                            Icon(
                              Icons.calendar_today,
                              color: fontGrey,
                            ),
                            10.widthBox,
                            boldText(
                                text: intl.DateFormat()
                                    .add_yMd()
                                    .format(DateTime.now()),
                                color: fontGrey),
                            // normalText(text: "\$40.0", color: darkGrey)
                          ]),
                          Row(children: [
                            Icon(
                              Icons.payment,
                              color: fontGrey,
                            ),
                            10.widthBox,
                            boldText(
                                text: "Unpaied",color: red
                            ),
                            // normalText(text: "\$40.0", color: darkGrey)
                          ]),
                        ],

                      ),
                      trailing: boldText(text:'\$40.0',color: purpleColor,size: 16.0),
                  ).box.margin(EdgeInsets.only(bottom: 4.0)).make()
              ),
            ),

          ),
        ));
  }
}
