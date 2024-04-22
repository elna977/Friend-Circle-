
import 'package:flutter/material.dart';
import 'package:flutter_fast_forms/flutter_fast_forms.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_media_app/BLogic/Firbase/FireStore.dart';
import 'package:social_media_app/Screens/navi.dart';
import 'package:social_media_app/themes/AppColors.dart';

class UserInfoScreen extends StatefulWidget {
  const UserInfoScreen({super.key});

  @override
  State<UserInfoScreen> createState() => _UserInfoScreenState();
}

class _UserInfoScreenState extends State<UserInfoScreen> {
  String fristname="";
  String secondname="";
  String username="";
  String dateofbirth="";
  String country="";
  String city="";
  String code="";
  String phonenumber="";
  bool isOlder16=false;
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text("User Info"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20.h,),
            CircleAvatar(
              radius: 50.0.r,
              backgroundImage: NetworkImage("https://i.imgur.com/zZR7pS9.png"),
            ),
            SizedBox(height: 20.h,),
            Row(children: [
              SizedBox(width: 30.w,),
              Container(
                width: 140.w,
                child: FastTextField(
                          name: 'text_field',
                          onChanged: (value) {
                            setState(() {
                              fristname=value!;
                            });
                          },
                          decoration: InputDecoration(
                            labelText: 'Frist name',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.r)
                            )
                          ),
                          ),
              ),
              SizedBox(width: 20.w,),
              Container(
                width: 140.w,
                child: FastTextField(
                          name: 'text_field',
                          onChanged: (value) {
                            setState(() {
                              secondname=value!;
                            });
                          },
                          decoration: InputDecoration(
                            labelText: 'Last name',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.r)
                            )
                          ),
                          
                          ),
              ),
            ],),
            SizedBox(height: 20.h,),
             Container(
                width: 300.w,
                child: FastTextField(
                          name: 'text_field',
                          onChanged: (value) {
                            setState(() {
                              username=value!;
                            });
                          },
                          decoration: InputDecoration(
                            labelText: 'user name',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.r)
                            )
                          ),
                          ),
              ),
              SizedBox(height: 20.h,),
              Container(
                width: 300.w,
                height: 60.h,
                child: FastDatePicker(
                          name: 'date_picker',
                          onChanged: (value) {
                            setState(() {
                              dateofbirth=value.toString();
                            });
                          },
                          firstDate: DateTime(1970),
                          lastDate: DateTime(2040),
                          decoration: InputDecoration(
                            labelText: 'Date Of Birth',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.r)
                            )
                          ),
                        ),
              ),
              SizedBox(height: 20.h,),
               Row(children: [
              SizedBox(width: 30.w,),
              Container(
                width: 140.w,
                child:  FastDropdown(
                name: 'dropdown',
                onChanged: (value) {
                            setState(() {
                              country=value!;
                            });
                          },
               items: ['Egypt', 'Sweden', 'Finland', 'Denmark', 'Iceland'],
               initialValue: 'Egypt',
                decoration: InputDecoration(
                            labelText: 'country',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.r)
                            )
                          ),
               ),
              ),
              SizedBox(width: 20.w,),
              Container(
                width: 140.w,
                child:  FastDropdown(
                name: 'dropdown',
                onChanged: (value) {
                            setState(() {
                              city=value!;
                            });
                          },
                items: ['cairo', 'Sweden', 'Finland', 'Denmark', 'Iceland'],
               initialValue: 'cairo',
                decoration: InputDecoration(
                            labelText: 'cities',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.r)
                            )
                          ),
              ),
              ),
            ],),
             SizedBox(height: 20.h,),
               Row(children: [
              SizedBox(width: 30.w,),
              Container(
                width: 50.w,
                child: FastTextField(
                          name: 'text_field',
                          onChanged: (value) {
                            setState(() {
                              code=value!;
                            });
                          },
                          decoration: InputDecoration(
                            labelText: 'code',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.r)
                            )
                          ),
                          ),
              ),
              SizedBox(width: 20.w,),
              Container(
                width: 230.w,
                child: FastTextField(
                          name: 'text_field',
                          onChanged: (value) {
                            setState(() {
                              phonenumber=value!;
                            });
                          },
                          decoration: InputDecoration(
                            labelText: 'phone number',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.r)
                            )
                          ),
                          
                          ),
              ),
            ],),
            SizedBox(height: 20.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 300.w,
                  height: 60.h,
                  child: FastSwitch(
                   name: 'switch',
                   onChanged: (value) {
                            setState(() {
                              isOlder16=value!;
                            });
                          },
                   titleText: 'This is a switch',
                   contentPadding: EdgeInsets.fromLTRB(8.0, 0, 0, 0),
                    decoration: InputDecoration(
                            labelText: 'switch',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.r)
                            )
                          ),
          ),
                )
              ],
            ),
              SizedBox(height: 35.h,),
          Center(
            child: SizedBox(
              width: 300.w,
              height: 50.h,
              child: ElevatedButton(onPressed: (){
                FireStore.AddUserInfo(fristname +" "+secondname,
                 username,
                dateofbirth, 
                code+""+phonenumber, 
                country+"-"+city, 
                "https://i.imgur.com/zZR7pS9.png", 
                isOlder16, 
                [],
                []);
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Navi()));
              }, child:Text("Join Our Family",style: TextStyle(
                  color: Colors.white,fontSize: 20.sp
              ),),style: ElevatedButton.styleFrom(shape:RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0)
              ),side: const BorderSide(width: 2.0,color: AppColors.primarycolor),backgroundColor: AppColors.primarycolor),
              ),
            ),
          ),
          ],
        ),
      ),
    );
  }
}