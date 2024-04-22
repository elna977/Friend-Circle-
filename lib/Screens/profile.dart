import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_media_app/Screens/EditUserInfo.dart';
import 'package:social_media_app/Widgets/ProfilePost.dart';
import 'package:social_media_app/Widgets/Story.dart';
import 'package:social_media_app/models/ProfilePost.dart';
import 'package:social_media_app/models/Story.dart';
import 'package:social_media_app/themes/AppColors.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: SingleChildScrollView(
        child:Column(
          children: [
            SizedBox(height: 5.h,),
            Container(
              width: MediaQuery.sizeOf(context).width,
              height: 200.h,
              decoration: BoxDecoration(
                color: AppColors.primarycolor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30.r),
                  bottomRight: Radius.circular(30.r),
                )
              ),
              child: Column(children: [
                SizedBox(height: 90.h,),
                CircleAvatar(
                  radius: 55.r,
                  backgroundColor: AppColors.backgroundcolor,
                  child: CircleAvatar(
                      radius: 50.r,
                      backgroundColor: AppColors.primarycolor,
                      
                    ),
                ),
              ]),
            ),
            SizedBox(height:10.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                   Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Mohamed Elnagar",style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.bold,color: AppColors.primarycolor),),
                  ],
                ),
                 SizedBox(height:5.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("@moelnagar63",style: TextStyle(fontSize: 12.sp,color: Colors.grey),),
                  ],
                ),
                ],),
                SizedBox(width: 20.w),
                IconButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>EditUserInfoScreen()));
                }, icon: Icon(Icons.edit,size: 15.dg,color: AppColors.primarycolor,)),
              ],
            ),
        
            SizedBox(height:5.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: 50.w,),
                Column(
                  children: [
                    Text("Posts",style: TextStyle(fontSize: 15.sp,color: AppColors.primarycolor),),
                    SizedBox(height:5.h,),
                    Text("50",style: TextStyle(fontSize: 20.sp,color: AppColors.primarycolor,fontWeight: FontWeight.bold),),
                  ],
                ),
                    SizedBox(width: 40.w,),
                Column(
                  children: [
                    Text("followers",style: TextStyle(fontSize: 15.sp,color: AppColors.primarycolor),),
                    SizedBox(height:5.h,),
                    Text("50k",style: TextStyle(fontSize: 20.sp,color: AppColors.primarycolor,fontWeight: FontWeight.bold),),
                  ],
                ),
                    SizedBox(width: 40.w,),
                Column(
                  children: [
                    Text("following",style: TextStyle(fontSize: 15.sp,color: AppColors.primarycolor),),
                    SizedBox(height:5.h,),
                    Text("200",style: TextStyle(fontSize: 20.sp,color: AppColors.primarycolor,fontWeight: FontWeight.bold),),
                  ],
                ),
              ],
            ),
            SizedBox(height: 10.h,),
             Row(
               children: [
                SizedBox(width: 20.w,),
                 SizedBox(
                    width: 250.w,
                    height: 50.h,
                    child: ElevatedButton(onPressed: (){
                    }, child:Text("follow",style: TextStyle(
                        color:AppColors.backgroundcolor,fontSize: 20.sp
                    ),),style: ElevatedButton.styleFrom(shape:RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0.r)
                    ),side: const BorderSide(width: 2.0,color: AppColors.quarternarycolor),backgroundColor:AppColors.quarternarycolor),
                    ),
                  ),
                  SizedBox(width: 10.w,),
                   SizedBox(
                    width: 60.w,
                    height: 50.h,
                    child: ElevatedButton(onPressed: (){
                    }, child:Icon(Icons.chat_bubble_outline,color: AppColors.quarternarycolor,size: 25,)
                    ,style: ElevatedButton.styleFrom(shape:RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0.r)
                    ),side: const BorderSide(width: 2.0,color: AppColors.quarternarycolor),backgroundColor:AppColors.backgroundcolor),
                    ),
                  ),
               ],
             ),
             SizedBox(height: 25.h,),
             Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: 40.w,),
                Text("Stories",style: TextStyle(fontSize: 20.sp,color: AppColors.primarycolor,fontWeight: FontWeight.bold),),
                SizedBox(width: 190.w,),
                IconButton(onPressed: (){}, icon: Icon(Icons.menu)),
              ],
             ),
              SizedBox(height: 5.h,),
              Container(
               height:110.h,
               child: ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 10,
                itemBuilder: (context,i){
                return Padding(
                  padding: EdgeInsets.only(left: 10.w),
                  child:StoryWidget(story: StoryModel(username: "Mohamed Elnagar",
                     storyimag: "https://i.imgur.com/zZR7pS9.png", 
                     userimag:"https://i.imgur.com/zZR7pS9.png"
                      ,date:"11.30"),),
                );
            }),
          ),
          SizedBox(height: 25.h,),
             Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: 40.w,),
                Text("Photos",style: TextStyle(fontSize: 20.sp,color: AppColors.primarycolor,fontWeight: FontWeight.bold),),
                SizedBox(width: 190.w,),
                IconButton(onPressed: (){}, icon: Icon(Icons.menu)),
              ],
             ),
              SizedBox(height: 5.h,),
              Container(
               child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  ),
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 10,
                itemBuilder: (context,i){
                return Padding(
                  padding: EdgeInsets.all(8.0),
                  child: ProfilePostWidget(profilePost: ProfilePostModel(profileimage: "https://i.imgur.com/zZR7pS9.png"),),
                );
            }),
          ),
          ],
        ) ,
        
        ),
    );
  }
}
