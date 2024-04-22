import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_media_app/BLogic/Firbase/Auth.dart';
import 'package:social_media_app/Screens/navi.dart';
import 'package:social_media_app/Screens/signup.dart';
import 'package:social_media_app/themes/AppColors.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});
  @override
  State<SignIn> createState() => _SignInState();
}
class _SignInState extends State<SignIn> {
    TextEditingController _emailController =TextEditingController();
  TextEditingController _passwordController =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SingleChildScrollView(
        child:Column(
        children: [
          SizedBox(height: 40.h,),
          Row(
            children: [
              SizedBox(width: 25.w,),
              GestureDetector(onTap: (){
                Navigator.pop(context);
              },
                  child: Icon(Icons.arrow_back_ios,color: Colors.black,size: 20,))
            ],
          ),
          SizedBox(height: 20.h,),
          Row(
            children: [
              SizedBox(width: 25.w,),
              Text("Log In",style: TextStyle(
                  color: Colors.black,fontSize: 25.sp,fontWeight: FontWeight.bold
              ),)
            ],
          ),
          SizedBox(height: 35.h,),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: TextField(
              controller: _emailController,
              decoration: InputDecoration(
                suffixIcon: Icon(Icons.check_circle,color: Colors.blueGrey,),
                labelText: "EMAIL",
                prefixIcon: Icon(Icons.email,color: AppColors.primarycolor,),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0))
                ),
                hintText: "Enter your email",
                focusedBorder: OutlineInputBorder(
                  borderRadius:   BorderRadius.all(Radius.circular(10.0)),
                )
            ),),
          ),
          SizedBox(height: 10.h,),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: TextField(autofocus: true,
            controller: _passwordController,
              decoration: InputDecoration(
                  suffixIcon: Icon(Icons.remove_red_eye_outlined,color: Colors.blueGrey,),
                  labelText: "Password",
                  prefixIcon: Icon(Icons.lock,color: AppColors.primarycolor,),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0))
                  ),
                  hintText: "Enter your Password",
                  focusedBorder: OutlineInputBorder(
                    borderRadius:   BorderRadius.all(Radius.circular(10.0)),
                  )
              ),),
          ),
          SizedBox(height: 35.h,),
          Center(
            child: SizedBox(
              width: 300.w,
              height: 50.h,
              child: ElevatedButton(onPressed: (){
                Auth.signInWithEmailAndPassowrd(_emailController.text.trim(), _passwordController.text.trim());
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Navi()));
              }, child:Text("Sign In",style: TextStyle(
                  color: Colors.white,fontSize: 20.sp
              ),),style: ElevatedButton.styleFrom(shape:RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0)
              ),side: const BorderSide(width: 2.0,color: AppColors.primarycolor),backgroundColor: AppColors.primarycolor),
              ),
            ),
          ),
          SizedBox(height: 20.h,),
          Center(
            child: SizedBox(
              width: 300.w,
              height: 50.h,
              child: ElevatedButton(onPressed: (){
                Auth.signInWithGoogle();
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Navi()));
              }, child:Text("Sing In with google",style: TextStyle(
                  color: AppColors.primarycolor,fontSize: 20.sp
              ),),style: ElevatedButton.styleFrom(shape:RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0)
              ),side: const BorderSide(width: 2.0,color: AppColors.primarycolor),backgroundColor: AppColors.backgroundcolor),
              ),
            ),
          ),
          SizedBox(height: 20.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("If you donet have account ?  ",style: TextStyle(
                  color: Colors.black54,fontSize: 15.sp
              ),),
              TextButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUp()));
              }, child:Text("Sign up",style: TextStyle(
                  color:AppColors.primarycolor,fontSize: 15.sp
              ),) )
            ],
          ),
        ],
      ),
      )
    );
  }
}
