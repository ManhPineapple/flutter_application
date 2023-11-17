import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PostScreen extends StatelessWidget {
  // This widget is the root of your application.
  String userImage = 'assets/avatar.jpeg';
  String username, caption;
  String timeAgo = "time";
  String like = "1";
  String comments = "2";
  String shares = "3";
  String imageURL = 'assets/content.jpeg';
  PostScreen({super.key, required this.username, required this.caption, required this.timeAgo, required this.like, required this.comments, required this.shares});

  @override
  Widget build(BuildContext context) {
    return PostScreenPage(
      userImage: this.userImage,
      username: this.username,
      caption: this.caption,
      timeAgo: this.timeAgo,
      imageURL: this.imageURL,
      like: this.like,
      comments: this.comments,
      shares: this.shares
    );
  }
}

class PostScreenPage extends StatefulWidget {
  String username, caption, timeAgo, userImage, imageURL, like, comments, shares;
  PostScreenPage(
      {super.key,
      required this.userImage,
      required this.username,
      required this.timeAgo,
      required this.caption,
      required this.imageURL,
      required this.like,
      required this.comments,
      required this.shares});
  @override
  _PostScreenState createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreenPage> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _PostHeader(
                    profileImage: widget.userImage,
                    username: widget.username,
                    timeAgo: widget.timeAgo,
                  ),
                  const SizedBox(height: 4.0),
                  Text(widget.caption),
                  widget.imageURL != null
                      ? const SizedBox.shrink()
                      : const SizedBox(height: 6.0),
                ],
              ),
            ),
            widget.imageURL != null
                ? Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Image.asset(widget.imageURL),
                  )
                : const SizedBox.shrink(),
            _PostFooter()
          ],
        ),
      ),
    );
  }
}

class _PostHeader extends StatelessWidget {
  final String profileImage;
  final String username;
  final String timeAgo;
  const _PostHeader({
    super.key,
    required this.profileImage,
    required this.username,
    required this.timeAgo,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _AvatarImage(
          profileAvatarImage: profileImage,
        ),
        const SizedBox(width: 8.0),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                username,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
              Row(
                children: [
                  Text(
                    '${timeAgo} • ',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 12.0,
                    ),
                  ),
                  Icon(
                    Icons.public,
                    color: Colors.grey[600],
                    size: 12.0,
                  )
                ],
              ),
            ],
          ),
        ),
        IconButton(
          icon: const Icon(Icons.more_horiz),
          onPressed: () => print('More'),
        ),
      ],
    );
  }
}

class _AvatarImage extends StatelessWidget {
  final String profileAvatarImage;

  const _AvatarImage({
    super.key,
    required this.profileAvatarImage,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
      child: Stack(children: [
        CircleAvatar(
          radius: 20.0,
          backgroundColor: Colors.grey[200],
          backgroundImage: AssetImage(profileAvatarImage),
        ),
        Positioned(
          bottom: 0.0,
          right: 0.0,
          child: Container(
            height: 15.0,
            width: 15.0,
            decoration: BoxDecoration(
              color: Color(0xFF50b525),
              shape: BoxShape.circle,
              border: Border.all(
                width: 2.0,
                color: Colors.white,
              ),
            ),
          ),
        )
      ]),
    );
  }
}

class _PostFooter extends StatelessWidget {
  final String like = "1";
  final String comments = "2";
  final String shares = "3";

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround, // Dàn trải các cột
        children: [
          buildFooterColumn(FontAwesomeIcons.thumbsUp, "Thích", "$like lượt thích"),
          buildFooterColumn(FontAwesomeIcons.comment, "Bình luận", "$comments bình luận"),
          buildFooterColumn(FontAwesomeIcons.paperPlane, "Chia sẻ", "$shares lượt chia sẻ"),
        ],
      ),
    );
  }

  Column buildFooterColumn(IconData icon, String label, String value) {
    return Column(
      children: [
        Padding(padding: EdgeInsets.only(bottom: 5),
        child: Text(value)
        ),
        Row(
          children: [
            Padding(
              padding: EdgeInsets.only(right: 5),
              child: Icon(icon),
            ),
            Text(label),
          ],
        ),
      ],
    );
  }
}
