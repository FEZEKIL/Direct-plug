import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:directplug/consts/consts.dart';
import 'package:directplug/consts/lists.dart';
import 'package:directplug/controllers/auth_controllers.dart';
import 'package:directplug/views/auth_screen/login_screen.dart';
import 'package:directplug/views/profile_screen/components/details_card_buttons.dart';
import 'package:directplug/widgets_common/bg_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/profile_controller.dart';
import '../../services/firestore_services.dart';
import 'edit_profile_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
   
   // ignore: unused_local_variable
   var controller = Get.put(ProfileController());

    return bgWidget(
       child: Scaffold(
        body:  StreamBuilder(
          stream: FirestoreServices.getUser(currentUser!.uid),
        
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){

            if(!snapshot.hasData){
              return const Center(
                child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(blueColor),
                )
                );

            } else{

             var data = snapshot.data!.docs[0];

               return SafeArea(
          child: Column(
            children: [
              //Edit profile button
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: const Align(
                alignment: Alignment.topRight,
                child: Icon(Icons.edit, color: blueColor),
                ).onTap(() { 

                  controller.nameController.text = data['name'];
                
                  Get.to(() =>  EditProfileScreen(data: data));
                }),
              ),
            

              //users details section

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: [

                    data['imageUrl'] == '' ?

                    Image.asset(imgProfile2, width: 100, fit: BoxFit.cover,).box.roundedFull.clip(Clip.antiAlias).make()
                    :
                     Image.network(data['imageUrl'], width: 100, fit: BoxFit.cover,).box.roundedFull.clip(Clip.antiAlias).make(),
                    10.widthBox,
                    Expanded(child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        "${data['name']}".text.fontFamily(semibold).white.make(),
                        "${data['email']}".text.white.make(),
                      ],
                    )),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side:  const BorderSide(
                          color: blueColor,
                        ) ,
                      ),
                      onPressed: () async {
                      await Get.put(AuthController()).signoutMethod(context);
                      Get.offAll(()=> const LoginSreen());
                    }, child: "Logout".text.fontFamily(semibold).make(),
                    )
                  ],
                ),
              ),

              20.heightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  detailsCard(count: data['cart_count'], title: "In cart", width: context.screenWidth / 3.4),
                  detailsCard(count: data['wishlist_count'], title: "In wishlist", width: context.screenWidth / 3.4),
                  detailsCard(count: data['order_count'], title: "orders", width: context.screenWidth / 3.4),
                  
                ],
                ),

                40.heightBox,
                //buttons section

                ListView.separated(
                  shrinkWrap: true,
                  separatorBuilder: ((context, index) {
                    return const Divider(
                      color: lightGrey,
                    );
                  }) ,
                  itemCount:  profileButtonsList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      leading: Image.asset(profileButtonsIcon[index], width: 22,),
                      title: profileButtonsList[index].text.fontFamily(semibold).color(darkFontGrey).make()
                    );
                  },

                  ).box.white.rounded.margin(const EdgeInsets.all(12)).padding(const EdgeInsets.symmetric(horizontal: 16)).shadowSm.make().box.color(blueColor).make(),
            ]
                  
          ));
            }
   
           
          })
       ),
    );
  
  }
}
