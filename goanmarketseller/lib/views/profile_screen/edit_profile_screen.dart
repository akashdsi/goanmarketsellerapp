import 'dart:io';

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:goanmarketseller/views/controllers/profile_controller.dart';
import 'package:goanmarketseller/views/widgets/loadingindica.dart';

import '../../const/const.dart';
import '../widgets/custom_textfield.dart';
import '../widgets/textstyle.dart';

class Editeprofilescreen extends StatefulWidget {
  final String? username;
  const Editeprofilescreen({Key? key, this.username}) : super(key: key);

  @override
  State<Editeprofilescreen> createState() => _EditeprofilescreenState();
}

class _EditeprofilescreenState extends State<Editeprofilescreen> {
  var controller = Get.find<ProfileController>();
  void initState() {
    controller.nameController.text = widget.username!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: purpleColor,
        appBar: AppBar(
          backgroundColor: purpleColor,
          actions: [
            controller.isLoading.value
                ? LoadingIndica(circlecolor: Colors.black)
                : TextButton(
                    onPressed: () async {
                      controller.isLoading(true);

                      // if image is not selected
                      if (controller.profileImgPath.value.isNotEmpty) {
                        await controller.uploadProfileImage();
                      } else {
                        controller.profileImageLink =
                            controller.snapshotData['imageUrl'];
                      }
                      if (controller.snapshotData['password'] ==
                          controller.oldpassController.text) {
                        await controller.changeAuthPassword(
                          email: controller.snapshotData['email'],
                          password: controller.oldpassController.text,
                          newpassword: controller.newpassController.text,
                        );
                        await controller.updateProfile(
                          imgUrl: controller.profileImageLink,
                          name: controller.nameController.text,
                          password: controller.newpassController.text,
                        );
                        VxToast.show(context, msg: "Updated");
                      } else if (controller
                              .oldpassController.text.isEmptyOrNull &&
                          controller.newpassController.text.isEmptyOrNull) {
                        await controller.updateProfile(
                          imgUrl: controller.profileImageLink,
                          name: controller.nameController.text,
                          password: controller.snapshotData['password']);

                        VxToast.show(context, msg: "Updated");

                      } else {
                        VxToast.show(context, msg: "Some error occured");
                        controller.isLoading(false);
                      }
                    },
                    child: normalText(text: "Save"))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              controller.snapshotData['imageUrl'] == "" &&
                      controller.profileImgPath.isEmpty
                  ? Image.asset(imgproduct, width: 100, fit: BoxFit.cover)
                      .box
                      .roundedFull
                      .clip(Clip.antiAlias)
                      .make()
                  : controller.snapshotData['imageUrl'] != '' &&
                          controller.profileImgPath.isEmpty
                      ? Image.network(
                          controller.snapshotData['imageUrl'],
                          width: 100,
                          fit: BoxFit.cover,
                        ).box.roundedFull.clip(Clip.antiAlias).make()
                      : Image.file(
                          File(controller.profileImgPath.value),
                          width: 100,
                          fit: BoxFit.cover,
                        ).box.roundedFull.clip(Clip.antiAlias).make(),
              10.heightBox,
              ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: white),
                  onPressed: () {
                    controller.changeImage(context);
                  },
                  child: normalText(text: "Change Image", color: fontGrey)),
              10.heightBox,
              const Divider(
                color: white,
              ),
              10.heightBox,
              CustomeTextField(
                  label: "Name",
                  hint: "eg.XYZ A ",
                  controller: controller.nameController),
              30.heightBox,
              Align(
                  alignment: Alignment.centerLeft,
                  child: boldText(text: "Change your password")),
              10.heightBox,
              CustomeTextField(
                  label: "Password",
                  hint: passwordhint,
                  controller: controller.oldpassController),
              10.heightBox,
              CustomeTextField(
                  label: "Confirm Password ",
                  hint: passwordhint,
                  controller: controller.newpassController),
            ],
          ),
        ),
      ),
    );
  }
}
