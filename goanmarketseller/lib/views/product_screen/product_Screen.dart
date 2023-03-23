import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:goanmarketseller/views/product_screen/product_detials.dart';
import 'package:intl/intl.dart' as intl;
import '../../const/const.dart';
import '../widgets/textstyle.dart';
import 'add_product.dart';

class productsScreen extends StatelessWidget {
  const productsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: purpleColor,
          onPressed: () {
            Get.to(()=>Addproduct());
          },
          child: Icon(
            Icons.add,
          ),
        ),
        appBar: AppBar(
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
          title: boldText(text: "Products", color: darkGrey, size: 16.0),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(children: [
              ListView(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                children: List.generate(
                    20,
                    (index) => ListTile(
                          onTap: () {
                            Get.to(() => ProductDetails());
                          },
                          leading: Image.asset(
                            imgproduct,
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                          title: boldText(
                              text: 'Product Title ',
                              color: fontGrey,
                              size: 14.0),
                          subtitle: normalText(text: "\$40.0", color: darkGrey),
                          trailing: VxPopupMenu(
                            child: Icon(Icons.more_vert_rounded),
                            menuBuilder: () => Column(
                              children: [
                                ListView(
                                  physics: const BouncingScrollPhysics(),
                                  shrinkWrap: true,
                                  children: List.generate(
                                    popupmenutitles.length,
                                    (index) => Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          Icon(popupmenuIconslist[index]),
                                          10.widthBox,
                                          normalText(text: popupmenutitles[index],color: darkGrey,),
                                        ],
                                      ).onTap(() { }),
                                    ),
                                  ),
                                ),
                              ],
                            ).box.white.width(200).rounded.make(),
                            clickType: VxClickType.singleClick,
                          ),
                        )),
              ),
            ]),
          ),
        ));
  }
}
