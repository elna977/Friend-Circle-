import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fast_forms/flutter_fast_forms.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_media_app/BLogic/Firbase/FireStore.dart';
import 'package:social_media_app/Screens/profile.dart';
import 'package:social_media_app/themes/AppColors.dart';

import '../models/Post.dart';
import '../models/Story.dart';

class EditUserInfoScreen extends StatefulWidget {
  const EditUserInfoScreen({super.key});

  @override
  State<EditUserInfoScreen> createState() => _EditUserInfoScreenState();
}

class _EditUserInfoScreenState extends State<EditUserInfoScreen> {
  String? fullName;
  String? userName;
  String? dateOfBirth;
  String? phoneNumber;
  String? location;
  String? userImage ;
  bool?   isOld16;
  List? posts;
  List? stories;
  final auth =FirebaseAuth.instance;
  String? fullName2;
  String? userName2;
  String? dateOfBirth2;
  String? location2;
  String? phoneNumber2;

  Future<void> GetUserInfo()async{
    await FirebaseFirestore.instance.collection('Users').doc(auth.currentUser!.uid).get().then((snapshot){
      if(snapshot.exists){

          setState(() {
            fullName =snapshot.data()! ['fullName'];
            dateOfBirth=snapshot.data()!['dateOfBirth'];
            location=snapshot.data()!['location'];
            phoneNumber =snapshot.data()! ['phoneNumber'];
            userName=snapshot.data()!['userName'];
            userImage=snapshot.data()!['userImge'];
            isOld16=snapshot.data()!['isOld16'];
            posts=snapshot.data()!['posts'];
            stories=snapshot.data()!['stories'];
          });


      }
      else{
        print("No Data");
      }
    });
  }
  @override
  void initState(){
    super.initState();
    GetUserInfo();
  }

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
                width: 300.w,
                child: FastTextField(
                          name: 'text_field',
                          onChanged: (value) {
                            setState(() {
                              fullName=value!;
                            });
                          },
                          decoration: InputDecoration(
                            labelText: fullName,
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
                              userName=value!;
                            });
                          },
                          decoration: InputDecoration(
                            labelText: userName,
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
                              dateOfBirth=value.toString();
                            });
                          },
                          firstDate: DateTime(1970),
                          lastDate: DateTime(2040),
                          decoration: InputDecoration(
                            labelText: dateOfBirth,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.r)
                            )
                          ),
                        ),
              ),
              SizedBox(height: 20.h,),
            Container(
              width: 300.w,
              child: FastTextField(
                name: 'text_field',
                onChanged: (value) {
                  setState(() {
                    location=value!;
                  });
                },
                decoration: InputDecoration(
                    labelText: userName,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.r)
                    )
                ),
              ),
            ),
             SizedBox(height: 20.h,),
              Container(
                width: 300.w,
                child: FastTextField(
                          name: 'text_field',
                          onChanged: (value) {
                            setState(() {
                              phoneNumber=value!;
                            });
                          },
                          decoration: InputDecoration(
                            labelText: phoneNumber,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.r)
                            )
                          ),
                          
                          ),
              ),

              SizedBox(height: 35.h,),
          Center(
            child: SizedBox(
              width: 300.w,
              height: 50.h,
              child: ElevatedButton(onPressed: (){
                FireStore.AddUserInfo(
                    fullName!,
                    userName!,
                    dateOfBirth!,
                    phoneNumber!,
                    location!,
                    "https://i.imgur.com/zZR7pS9.png",
                    true,
                    [],
                    []);
                Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileScreen()));

              }, child:Text("Save Changes",style: TextStyle(
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