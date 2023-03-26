import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:goanmarketseller/services/store_services.dart';
import 'package:goanmarketseller/views/messages_screen/ChatScreen.dart';
import 'package:goanmarketseller/views/widgets/loadingindica.dart';
import 'package:intl/intl.dart' as intl;
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
      body: StreamBuilder(
        stream: StoreServices.getMessages(currentUser!.uid),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return LoadingIndica();
          } else {
            var data = snapshot.data!.docs;
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ListView(
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      children: List.generate(data.length, (index) {
                        var t = data[index]['created_on'] == null
                            ? DateTime.now()
                            : data[index]['created_on'].toDate();
                        var time = intl.DateFormat('h:mma').format(t);

                        return ListTile(
                          onTap: () {
                            Get.to(() => ChatScreen());
                          },
                          leading: const CircleAvatar(
                              backgroundColor: purpleColor,
                              child: Icon(
                                Icons.person,
                                color: Colors.white,
                              )),
                          title: boldText(
                              text: "${data[index]['sender_name']}",
                              color: fontGrey,
                              size: 14.0),
                          subtitle: normalText(
                              text: "${data[index]['last_msg']}",
                              color: darkGrey),
                          trailing: normalText(text: time, color: darkGrey),
                        );
                      }),
                    )
                  ],
                ),
              ),
            );
          }
        },
      ),
      // body: Padding(
      //   padding: const EdgeInsets.all(8.0),
      //   child: SingleChildScrollView(
      //     child: Column(
      //       children: [
      //         ListView(
      //           physics: const BouncingScrollPhysics(),
      //           shrinkWrap: true,
      //           children: List.generate(
      //               15,
      //               (index) => ListTile(
      //                     onTap: () {
      //                       Get.to(()=>ChatScreen());
      //
      //                     },
      //                     leading: CircleAvatar(
      //                         backgroundColor: purpleColor,
      //                         child: Icon(
      //                           Icons.person,
      //                           color: Colors.white,
      //                         )),
      //                     title: boldText(
      //                         text: "User Name",
      //                         color: fontGrey,
      //                         size: 14.0),
      //                 subtitle: normalText(text: "Last Message...",color: darkGrey),
      //                 trailing: normalText(text: "10:50 PM",color: darkGrey ),
      //                   )),
      //
      //         )
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
