import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:social_media_app/themes/AppColors.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({super.key});

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  @override
  bool getImage =false;
  File?file;
  String ? url;
  UpoaldImage() async{
    ImagePicker picker =ImagePicker();
    XFile? image =await picker.pickImage(source: ImageSource.camera);
    if(image!=null){
      setState(() {
      file =File(image.path);
      getImage=true;
    
    });
      var imagename = basename(image.path);
      var ref =FirebaseStorage.instance.ref("Posts/${imagename}");
      await ref.putFile(file!);
      url =await ref.getDownloadURL();
      print(url);
    }
  }
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          
          children: [
            SizedBox(height: 30.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: 10.w,),
                IconButton(onPressed: (){
                  Navigator.pop(context);
                }, icon: Icon(Icons.arrow_back_ios)),
                SizedBox(width: 50.w,),
                Text("Add Post",style: TextStyle(fontSize: 30.sp,color: AppColors.primarycolor,fontWeight: FontWeight.bold),),
                SizedBox(width: 60.w,),
                 SizedBox(
                  width: 60.w,
                  height: 40.h,
                  child: ElevatedButton(onPressed: (){
                  }, child:Text("post",style: TextStyle(
                    color: AppColors.backgroundcolor,fontSize: 15.sp
                  ),),style: ElevatedButton.styleFrom(shape:RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0)
                  ),side: const BorderSide(width: 2.0,color: AppColors.primarycolor),backgroundColor: AppColors.primarycolor),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(width: 20.w,),
              CircleAvatar(
                radius: 20.r,
                backgroundColor: AppColors.primarycolor,
                
              ),
              SizedBox(width: 20.w,),
              Text("Mohamed Elnagar",style: TextStyle(
                fontSize: 15.sp,fontWeight: FontWeight.bold
              ),),
            ],
          ),
            SizedBox(height: 5.h,),
              Padding(
                    padding:  EdgeInsets.only(left: 20.w,right: 20.w),
                    child: TextFormField(
                      maxLines: null,
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                        hintText: "What is in your mind?",
                        border: InputBorder.none,
      
                      ),
                    ),
                  ),
                  SizedBox(height: 5.h,),
                  getImage?
                   Container(
                      width: MediaQuery.sizeOf(context).width,
                      height: 240.h,
                      decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(10.0.r),
                     image: DecorationImage(
                          image: FileImage(file!),
                        fit: BoxFit.fill,
                            )
                          ),
                    ):
                   GestureDetector(
                    onTap: ()async{
                      await UpoaldImage();
                    },
                     child: Container(
                      width: MediaQuery.sizeOf(context).width,
                      height: 240.h,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.photo),
                          SizedBox(height: 10.h,),
                          Text("Add photo"),
                        ],
                      ),
                      decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(10.0.r),
                                 border: Border.all(color: AppColors.primarycolor,width: 2.w),     
                           ),
                                     ),
                   ),
          ],
        ),
      ),
    );
  }
}
