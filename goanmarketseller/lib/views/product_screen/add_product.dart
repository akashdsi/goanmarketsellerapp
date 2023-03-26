import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../const/const.dart';
import '../widgets/custom_textfield.dart';
import '../widgets/textstyle.dart';

class Addproduct extends StatelessWidget {
  const Addproduct({Key? key}) : super(key: key);

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
          TextButton(onPressed: (){}, child: boldText(text: "Save",color: purpleColor ))
        ],

        title: boldText(text: "Product Title ", color: fontGrey, size: 16.0),

      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [CustomeTextField(
            hint: "eg. BMW",
            label: "Product name",

          )],
        ),
      ),
    );
  }
}
