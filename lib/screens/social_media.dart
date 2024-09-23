import 'package:flutter/material.dart';
import 'package:lab_exercise/components/friend_list.dart';
import 'package:lab_exercise/components/info_header.dart';
import 'package:lab_exercise/components/main_header.dart';
import 'package:lab_exercise/components/posts_list.dart';
import 'package:lab_exercise/models/user_data.dart';

class SocialMedia extends StatefulWidget {
  const SocialMedia({super.key});

  @override
  State<SocialMedia> createState() => _SocialMediaScreenState();
}

class _SocialMediaScreenState extends State<SocialMedia> {
  UserData userData = UserData();
  var followTxtTyle = const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        children: [
          MainHeader(userData: userData),
          InfoHeader(userData: userData),
          FriendList(userData: userData),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Row(
              children: [
                Text('Posts', style: followTxtTyle),
              ],
            ),
          ),
          const SizedBox(height: 20),
          PostsList(userData: userData),
        ],
      ),
    );
  }
}
