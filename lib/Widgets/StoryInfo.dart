import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_media_app/models/StoryInfo.dart';
import 'package:social_media_app/themes/AppColors.dart';

class StoryInfoWidget extends StatefulWidget {
  StoryInfoWidget({super.key,
  required this.storyInfoModel
  });
 StoryInfoModel storyInfoModel;
  @override
  State<StoryInfoWidget> createState() => _StoryInfoWidgetState();
}

class _StoryInfoWidgetState extends State<StoryInfoWidget> {
  @override
  Widget build(BuildContext context) {
    
    return Container(
    width:MediaQuery.sizeOf(context).width,
    height: MediaQuery.sizeOf(context).height,
     decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10.0.r),
      image: DecorationImage(
            image: NetworkImage(widget.storyInfoModel.storyimage!),
            fit: BoxFit.cover
          )
    ),
    child:Column(children: [
      SizedBox(height: 20.h,),
    
          //SizedBox(width: 5.w,),
          Row(
            children: [
              SizedBox(width: 30.h,),
              CircleAvatar(
                radius: 22.r,
                backgroundColor: AppColors.primarycolor,
                child: CircleAvatar(
                  radius: 20.r,
                  backgroundImage: NetworkImage(widget.storyInfoModel.userimag!),
                ),
  
              ),
               SizedBox(width: 20.h,),
              Column(
                children: [
                  Text(widget.storyInfoModel.username!,style: TextStyle(
                    fontSize: 15.sp,fontWeight: FontWeight.bold
                  ),),
                  SizedBox(height: 5.h,),
                 Text(widget.storyInfoModel.date!,style: TextStyle(fontSize: 10.sp,color: Colors.grey),),
                ],
              ),
              SizedBox(width: 90.h,),
              IconButton(onPressed: (){}, icon: Icon(Icons.more_vert,color: AppColors.primarycolor,size: 30,)),
            ],
          ),
          
      
    ],)
  );
  }
}