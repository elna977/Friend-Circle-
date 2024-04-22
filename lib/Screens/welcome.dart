
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_media_app/Screens/signin.dart';
import 'package:social_media_app/Screens/signup.dart';
import 'package:social_media_app/themes/AppColors.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});
  @override
  State<WelcomeScreen> createState() => _MyHomePageState();
}
class _MyHomePageState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primarycolor,
      body: Column(
        children: [
          SizedBox(height: 30.h,),
          Center(
            child: Container(
              width: 250.w,
              height: 400.h,
              child: Image(image: AssetImage("images/icon.png"),).animate().fade(duration: 2.seconds).scale(delay: 500.ms),
            ),
          ),
          SizedBox(height: 20.h,),
          Row(
            children: [
              SizedBox(width: 50.w,),
              SizedBox(
                width: 100.w,
                height: 50.h,
                child: ElevatedButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUp()));
                }, child:Text("SignUp",style: TextStyle(
                  color: AppColors.backgroundcolor,fontSize: 20.sp
                ),),style: ElevatedButton.styleFrom(shape:RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0)
                ),side: const BorderSide(width: 2.0,color: AppColors.primarycolor),backgroundColor: AppColors.primarycolor),
                ),
              ),
              SizedBox(width: 20.w,),
              SizedBox(
                width: 100.w,
                height: 50.h,
                child: ElevatedButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>SignIn()));
                }, child:Text("SignIn",style: TextStyle(
                    color:AppColors.primarycolor,fontSize: 20.sp
                ),),style: ElevatedButton.styleFrom(shape:RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0)
                ),side: const BorderSide(width: 2.0,color: AppColors.primarycolor),backgroundColor:AppColors.backgroundcolor),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
