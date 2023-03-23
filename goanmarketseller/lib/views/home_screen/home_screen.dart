import 'package:flutter/cupertino.dart';
import 'package:goanmarketseller/views/widgets/textstyle.dart';
import 'package:intl/intl.dart' as intl;
import '../../const/const.dart';
import '../widgets/dashboard_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Center(
            child: normalText(
                text:
                    intl.DateFormat('EEE, MMM d, ' 'yy').format(DateTime.now()),
                color: purpleColor),
          ),
          10.widthBox
        ],
        automaticallyImplyLeading: false,
        title: boldText(text: dashboard, color: darkGrey, size: 16.0),
      ),
      body: Padding(
        padding: const EdgeInsets.all(9.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                dashboardbutton(context,
                    title: "Products", count: "60", Icons: icproducts),
                dashboardbutton(context,
                    title: "Orders", count: "15", Icons: icorders),
              ],
            ),
            10.heightBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                dashboardbutton(context,
                    title: "Total Sales", count: "60", Icons: icorders),
                dashboardbutton(context,
                    title: "Rating", count: "15", Icons: icstar),
              ],
            ),
            10.heightBox,
            const Divider(),
            10.heightBox,
            boldText(
              text: "Popular products",
              color: darkGrey,
              size: 16.0,
            ),
            20.heightBox,
            ListView(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              children: List.generate(
                  3,
                  (index) => ListTile(

                    onTap: (){

                    },
                        leading: Image.asset(
                          imgproduct,
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                    title: boldText(text: 'Product Title ',color: fontGrey,size: 14.0),
                    subtitle: normalText(text: "\$40.0",color: darkGrey),
                      )),
            )
          ],
        ),
      ),
    );
  }
}
