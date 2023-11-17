import 'package:flutter/material.dart';
import 'package:flutter_application/Widget/Post.dart';
import 'package:flutter_application/Widget/Story.dart';
import 'package:flutter_application/presentation/addpost/addpost.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    // mock data
    final data = [
      {"username": "Trần Xuân Bách", "caption": "Trần Xuân Bách đã đăng ảnh mới", "timeAgo": "Vừa xong" , "like": "10", "comments": "15", "shares": "3"},
      {"username": "Hoàng Đức Thành", "caption": "Hoàng Đức Thành vừa cập nhật ảnh đại diện", "timeAgo": "Vừa xong", "like": "10", "comments": "15", "shares": "3"},
      {"username": "Trần Xuân Bách", "caption": "Trần Xuân Bách đang ảnh mới", "timeAgo": "30 phút trước", "like": "10", "comments": "15", "shares": "3"},
      {"username": "Trần Xuân Bách", "caption": "Trần Xuân Bách đang ảnh mới", "timeAgo": "30 phút trước", "like": "10", "comments": "15", "shares": "3"},
      {"username": "Trần Xuân Bách", "caption": "Trần Xuân Bách đang ảnh mới", "timeAgo": "30 phút trước", "like": "10", "comments": "15", "shares": "3"},
    ];

    List<PostScreen> posts = data
        .map((json) =>
            PostScreen(username: json['username']!, caption: json['caption']!, timeAgo: json['timeAgo']!,  like: json['like']!, comments: json['comments']!, shares: json['shares']!))
        .toList();
    
    List<StoryScreen> stories = data
          .map((json) =>
              StoryScreen(username: json['username']!, caption: json['caption']!))
          .toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'facebook',
          style: TextStyle(
            color: Colors.blue,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        color: Color(0xFFF0F2F5),
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.only(left: 15, top: 10, bottom: 10),
              decoration: BoxDecoration(
                  color: Color(0XFFFFFFFF),
                  borderRadius: BorderRadius.circular(4),
              ),
              child:  Row(
                children: [
                  CircleAvatar(
                      radius: 20.0,
                      backgroundColor: Colors.grey[200],
                      backgroundImage: AssetImage("assets/avatar.jpeg"),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AddPost()),
                    );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Bạn đang nghĩ gì ?"),
                    ),
                  )
                ],
              )
            ),

            Container(
              height: MediaQuery.of(context).size.height * 0.3,
              padding: EdgeInsets.only(left: 10.0),
              margin: EdgeInsets.only(bottom: 10.0, top:10.0),
              color: Colors.white,
              child: 
                ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: stories.length,
                itemBuilder: (context, index) {
                  return stories[index];
                },
              ),
            ),

            ListView.builder(
              shrinkWrap: true,
              itemCount: posts.length,
              itemBuilder: (context, index) {
                return posts[index];
              },
            ),
            
          ],
        ),
      ),
    );
  }
}
