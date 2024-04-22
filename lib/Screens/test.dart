
import 'package:flutter/material.dart';
import 'package:social_media_app/Widgets/StoryInfo.dart';
import 'package:social_media_app/models/StoryInfo.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body:SingleChildScrollView(
        child :Column(
          children: [           
                  StoryInfoWidget(storyInfoModel: StoryInfoModel(username: "Mohamed Elnagar",
                   userimag: "https://i.imgur.com/zZR7pS9.png", 
                   storyimage: "https://i.imgur.com/zZR7pS9.png", 
                   date: "16 Jul 2020" ),)

          ],
        )
    

        
      ), 
    );
  }
}