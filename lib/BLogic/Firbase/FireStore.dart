import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:social_media_app/models/Post.dart';
import 'package:social_media_app/models/Story.dart';
class FireStore {
  static String fullName="";
  static String userName="";
  static String dateOfBirth="";
  static String phoneNumber="";
  static String location="";
  static String userImage ="";
  static bool   isOld16=false;
  static List<PostModel> posts=[];
  static List<StoryModel> stories=[];
  static final auth =FirebaseAuth.instance;
  static Future<void> AddUserInfo(String fullName,String? userName,
  String dateOfBirth,String phoneNumber,String location, String userImage,bool isOld16,List<PostModel>posts,List<StoryModel>stories)async{
    await FirebaseFirestore.instance.collection('Users').doc(auth.currentUser!.uid).set({
      'fullName':fullName,
      'dateOfBirth':dateOfBirth,
      'location':location,
      'phoneNumber':phoneNumber,
      'userImge':userImage,
      'userName':userName,
      'isOlder16':isOld16,
      'posts':posts,
      'stories':stories,
    });
  }
   static Future<void> AddStory(String username,String storyimag,String userimag,String date)async{
    await FirebaseFirestore.instance.collection('Stories').add({
      'username':username,
      'userimag':userimag,
      'storyimag':storyimag,
      'date':date
    });
   }
  static Future<void> AddPost(String username,String postimg,String userimg,String date,String desc)async{
    await FirebaseFirestore.instance.collection('Posts').add({
      'username':username,
      'userimg':userimg,
      'postimg':postimg,
      'date':date,
      'desc':desc
    });
  }
}