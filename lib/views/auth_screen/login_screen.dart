import 'package:directplug/consts/consts.dart';
import 'package:directplug/consts/lists.dart';
import 'package:directplug/views/auth_screen/signup_screen.dart';
import 'package:directplug/widgets_common/applogo_widget.dart';
import 'package:directplug/widgets_common/bg_widget.dart';
import 'package:directplug/widgets_common/custom_textfield.dart';
import 'package:directplug/widgets_common/our_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/auth_controllers.dart';
import '../home_screen/home.dart';


class LoginSreen extends StatelessWidget {
  const LoginSreen({super.key});

  @override
  Widget build(BuildContext context) {

    var controller = Get.put(AuthController());
    return bgWidget(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        //If resizeToAvoidButtomInset it does not solve overflowed by pixels error
        //try to wrap the body content with SingleChildSrollView() widgte at the root
      body: Center(
        child: Column(
          children: [
            (context.screenHeight * 0.1).heightBox,
            applogoWidget(),
            10.heightBox,
            "Sign In to $appname".text.fontFamily(bold).blue600.size(18).make(),
            15.heightBox,

            Obx(
               () =>Column(

                children: [
                  customTextField(hint: emailHint, title: email, isPass: false, controller: controller.emailController),
                  customTextField(hint: passwordHint, title: password, isPass: true, controller: controller.passwordController),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(onPressed: (){ }, child: forgetPass.text.make()),
                  ),
                  5.heightBox,
                 controller.isloading.value ? const CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(blueColor),
                 ) : ourButton(
                color: blueColor,
                 title: login,
                  textColor: whiteColor,
                   onPress: () async {

                    controller.isloading(true);

                    await controller.loginMethod(context: context).then((value){
                      if(value != null){
                        VxToast.show(context, msg: loggedIn);
                        Get.offAll(()=> const Home());
                      } else{
                        controller.isloading(false);
                      }
                    });
                 })
                 .box.width(context.screenWidth-50)
                 .make(),
            
                 5.heightBox,
                 createNewAccount.text.color(fontGrey).make(),
                 5.heightBox,
            
                  ourButton(color: lightGolden, title: signup, textColor: blueColor, onPress: () {
                     Get.to(()=> const SignUpScreen());
                  })
                 .box.width(context.screenWidth - 50)
                 .make(),
            
                 10.heightBox,
                 loginWith.text.color(fontGrey).make(),
                 5.heightBox,
                 Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(3,  (index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      backgroundColor: lightGrey,
                      radius: 35,
                      child: Image.asset(socialIconList[index], width: 30,),
                    ),
                  )),
                 )
                ],
              ).box.white.rounded.padding(const EdgeInsets.all(17)).width(context.screenWidth -60).shadow.make(),
            )
          ]
      )
      
    )
    
      )
        );
  }
}