import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:goanmarketseller/views/controllers/productscontroller.dart';
import 'package:goanmarketseller/views/product_screen/productdropdown.dart';
import 'package:goanmarketseller/views/product_screen/productimages.dart';
import 'package:goanmarketseller/views/widgets/loadingindica.dart';

import '../../const/const.dart';
import '../widgets/custom_textfield.dart';
import '../widgets/textstyle.dart';

class Addproduct extends StatelessWidget {
  const Addproduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<Productscontroller>();
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: fontGrey),
            onPressed: () {
              Get.back();
            },
          ),
          backgroundColor: Colors.white,
          title: boldText(text: "Add Products", size: 16.0),
          actions: [
            10.widthBox,
            controller.isLoading.value ? LoadingIndica(circlecolor: Colors.black) :

            TextButton(
                onPressed: () async {
                  controller.isLoading(true);
                  await controller.uploadImage();
                  await controller.uplaodProduct(context);
                  Get.back();
                },
                child: boldText(text: "Save", color: purpleColor)),
          ],

        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomeTextField(
                    hint: 'eg Mangoes',
                    label: 'Product Name',
                    controller: controller.pnameController),
                10.heightBox,
                CustomeTextField(
                    hint: 'eg This is the product that will .....',
                    label: 'Description',
                    isDesc: true,
                    controller: controller.pdescController),
                10.heightBox,
                CustomeTextField(
                    hint: 'eg \$12',
                    label: 'Price',
                    controller: controller.ppriceController),
                10.heightBox,
                CustomeTextField(
                    hint: 'eg 20',
                    label: 'Quantity',
                    controller: controller.pquantityController),
                10.heightBox,
                productDropdown("category", controller.categoryList,
                    controller.categoryvalue, controller),
                10.heightBox,
                productDropdown("SubCategory", controller.subCategoryList,
                    controller.subcategoryvalue, controller),
                10.heightBox,
                const Divider(
                  color: Colors.black,
                ),
                boldText(text: "choose products images"),
                10.heightBox,
                Obx(
                  () => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: List.generate(
                        3,
                        (index) => controller.pImagesList[index] != null
                            ? Image.file(
                                controller.pImagesList[index],
                                width: 100,
                              ).onTap(() {
                                controller.pickImage(index, context);
                              })
                            : productImage(label: "${index + 1}").onTap(() {
                                controller.pickImage(index, context);
                              })),
                  ),
                ),
                5.heightBox,
                normalText(
                    text: "First image will be your display image ",
                    color: lightGrey),
                const Divider(
                  color: Colors.white,
                ),
                10.heightBox,
                boldText(text: "choose products colors"),
                10.heightBox,
                Obx(
                  () => Wrap(
                    spacing: 8.0,
                    runSpacing: 8.0,
                    children: List.generate(
                      9,
                      (index) => Stack(alignment: Alignment.center, children: [
                        VxBox()
                            .color(Vx.randomPrimaryColor)
                            .roundedFull
                            .size(50, 50)
                            .make()
                            .onTap(() {
                          controller.selectedColorIndex.value = index;
                        }),
                        controller.selectedColorIndex.value == index
                            ? const Icon(
                                Icons.done,
                                color: Colors.white,
                              )
                            : const SizedBox(),
                      ]),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
