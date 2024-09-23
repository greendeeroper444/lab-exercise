import 'package:flutter/material.dart';
import 'package:lab_exercise/components/profile_view.dart';
import 'package:lab_exercise/models/user_data.dart';

class PostsList extends StatefulWidget {
  const PostsList({super.key, required this.userData});

  final UserData userData;

  @override
  State<PostsList> createState() => _PostsListState();
}

class _PostsListState extends State<PostsList> {
  var nametxtStyle = const TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 16,
  );

  gotoPage(BuildContext context, dynamic page) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => page,
    ));
  }

  Widget buttons(UserPost userPost) => Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      TextButton.icon(
        style: TextButton.styleFrom(
          foregroundColor: (userPost.isLiked) ? Colors.blue : Colors.grey,
        ),
        onPressed: () {
          setState(() {
            userPost.isLiked = (userPost.isLiked) ? false : true;
          });
        },
        icon: const Icon(Icons.thumb_up),
        label: const Text('Like'),
      ),
      TextButton.icon(
        style: TextButton.styleFrom(
          foregroundColor: Colors.grey,
        ),
        onPressed: () {},
        icon: const Icon(Icons.message),
        label: const Text('Comment'),
      ),
      TextButton.icon(
        style: TextButton.styleFrom(
          foregroundColor: Colors.grey,
        ),
        onPressed: () {},
        icon: const Icon(Icons.share),
        label: const Text('Share'),
      ),
    ],
  );
  Widget postCount(UserPost userPost) => Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      Text(
        ' ${userPost.numcomments}',
      ),
      const Text(' . '),
      Text(
        ' ${userPost.numshare}',
      )
    ],
  );

  Widget postImage(UserPost userPost) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: Container(
      height: 350,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(userPost.posting),
          fit: BoxFit.fill,
        ),
      ),
    ),
  );

  Widget postHeader(UserPost userPost) => Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        child: CircleAvatar(
          radius: 20,
          backgroundImage: AssetImage(
            userPost.userimg,
          ),
        ),
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            userPost.username,
            style: nametxtStyle,
          ),
          Row(
            children: [
              Text('${userPost.time} . '),
              const Icon(
                Icons.people,
                size: 18,
              ),
            ],
          ),
        ],
      ),
    ],
  );

  Widget showPost(UserPost userPost) => Column(
    children: [
      postHeader(userPost),
      Container(
        margin: const EdgeInsets.all(8),
        child: Row(
          children: [
            Text(
              userPost.postcontent,
              style: nametxtStyle,
            ),
          ],
        ),
      ),
      postImage(userPost),
      postCount(userPost),
      const Divider(),
      buttons(userPost),
      SizedBox(
        height: 10,
        child: Container(
          color: Colors.grey,
        ),
      ),
      const SizedBox(
        height: 15,
      ),
    ],
  );
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: ListView(
        shrinkWrap: true,
        children: widget.userData.userList.map((UserPost) {
          return InkWell(
            onTap: () {
              gotoPage(context, ProfileView(userPost: UserPost));
            },
            child: showPost(UserPost),
          );
        }).toList(),
      ),
    );
  }
}