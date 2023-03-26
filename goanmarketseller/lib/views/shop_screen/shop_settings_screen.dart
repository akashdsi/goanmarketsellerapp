import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:goanmarketseller/const/const.dart';
import 'package:goanmarketseller/views/controllers/profile_controller.dart';
import 'package:goanmarketseller/views/widgets/custom_textfield.dart';
// import 'package:goanmarketseller/views/profile_screen/';
import '../widgets/loadingindica.dart';
import '../widgets/textstyle.dart';

class shopsettings extends StatelessWidget {
  const shopsettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ProfileController>();
    return Obx(
      () => Scaffold(
        backgroundColor: purpleColor,
        appBar: AppBar(
          backgroundColor: purpleColor,
          actions: [
            10.widthBox,
            TextButton(
                onPressed: () async {
                  controller.isLoading(true);
                  await controller.isLoading.value
                      ? LoadingIndica()
                      : controller.updateShop(
                          shopwebsite: controller.shopaddressController.text,
                          shopmobile: controller.shopmobileController.text,
                          shopaddress: controller.  shopaddressController.text,
                          shopename: controller.shopnameController.text,
                          shopdesc: controller.shopDescriptionController.text);
                  VxToast.show(context, msg: "Shop Updated");
                },
                child: normalText(text: "Save", color: white))
          ],
          automaticallyImplyLeading: false,
          title: boldText(text: "Shop Settings", color: white, size: 16.0),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            color: Colors.white,
            child: Column(
              children: [
                10.heightBox,
                CustomeTextField(
                    label: "Shop Name",
                    hint: "eg. Shopxyz",
                    controller: controller.shopnameController),
                10.heightBox,
                CustomeTextField(
                    label: "Shop Address",
                    hint: "eg. Street 123",
                    controller: controller.shopaddressController),
                10.heightBox,
                CustomeTextField(
                    label: "Mobile no.",
                    hint: "eg. 91-xxxx-xxxx",
                    controller: controller.shopmobileController),
                10.heightBox,
                CustomeTextField(
                    label: "Shop website",
                    hint: "eg. shop.com",
                    controller: controller.shopWebsiteController),
                10.heightBox,
                CustomeTextField(
                    label: "Description",
                    isDesc: true,
                    controller: controller.shopDescriptionController),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
