import 'package:flutter/material.dart';
import 'package:lab_exercise/models/user_data.dart';

class FriendList extends StatefulWidget {
  FriendList({super.key, required this.userData});

  final UserData userData;

  @override
  State<FriendList> createState() => _FriendListState();
}

class _FriendListState extends State<FriendList> {
  var followTxtStyle = const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  Widget friend(Friend friend) => Card(
    child: Column(
      children: [
        Expanded(
          child: Image.asset(
            friend.img,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(friend.name),
        ),
      ],
    ),
  );

  Widget friendListGrid() => GridView.builder(
    shrinkWrap: true,
    physics: const BouncingScrollPhysics(),
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 3,
      mainAxisExtent: 180,
    ),
    itemCount: widget.userData.friendList.length,
    itemBuilder: (BuildContext ctx, index) {
      return friend(widget.userData.friendList[index]);
    },
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Row(
            children: [
              Text(
                'Friends',
                style: followTxtStyle,
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Row(
            children: [
              Text('${widget.userData.myUserAccount.numFriends} Friends'),
            ],
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 380,
          child: friendListGrid(),
        ),
        SizedBox(
          height: 10,
          child: Container(
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}