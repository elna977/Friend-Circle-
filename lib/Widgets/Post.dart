import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_media_app/models/Post.dart';
import 'package:social_media_app/themes/AppColors.dart';

class PostWidget extends StatefulWidget {
 PostWidget({super.key,
 required this.post
 });
 PostModel post;
  @override
  State<PostWidget> createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  @override
  Widget build(BuildContext context) {
    
    return  Container(
    width: 350.w,
    height: 400.h,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10.r),
      border: Border.all(width: 3.w,color: AppColors.primarycolor)
    ),
    child: Column(children: [
      SizedBox(height: 10.h,),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(width: 10.w,),
           CircleAvatar(
            radius: 22.r,
            backgroundColor: AppColors.primarycolor,
             child: CircleAvatar(
              radius: 20.r,
              backgroundImage: NetworkImage(widget.post.userimag!),
                     ),
           ),
          SizedBox(width: 10.w,),
           Column(
             children: [
               Text(widget.post.username!,style: TextStyle(
                fontSize: 12.sp,fontWeight: FontWeight.bold,color: AppColors.primarycolor
          ),),
          Text("16 Jul 2020",style: TextStyle(fontSize: 8.sp,color: Colors.grey),),
             ],
           ),
          SizedBox(width: 70.w,),
          IconButton(onPressed: (){}, icon: Icon(Icons.bookmark_outline,size: 25,color: AppColors.primarycolor,))
        ],
      ),
      SizedBox(height: 10.h,),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(width: 10.w,),
          Text("hello mo hi huosmx",style: TextStyle(fontSize: 12.sp,color: AppColors.primarycolor),),
        ],
      ),
      SizedBox(height: 10.h,),
      Container(width: 300.w,height:220.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0.r),
        image: DecorationImage(
          image: NetworkImage(widget.post.postimg!),
          fit: BoxFit.fill,
        )
      ),
      ),
      SizedBox(height: 10.h,),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(width: 10.w,),
          IconButton(onPressed: (){}, icon: Icon(Icons.favorite_border,size: 30,color: AppColors.primarycolor,)),
          SizedBox(width: 10.w,),
          IconButton(onPressed: (){}, icon: Icon(Icons.comment,size: 25,color: AppColors.primarycolor,)),
          SizedBox(width: 130.w,),
          IconButton(onPressed: (){}, icon: Icon(Icons.share,size: 25,color: AppColors.primarycolor,)),
        ],
      ),
    ],),
  );
  }
}