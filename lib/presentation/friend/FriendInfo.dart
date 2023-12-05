import 'package:flutter/material.dart';
import 'package:flutter_application/application/friend_service.dart';
import 'package:flutter_application/data/friend_repository.dart';
import 'package:flutter_application/domain/user.dart';
import 'package:flutter_application/presentation/home/home.dart';

class FriendInfo extends StatefulWidget{
  final User friend;
  FriendInfo({required this.friend});

  @override
  _FriendInfoState createState() => _FriendInfoState();
}

class _FriendInfoState extends State<FriendInfo> {
  
  FriendService _friendService = FriendService(friendRepository: FriendRepositoryImpl());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.friend.username),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
          );
          },
        ),
      ),
      body: 
        Container(
          height: 360.0,
          child: Stack(
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
                height: 180.0,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/cover.jpg'),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(10.0)),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: NetworkImage(widget.friend.avatar.isNotEmpty ? widget.friend.avatar : "https://it4788.catan.io.vn/files/avatar-1701276452055-138406189.png"),
                    radius: 70.0,
                  ),
                  SizedBox(height: 20.0),
                  Text(widget.friend.username.isNotEmpty ? widget.friend.username : "(No Name)",
                      style: TextStyle(
                          fontSize: 24.0, fontWeight: FontWeight.bold)),
                  SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                        height: 40.0,
                        width: MediaQuery.of(context).size.width - 80,
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(5.0)),
                        child: Center(
                            child:
                              GestureDetector(
                                onTap: () async {
                                  _handleIsFriend(widget.friend.isFriend);
                                },
                                child: Text(_convertIsFriend(widget.friend.isFriend),
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.0)
                                    )
                              ),
                        )
                      ),
                      Container(
                        height: 40.0,
                        width: 45.0,
                        decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(5.0)),
                        child: Icon(Icons.more_horiz),
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
    );
  }

  String _convertIsFriend(String isFriend){
    switch(isFriend){
      case "0":
        return "Thêm bạn bè";
      case "1":
        return "Bạn bè";
      case "3":
        return "Phản hồi";
    }
    return "";
  }

  void _handleIsFriend(String isFriend) async {
    switch(isFriend){
      case "0":
        await _friendService.setRequestFriend(widget.friend.id);
      case "3":
        await _friendService.setAcceptFriend(widget.friend.id, "1");
    }
  }

}

