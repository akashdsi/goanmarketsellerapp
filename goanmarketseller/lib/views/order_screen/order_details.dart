import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:goanmarketseller/views/order_screen/components/order_place.dart';

import '../../const/const.dart';
import '../widgets/ourbutton.dart';
import '../widgets/textstyle.dart';

class Orderdetails extends StatelessWidget {
  const Orderdetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: fontGrey),
          onPressed: () {
            Get.back();
          },
        ),
        backgroundColor: Colors.white,
        actions: [
          10.widthBox,
        ],
        title: boldText(text: "Order Detials", color: fontGrey, size: 16.0),
      ),
      bottomNavigationBar: SizedBox(
        height: 60,
        width: context.screenWidth,
        child: ourButton(
          color: green,
          onPress: () {},
          title: "Confirm Order",
        ),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  //order detivery status section
                  Visibility(
                    visible: false,
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      boldText(
                          text: "Order status:",
                          color: purpleColor,
                          size: 16.0),
                      SwitchListTile(
                        activeColor: Colors.green,
                        value: false,
                        onChanged: (value) {},
                        title: boldText(text: "Placed", color: fontGrey),
                      ),
                      SwitchListTile(
                        activeColor: Colors.green,
                        value: false,
                        onChanged: (value) {},
                        title: boldText(text: "Confirmed", color: fontGrey),
                      ),
                      SwitchListTile(
                        activeColor: Colors.green,
                        value: false,
                        onChanged: (value) {},
                        title: boldText(text: "on Delivery ", color: fontGrey),
                      ),
                      SwitchListTile(
                        activeColor: Colors.green,
                        value: false,
                        onChanged: (value) {},
                        title: boldText(text: "Delivered", color: fontGrey),
                      ),
                    ],
                  )
                          .box
                          .padding(EdgeInsets.all(8))
                          .outerShadowMd
                          .white
                          .border(color: lightGrey)
                          .roundedSM
                          .make()),

                  //order details section
                  orderPlaceDetials(
                      d1: "data['order_code']",
                      d2: "data['shipping method']",
                      title1: "order code",
                      title2: "shipping method"),
                  orderPlaceDetials(
                      d1: DateTime.now(),
                      d2: "data['payment method']",
                      title1: "order date",
                      title2: "payment method"),
                  orderPlaceDetials(
                      d1: "Unpaid",
                      d2: "order placed ",
                      title1: "paymentstatus",
                      title2: "deliverystatus"),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            boldText(
                                text: "Shipping Address", color: purpleColor),
                            "{data['orderbyname']}".text.make(),
                            "{data['orderbyemail']}".text.make(),
                            "{data['orderbyaddress']}".text.make(),
                            "{data['orderbycity']}".text.make(),
                            "{data['orderbystate']}".text.make(),
                            "{data['orderbyphhone']}".text.make(),
                            "{data['orderbypostalcode']}".text.make(),
                          ],
                        ),
                        SizedBox(
                          width: 130,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              boldText(
                                  text: "Total Amount ", color: purpleColor),
                              boldText(text: "\$300", color: red),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              )
                  .box
                  .outerShadowMd
                  .white
                  .border(color: lightGrey)
                  .roundedSM
                  .make(),
            ),
          ),
          const Divider(),
          10.heightBox,
          boldText(text: "Ordered Products", color: fontGrey, size: 16.0),
          10.heightBox,
          ListView(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: List.generate(3, (index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  orderPlaceDetials(
                      title1: "data['orders'][index]['title']",
                      title2: "data['orders'][index]['tprice']",
                      d1: "{data['orders'][index]['qty']}x",
                      d2: "Refundable"),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Container(
                      width: 30,
                      height: 20,
                      color: purpleColor,
                    ),
                  ),
                  const Divider(),
                ],
              );
            }).toList(),
          )
              .box
              .outerShadowMd
              .white
              .margin(const EdgeInsets.only(bottom: 4))
              .make(),
          20.heightBox
        ]),
      ),
    );
  }
}
