import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:goanmarketseller/views/controllers/auth_controller.dart';
import 'package:goanmarketseller/views/home_screen/home.dart';
import 'package:goanmarketseller/views/widgets/textstyle.dart';
import 'package:loading_indicator/loading_indicator.dart';

import '../../const/const.dart';
import 'package:goanmarketseller/views/widgets/ourbutton.dart';

import '../widgets/loadingindica.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AuthController());

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: purpleColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              30.heightBox,
              normalText(text: welcome, size: 18.0),
              20.heightBox,
              Row(
                children: [
                  Image.asset(
                    iclogo,
                    width: 80,
                    height: 80,
                  )
                      .box
                      .border(color: Colors.white)
                      .rounded
                      .padding(EdgeInsets.all(8))
                      .make(),
                  10.widthBox,
                  boldText(text: appname, size: 18.0),
                ],
              ),
              60.heightBox,
              normalText(
                  text: "Login in to your account",
                  size: 18.0,
                  color: lightGrey),
              10.heightBox,
              Container(
                color: Colors.white,
                child: Obx(
                  () => Column(
                    children: [
                      TextFormField(
                        controller: controller.emailController,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.email, color: purpleColor),
                          border: InputBorder.none,
                          hintText: emailhint,
                        ),
                      ),
                      10.heightBox,
                      TextFormField(
                        controller: controller.passwordController,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.lock, color: purpleColor),
                          border: InputBorder.none,
                          hintText: passwordhint,
                        ),
                      ),
                      30.heightBox,
                      SizedBox(
                        width: context.screenWidth - 100,
                        child: controller.isLoading.value
                            ? LoadingIndica(circlecolor: purpleColor)
                            : ourButton(
                                color: purpleColor,
                                title: login,
                                onPress: () async {
                                //   controller.isLoading(true);
                                //   await controller
                                //       .loginMethod(context: context)
                                //       .then((value) {
                                //     if (value != null) {
                                //       VxToast.show(context, msg: "loggedin");
                                //       controller.isLoading(false);
                                //       Get.offAll(() => const Home());
                                //     } else {
                                //       controller.isLoading(false);
                                //     }
                                //   });
                                  Get.to(()=>Home());
                                }).box.width(context.screenWidth - 50).make(),
                      ),
                      Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                              onPressed: () {},
                              child: normalText(
                                  text: forgotPassword, color: purpleColor))),
                      5.heightBox,
                    ],
                  ),
                ),
              ),
              10.heightBox,
              Center(child: normalText(text: anyProblem, color: lightGrey)),
              const Spacer(),
              Center(child: boldText(text: "GoanMarket")),
              20.heightBox,
            ],
          ),
        ),
      ),
    );
  }
}
