import 'package:flutter/material.dart';
import 'package:lab_exercise/models/user_data.dart';

class InfoHeader extends StatefulWidget {
  InfoHeader({
    super.key,
    required this.userData,
  });
  final UserData userData;

  @override
  State<InfoHeader> createState() => _InfoHeaderState();
}

class _InfoHeaderState extends State<InfoHeader> {
  var followTxtSyle = const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('Followers'),
            Text('Posts'),
            Text('Following'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              widget.userData.myUserAccount.numFollowers,
              style: followTxtSyle,
            ),
            Text(
              widget.userData.myUserAccount.numPosts,
              style: followTxtSyle,
            ),
            Text(
              widget.userData.myUserAccount.numFollowing,
              style: followTxtSyle,
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        const Divider(
          color: Colors.grey,
        ),
      ],
    );
  }
}