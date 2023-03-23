import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../const/const.dart';
import '../widgets/textstyle.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({Key? key}) : super(key: key);

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
        ],
        title: boldText(text: "Product Title ", color: fontGrey, size: 16.0),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            VxSwiper.builder(
              autoPlay: true,
              height: 350,
              itemCount: 3,
              aspectRatio: 16 / 9,
              viewportFraction: 1.0,
              itemBuilder: (context, index) {
                return Image.asset(
                  imgproduct,
                  width: double.infinity,
                  fit: BoxFit.cover,
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  boldText(text: "products title", color: fontGrey, size: 16.0),
                  VxRating(
                    isSelectable: false,
                    value: 3.8,
                    onRatingUpdate: (value) {},
                    normalColor: textfieldGrey,
                    selectionColor: golden,
                    count: 5,
                    maxRating: 5,
                    size: 25,
                  ),
                  10.heightBox,
                  boldText(text: "\$300", color: red, size: 18.0),
                  20.heightBox,
                  Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 100,
                            child: boldText(text: "Color",color:fontGrey),
                          ),
                          Row(
                            children: List.generate(
                              3,
                                  (index) => Stack(
                                alignment: Alignment.center,
                                children: [
                                  VxBox()
                                      .size(40, 40)
                                      .roundedFull
                                      .color(Vx.randomPrimaryColor)
                                      .margin(const EdgeInsets.symmetric(horizontal: 4))
                                      .make()
                                      .onTap(() {})
                                ],
                              ),
                            ).toList(),
                          ),
                        ],
                      ).box.padding(const EdgeInsets.all(8)).make(),
                      10.heightBox,
                      Row(
                        children: [
                          SizedBox(
                            width: 100,
                            child: boldText(text: "Quantity",color:fontGrey),
                          ),
                           normalText(text: "20 items",color:fontGrey),
                        ],
                      ).box.padding(EdgeInsets.all(8)).make(),
                    ],
                  ).box.white.shadowSm.make(),
                    const Divider(),
                  20.heightBox,
                  boldText(text: "Description",color: fontGrey),
                  10.heightBox,
                  normalText(text: "Description  off this item ",color:fontGrey),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
