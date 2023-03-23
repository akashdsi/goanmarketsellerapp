import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:goanmarketseller/views/product_screen/editprofilescreen.dart';
import 'package:goanmarketseller/views/shop_screen/shop_settings_screen.dart';
import 'package:intl/intl.dart' as intl;
import '../../const/const.dart';
import '../messages_screen/message_screen.dart';
import '../widgets/textstyle.dart';

class profileScreen extends StatelessWidget {
  const profileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: purpleColor,
        actions: [
          10.widthBox,
          IconButton(
            onPressed: () {
              Get.to(()=>EditProfileScreen());
            },
            icon: Icon(Icons.edit),
          ),
          TextButton(
            onPressed: () {},
            child: normalText(text: 'Logout'),
          ),
        ],
        automaticallyImplyLeading: false,
        title: boldText(text: "Settings", color: white, size: 16.0),
      ),
      body: Column(
        children: [
          ListTile(
            leading: Image.asset(imgproduct)
                .box
                .roundedFull
                .clip(Clip.antiAlias)
                .make(),
            title: boldText(text: "Vendor name"),
            subtitle: normalText(text: "vendoremail@gmail.com"),
          ),
          Divider(),
          10.heightBox,
          Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: [

                  ListView(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    children: List.generate(
                        profilebuttontitles.length,
                            (index) => ListTile(
                          onTap: () {
                            switch(index){
                              case 0:
                                Get.to(()=>shopsettings());
                                break;
                              case 1:
                                Get.to(()=>MessagesScreen());
                            }

                          },
                          leading:Icon(profilebuttonIconslist[index]),

                          title: normalText(
                              text: profilebuttontitles[index],
                              color: fontGrey,
                              size: 14.0),


                        )),
                  )

                ],
              ))
        ],
      ),
    );
  }
}
