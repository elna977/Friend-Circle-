import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_media_app/models/Story.dart';
import 'package:social_media_app/themes/AppColors.dart';

class StoryWidget extends StatefulWidget {
  StoryWidget({super.key,
  required this.story
  });
   StoryModel story;
  @override
  State<StoryWidget> createState() => _StoryWidgetState();
}

class _StoryWidgetState extends State<StoryWidget> {
  @override
  Widget build(BuildContext context) {
    
    return Container(
    width: 60.w,
    height: 110.h,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10.0.r),
      image: DecorationImage(
            image: NetworkImage(widget.story.storyimag!),
            fit: BoxFit.fill
          )
    ),
    child:Column(children: [
      //Container(
        //width: 60.w,height: 70.h,
        //decoration: BoxDecoration(
          //borderRadius: BorderRadius.circular(10.0.r), 
        //),
      //),
      SizedBox(height: 60.h,),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //SizedBox(width: 5.w,),
          CircleAvatar(
            radius: 10.r,
            backgroundColor: AppColors.primarycolor,
            child: CircleAvatar(
              radius: 8.r,
              backgroundImage: NetworkImage(widget.story.userimag!),
            ),
  
          ),
        ],
      ),
       SizedBox(height: 5.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(widget.story.username!,style: TextStyle(
                fontSize: 5.sp,fontWeight: FontWeight.bold
              ),),
            ],
          )
    ],)
  );
  }
}