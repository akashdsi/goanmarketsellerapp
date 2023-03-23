import 'package:goanmarketseller/const/const.dart';
import 'package:goanmarketseller/views/widgets/custom_textfield.dart';

import '../widgets/textstyle.dart';

class shopsettings extends StatelessWidget {
  const shopsettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: purpleColor,
      appBar: AppBar(
        backgroundColor: purpleColor,
        actions: [
          10.widthBox,
          TextButton(
              onPressed: () {}, child: normalText(text: "Save", color: white))
        ],
        automaticallyImplyLeading: false,
        title: boldText(text: "Shop Settings", color: white, size: 16.0),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          color: Colors.white,
          child: Column(
            children: [ 10.heightBox,
              CustomeTextField(label: "Shop Name", hint: "eg. Shopxyz"),
              10.heightBox,
              CustomeTextField(label: "Shop Address", hint: "eg. Street 123"),
              10.heightBox,
              CustomeTextField(label: "Mobile no.", hint: "eg. 91-xxxx-xxxx"),
              10.heightBox,
              CustomeTextField(label: "Shop website", hint: "eg. shop.com"),
              10.heightBox,
              CustomeTextField(label: "Description",isDesc: true),
            ],
          ),
        ),
      ),
    );
  }
}
