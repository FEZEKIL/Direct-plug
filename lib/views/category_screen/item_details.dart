
import 'package:directplug/consts/consts.dart';
import 'package:directplug/widgets_common/our_button.dart';
import 'package:flutter/material.dart';


import '../../consts/lists.dart';


class ItemDetails extends StatelessWidget {
  final String? title;

  const ItemDetails({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     resizeToAvoidBottomInset: false,
     backgroundColor: lightGrey,
      appBar: AppBar(
      backgroundColor: blueColor,
       title: title!.text.color(lightGrey).fontFamily(bold).make(),
        actions: [
         IconButton(onPressed: () {}, icon: const Icon(Icons.share, color: lightGrey,)),
         
         IconButton(onPressed: () {}, icon: const Icon(Icons.favorite_outline, color: lightGrey,)),
        ],
      ),
      body: Column(
         children: [
           Expanded(
            child: Padding(
            padding:  const EdgeInsets.all(8),
            child: SingleChildScrollView(
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               //Swiper or coursel section
               VxSwiper.builder(
                autoPlay: true,
                height: 350,
                itemCount: 3,
                aspectRatio: 16/9,
                 itemBuilder: ((context, index) {
                 return Image.asset(imgFc5, width: double.infinity, fit: BoxFit.cover,
                 );
               }),
               ),

               10.heightBox,
               //title and details section
               title!.text.size(16).color(darkFontGrey).fontFamily(semibold).make(),
               10.heightBox,
               VxRating(onRatingUpdate:
                (value){},
                 normalColor: textfieldGrey,
                 selectionColor: golden, 
                 count: 5,
                 size: 25,
                 stepInt: true,
                 ),

                  10.heightBox,
                "R 87,00".text.color(blueColor).fontFamily(bold).size(18).make(),

                10.heightBox,

                Row(
                  children: [
                    Expanded(
                      child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        "Seller".text.white.fontFamily(semibold).make(),

                        5.heightBox,

                        "In House Brands".text.fontFamily(semibold).color(darkFontGrey).size(16).make()

                      ],
                      ),
                    ),
                    const CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(Icons.message_rounded, 
                      color: darkFontGrey,
                      ),
                    ),
                  ],
                ).box.height(60).padding(const EdgeInsets.symmetric(horizontal: 16)).color(textfieldGrey).make(),

                // color section
                20.heightBox,
                Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 100,
                          child: "Color: ".text.color(textfieldGrey).make(),
                        ),
                        Row(
                          children: List.generate(3, (index) => VxBox().size(40, 40)
                          .roundedFull.
                          color(Vx.randomPrimaryColor).
                          margin(const EdgeInsets.symmetric(horizontal: 4)).make(),
                          )
                        ),
                      ],
                    ).box.padding(const EdgeInsets.all(8)).make(),

                    //Quantity section
                     Row(
                      children: [
                        SizedBox(
                          width: 99,
                          child: "Quantity: ".text.color(textfieldGrey).make(),
                        ),
                         Row(
                          children: [
                            IconButton(onPressed: (){}, icon: const Icon(Icons.remove)),
                            "0".text.size(16).color(darkFontGrey).fontFamily(bold).make(),
                             IconButton(onPressed: (){}, icon: const Icon(Icons.add)),
                           10.widthBox,
                           "(0 available)".text.color(textfieldGrey).make()
                          ],
                         ),
                        
                      ],
                    ).box.padding(const EdgeInsets.all(8)).make(),

                    //Total section
                     Row(
                      children: [
                        SizedBox(
                          width: 100,
                          child: "Total: ".text.color(textfieldGrey).make(),
                        ),
                         
                        "R 0,00".text.color(blueColor).size(16).fontFamily(bold).make()
                        
                      ],
                    ).box.padding(const EdgeInsets.all(8)).make()
                  ],
                ).box.white.shadowSm.make(),
                 
                 10.heightBox,
                //description section
                "Description".text.color(darkFontGrey).fontFamily(semibold).make(),
                10.heightBox,
                "This a dummy text for item and for description...".text.color(darkFontGrey).make(),
                //Button sections
                10.heightBox,

                ListView(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: List.generate(
                    ItemDetailsButtonList.length, 
                    (index) => ListTile(
                    title: ItemDetailsButtonList[index].text.fontFamily(semibold).color(darkFontGrey ).make(),
                    trailing: const Icon(Icons.arrow_forward),
                  )),
                ),
                 
                 20.heightBox,
                //Products you may like
                productsyoumaylike.text.fontFamily(bold).size(16).color(darkFontGrey).make(),
                10.heightBox,
                 // this widget is from the home screen
                 SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(6, (index) => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(imgP1, width: 150, fit: BoxFit.cover,),
                    
                            10.heightBox,
                            "Laptop 4GB/64GB".text.fontFamily(semibold).color(darkFontGrey).make(),
                            10.heightBox,

                            "R 7900".text.color(blueColor).fontFamily(bold).size(16).make()
                          ],
                        ).box.white.margin(const EdgeInsets.symmetric(horizontal: 4)).roundedSM.padding(const EdgeInsets.all(8)).make()),
                      ),
                    ),

              ],
            ),
            ),
          
            )),
          SizedBox(
            width: double.infinity,
            height: 60,
          child: ourButton(
            color: blueColor,
            onPress: () {},
            textColor: whiteColor,
            title: "Add to cart",
          ),

          )
         ],
      ),
    );
  }
}