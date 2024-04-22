import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_media_app/models/ProfilePost.dart';
import 'package:social_media_app/themes/AppColors.dart';

// ignore: must_be_immutable
class ProfilePostWidget extends StatefulWidget {
  ProfilePostWidget({super.key,
  required this.profilePost
  });
  ProfilePostModel profilePost;
  @override
  State<ProfilePostWidget> createState() => _ProfilePostWidgetState();
}

class _ProfilePostWidgetState extends State<ProfilePostWidget> {
  @override
  Widget build(BuildContext context) {
    
    return GestureDetector(
    onTap: (){},
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: AppColors.primarycolor,width: 2.w),
      ),
      child: Image.network(widget.profilePost.profileimage!,fit: BoxFit.fill,),
      
    ),
  );
  }
}