
import 'package:directplug/consts/consts.dart';
import 'package:directplug/views/auth_screen/login_screen.dart';
import 'package:directplug/widgets_common/applogo_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../home_screen/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  
  // create a method to change screen

  changeScreen(){
    Future.delayed(const Duration(seconds: 3), (() {
      
     // Get.to(()=> const LoginSreen());

     auth.authStateChanges().listen((User? user) { 
      if(user == null && mounted){
       Get.to(()=> const LoginSreen());
      } else{
        Get.to(()=> HomeScreen);
      }
     });
    }));
  }

  @override
  void initState() {
    changeScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blueColor,
      body: Center(
        child: Column(
          children: [
            Align(alignment: Alignment.topLeft, child: Image.asset(icSplashBg, width: 300)),
            20.heightBox,
            applogoWidget(),
            10.heightBox,
            appname.text.fontFamily(bold).size(22).white.make(),
            5.heightBox,
            appversion.text.white.make(),
            const Spacer(),
            credits.text.white.fontFamily(semibold).make(),
            30.heightBox,
            // splash screen completed
          ],
        ),
      ),

    );
  }
}