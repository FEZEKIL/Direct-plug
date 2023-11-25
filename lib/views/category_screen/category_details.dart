import 'package:directplug/consts/consts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/product_controller.dart';
import '../../widgets_common/bg_widget.dart';
import 'item_details.dart';

class CategoryDetailsScreen extends StatelessWidget {
 final String? title;

  const CategoryDetailsScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
   
   var controller = Get.find<ProductController>();

    return bgWidget(
      child: Scaffold(
        appBar: AppBar(
         title: title!.text.fontFamily(bold).make(),
        ),
        body: Container(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    controller.subcat.length,
                   (index)
                   => "${controller.subcat[index]}".text.fontFamily(semibold).color(darkFontGrey).makeCentered().box.white.rounded.size(120, 60).margin(const EdgeInsets.symmetric(horizontal: 4)).make()),
                ),
              ),

              20.heightBox,

              //Items container
              Expanded(
                child: GridView.builder(
                  physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: 6,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisExtent: 250, mainAxisSpacing: 8, crossAxisSpacing: 8),
                itemBuilder: (context, index) {
                  return Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(imgP5, height: 150, width: 200, fit: BoxFit.cover,
                    ),
                    const Spacer(),
                    10.heightBox,
                     "Laptop 4GB/64GB".text.fontFamily(semibold).color(darkFontGrey).make(),
                      10.heightBox,

                    "R 7900".text.color(blueColor).fontFamily(bold).size(16).make()
                      ],
                      ).box.white.margin(const EdgeInsets.symmetric(horizontal: 4)).
                      roundedSM.outerShadowSm.
                      padding(const EdgeInsets.all(12)).make().onTap(() {
                        Get.to(()=> const ItemDetails(title: "Dummy Items"));
                      });
                      
                }),
                 
                )  
            ],
          ),
        ),
      ),
    );
  }
}