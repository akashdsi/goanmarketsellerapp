import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:goanmarketseller/views/messages_screen/ChatScreen.dart';

import '../../const/const.dart';
import '../shop_screen/shop_settings_screen.dart';
import '../widgets/textstyle.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: purpleColor,
        actions: [
          10.widthBox,
          TextButton(
              onPressed: () {}, child: normalText(text: "Save", color: white))
        ],
        title: boldText(text: "Messages ", color: white, size: 16.0),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListView(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                children: List.generate(
                    15,
                    (index) => ListTile(
                          onTap: () {
                            Get.to(()=>ChatScreen());

                          },
                          leading: CircleAvatar(
                              backgroundColor: purpleColor,
                              child: Icon(
                                Icons.person,
                                color: Colors.white,
                              )),
                          title: boldText(
                              text: "User Name",
                              color: fontGrey,
                              size: 14.0),
                      subtitle: normalText(text: "Last Message...",color: darkGrey),
                      trailing: normalText(text: "10:50 PM",color: darkGrey ),
                        )),

              )
            ],
          ),
        ),
      ),
    );
  }
}
