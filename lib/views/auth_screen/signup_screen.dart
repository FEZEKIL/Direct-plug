import 'package:directplug/consts/consts.dart';
import 'package:directplug/views/home_screen/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../controllers/auth_controllers.dart';
import '../../widgets_common/applogo_widget.dart';
import '../../widgets_common/bg_widget.dart';
import '../../widgets_common/custom_textfield.dart';
import '../../widgets_common/our_button.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  bool? isCheck = false;
  var controller = Get.put(AuthController());

  //text controllers
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var passwordRetypeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
            "Join the $appname".text.fontFamily(bold).blue600.size(18).make(),
            15.heightBox,

            Obx(() => Column(
                children: [
                  customTextField(hint: nameHint, title: name, controller: nameController, isPass: false),
                  customTextField(hint: emailHint, title: email, controller: emailController, isPass: false),
                  customTextField(hint: passwordHint, title: password, controller: passwordController, isPass: true),
                   customTextField(hint: passwordHint, title: retypePassword, controller: passwordRetypeController, isPass: true),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(onPressed: (){
                  
                    }, child: forgetPass.text.make()),
                  ),
                      
                  Row(
                    children: [
                      Checkbox(
                        checkColor: blueColor,
                        value: isCheck, 
                        onChanged: (newValue){
                          setState(() {
                             isCheck = newValue;
                          });
                      }),
                      10.widthBox,
                      Expanded(
                        child: RichText(text: const TextSpan(
                          children: [
                            TextSpan(text: "I agree to the ",
                             style: TextStyle(
                              fontFamily: regular,
                              color: fontGrey,
                            )),
                            TextSpan(text: termsAndCond,
                             style: TextStyle(
                              fontFamily: regular,
                              color: blueColor,
                            )),
                             TextSpan(text: " & ",
                             style: TextStyle(
                              fontFamily: regular,
                              color: fontGrey,
                            )),
                             TextSpan(text: privacyPolicy,
                             style: TextStyle(
                              fontFamily: regular,
                              color: blueColor,
                            ))
                          ],
                        )),
                      ),
                    ],
                  ),
                  5.heightBox,
            
                  controller.isloading.value?  const CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(blueColor),
                  ) : ourButton(
                  color:
                   isCheck == true? blueColor :
                    lightGrey,
                    title: signup, 
                    textColor: whiteColor, 
                    onPress: () async {
                      if(isCheck != false){
                        controller.isloading(true);
                       try {
                         await controller.signupMethod(
                          context: context,
                           email: emailController.text,
                            password: passwordController.text).then((value) {
                            return controller.storeUserData(
                              email: emailController.text,
                              password: passwordController.text,
                              name: nameController.text
                            );
                            }).then((value){
                              VxToast.show(context, msg: loggedIn);
                              Get.offAll(()=> const Home());
                            });
                       } catch (e) {
                         auth.signOut();
                         VxToast.show(context, msg: e.toString());
                         controller.isloading(false);
                       }
            
                      }
                    })
                 .box.width(context.screenWidth-50)
                 .make(),
                 10.heightBox,
                 //wrapping into gusture detector of velocity X
            
                 RichText(text: const TextSpan(
                  children: [
                    TextSpan(
                      text: alreadyHaveAccount,
                      style: TextStyle(
                        fontFamily: bold,
                        color: fontGrey,
                      ),
                    ),
                    TextSpan(
                      text: login,
                      style: TextStyle(
                        fontFamily: bold,
                        color: blueColor,
                      ),
                    ),
                  ],
                 ),
                 ).onTap(() { 
                  Get.back();
                 }),
                ],
              ).box.white.rounded.padding(const EdgeInsets.all(17)).width(context.screenWidth -50).shadow.make(),
            )
          ],
        ),
      ),
    ));
  }
}
