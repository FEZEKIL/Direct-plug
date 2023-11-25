import 'package:directplug/consts/consts.dart';
import 'package:directplug/consts/lists.dart';
import 'package:directplug/views/category_screen/category_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/product_controller.dart';
import '../../widgets_common/bg_widget.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
      var controller = Get.put(ProductController());

    return bgWidget(
      child: Scaffold(
      appBar: AppBar(
        title: categories.text.fontFamily(bold).white.make(),
      ),
      body: Container(
        padding: const EdgeInsets.all(12),
        child: GridView.builder(
        shrinkWrap: true,
        itemCount: 9,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, mainAxisSpacing: 8, crossAxisSpacing: 8, mainAxisExtent: 200), 
        itemBuilder: (contex, index){
         return Column(
          children: [
            Image.asset(categoryImages[index], height: 120, width: 200, fit: BoxFit.cover,),
            10.heightBox,
            categoriesList[index].text.color(darkFontGrey).align(TextAlign.center).make()
          ],
         ).box.white.rounded.clip(Clip.antiAlias).outerShadowSm.make().onTap(() {
          
          controller.getSubCategories(categoriesList[index]);
          Get.to(()=> CategoryDetailsScreen(title: categoriesList[index],
          ));
         });  
        }
        ),
      
      ), 
      ),
    );
  
  }
}