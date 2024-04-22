import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_media_app/BLogic/Firbase/FireStore.dart';
import 'package:social_media_app/Screens/addPosst.dart';
import 'package:social_media_app/Screens/test.dart';
import 'package:social_media_app/Widgets/Post.dart';
import 'package:social_media_app/Widgets/Story.dart';
import 'package:social_media_app/models/Post.dart';
import 'package:social_media_app/models/Story.dart';
import 'package:social_media_app/themes/AppColors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: SingleChildScrollView(child: Column(
        children: [
          SizedBox(height: 20.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(width: 20.w,),
              CircleAvatar(
                radius: 20.r,
                backgroundColor: AppColors.primarycolor,
                
              ),
              SizedBox(width: 20.w,),
              Text("Hello,\nMohamed Elnagar",style: TextStyle(
                fontSize: 15.sp,fontWeight: FontWeight.bold
              ),),
              SizedBox(width: 60.w,),
              IconButton(onPressed: (){}, icon: Icon(Icons.settings)),
              IconButton(onPressed: (){}, icon: Icon(Icons.search_outlined)),
            ],
          ),
          SizedBox(height: 40.h,),
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>TestScreen(),));
            },
            child: Container(
              height:110.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context,i){
                  return Padding(
                    padding: EdgeInsets.only(left: 10.w),
                    child: StoryWidget(story: StoryModel(username: "Mohamed Elnagar",
                     storyimag: "https://i.imgur.com/zZR7pS9.png", 
                     userimag:"https://i.imgur.com/zZR7pS9.png"
                    ,date:"11.30")),
                  );
              }),
            ),
          )
          ,SizedBox(height: 30.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(width: 60.w,),
              SizedBox(
                  width: 105.w,
                  height: 50.h,
                  child: ElevatedButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>AddPostScreen()));
                   // try{
                     // FireStore.AddPost("Mohamed", "https://i.imgur.com/zZR7pS9.png",
                       //   "https://i.imgur.com/zZR7pS9.png", "12.33",
                         // "cbcjkdndnelmvnlkvn,cl"
                      //);
                    //}
                    //catch(e){
                     // print(e);
                    //}

                  }, child:Row(
                    children: [
                      SizedBox(width: 10.w,),
                      Icon(Icons.add,size: 20,color: AppColors.primarycolor,),
                      SizedBox(width: 10.w,),
                      Text("Post",style: TextStyle(
                          color: AppColors.primarycolor,fontSize: 14.sp
                      ),),
                    ],
                  ),style: ElevatedButton.styleFrom(shape:RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0.r)
                  ),side: const BorderSide(width: 2.0,color: AppColors.primarycolor),backgroundColor: AppColors.backgroundcolor),
                  ),
                ),
                SizedBox(width: 20.w,),
                SizedBox(
              width: 105.w,
              height: 50.h,
              child: ElevatedButton(onPressed: (){
                try{
                  FireStore.AddStory("Mohamed", "https://i.imgur.com/zZR7pS9.png", "https://i.imgur.com/zZR7pS9.png", "12.33");
                }
                catch(e){
                print(e);
                }
              }, child:Row(
                children: [
                  SizedBox(width: 10.w,),
                  Icon(Icons.photo,size: 20,color: AppColors.quarternarycolor,),
                  SizedBox(width: 10.w,),
                  Text("Story",style: TextStyle(
                      color: AppColors.quarternarycolor,fontSize: 14.sp
                  ),),
                ],
              ),style: ElevatedButton.styleFrom(shape:RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0.r)
              ),side: const BorderSide(width: 2.0,color: AppColors.quarternarycolor),backgroundColor: AppColors.backgroundcolor),
              ),
            ),
            ],
          ),
          SizedBox(height: 30.h,),
           Container(
            width: 320.w,
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 10,
              itemBuilder: (context,i){
                return Padding(
                  padding: EdgeInsets.all(8.0),
                  child: PostWidget(post: PostModel(username: "Mohamed Elnagar",
                   postimg:"https://i.imgur.com/zZR7pS9.png", 
                   userimag: "https://i.imgur.com/zZR7pS9.png",
                  date: "9.30",desc: "dwwxsccevevmevkevmelv"),),
                );
            }),
          ),
          
        ],)),
    );
  }
}