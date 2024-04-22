import 'package:social_media_app/models/Post.dart';
import 'package:social_media_app/models/Story.dart';

class UserModel{
  String? fullName;
  String? userName;
  String? dateOfBirth;
  String? phoneNumber;
  String? location;
  String? userImage;
  bool?   isOld16;
  List<PostModel> ?posts;
  List<StoryModel>?stories;
  UserModel({required this.fullName,required this.userName,required this.dateOfBirth,
  required this.phoneNumber,required this.location,required this.userImage,
    required this.isOld16,required this.posts,required this.stories
  });
}