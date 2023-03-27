import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:goanmarketseller/views/controllers/productscontroller.dart';
import 'package:goanmarketseller/views/product_screen/productdropdown.dart';
import 'package:goanmarketseller/views/product_screen/productimages.dart';

import '../../const/const.dart';
import '../widgets/custom_textfield.dart';
import '../widgets/textstyle.dart';

class Addproduct extends StatelessWidget {
  const Addproduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<Productscontroller>();
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
          TextButton(
              onPressed: () {},
              child: boldText(text: "Save", color: purpleColor))
        ],
        title: boldText(text: "Product Title ", color: fontGrey, size: 16.0),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomeTextField(hint: 'eg', label: 'product name'),
              10.heightBox,
              CustomeTextField(hint: 'eg', label: 'product name'),
              10.heightBox,
              CustomeTextField(hint: 'eg', label: 'product name'),
              10.heightBox,
              CustomeTextField(hint: 'eg', label: 'product name'),
              10.heightBox,
              productDropdown(),
              10.heightBox,
              productDropdown(),
              10.heightBox,
              const Divider(
                color: Colors.black,
              ),
              boldText(text: "choose products images"),
              10.heightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(
                    3, (index) => productImage(label: "${index + 1}")),
              ),
              5.heightBox,
              normalText(text: "First image will be your display image ",color: lightGrey),
              const Divider(color: Colors.white,),
              10.heightBox,
              boldText(text: "choose products colors"),
              10.heightBox,
              Wrap(
                spacing: 8.0,
                runSpacing : 8.0,
                children: List.generate(
                  9,
                      (index) => Stack(
                        alignment: Alignment.center,
                        children: [VxBox()
                            .color(Vx.randomPrimaryColor)
                            .roundedFull
                            .size(50, 50)
                            .make(),
                        const Icon(Icons.done,color: Colors.white,)]
                      ),
                ),
              )


            ],
          ),
        ),
      ),
    );
  }
}
