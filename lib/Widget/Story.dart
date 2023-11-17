import 'package:flutter/material.dart';

class StoryScreen extends StatelessWidget {
  // This widget is the root of your application.
  String userImage = 'assets/avatar.jpeg';
  String username, caption;
  String timeAgo = "time";
  String imageURL = 'assets/story.jpg';
  StoryScreen({super.key, required this.username, required this.caption});

  @override
  Widget build(BuildContext context) {
    return StoryScreenPage(
      userImage: this.userImage,
      username: this.username,
      caption: this.caption,
      timeAgo: this.timeAgo,
      imageURL: this.imageURL,
    );
  }
}

class StoryScreenPage extends StatefulWidget {
  String username, caption, timeAgo, userImage, imageURL;
  StoryScreenPage(
      {super.key,
      required this.userImage,
      required this.username,
      required this.timeAgo,
      required this.caption,
      required this.imageURL});
  @override
  _StoryScreenState createState() => _StoryScreenState();
}

class _StoryScreenState extends State<StoryScreenPage> {
  @override
  Widget build(BuildContext context){
    return Card(
      margin: EdgeInsets.only(top:10, left: 5, bottom: 10),
      child: 
       Container(
        width: MediaQuery.of(context).size.width * 0.27,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Stack(children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image.asset(
            widget.imageURL,
            width: double.infinity,
            fit: BoxFit.cover,
             ),
          ),
          Positioned(
            top: 5,
            left: 5,
            child: CircleAvatar(
              radius: 20.0,
              backgroundColor: Colors.grey[200],
              backgroundImage: AssetImage(widget.userImage),
            ),
          ),
          Positioned(
            bottom: 5,
            left: 5,
            child: Text(
              "Trần Xuân Bách",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold
              ),
              )
            )
        ],)
       )
    );
  }
}
