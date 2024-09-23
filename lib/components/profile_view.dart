import 'package:flutter/material.dart';
import 'package:lab_exercise/models/user_data.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({
    super.key,
    required this.userPost,
  });

  final UserPost userPost;
  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final UserData userData = UserData();
  bool isCommentBoxVisible = false;
  final TextEditingController commentController = TextEditingController();

  var nametxtStyle = const TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 18,
  );

  var boldtxtStyle = const TextStyle(
    fontWeight: FontWeight.bold,
  );

  var boldtxtStyle1 = const TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 16,
  );

  Widget commentBtn(UserComment userComment) => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(userComment.commentorTime),
        const SizedBox(width: 15),
        const Text('Like'),
        const SizedBox(width: 15),
        const Text('Reply'),
      ],
    ),
  );

  Widget commentDesc(UserComment userComment) => Padding(
    padding: const EdgeInsets.all(10.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(userComment.commentorName, style: boldtxtStyle),
        const SizedBox(height: 5),
        Row(
          children: [
            Text(userComment.commentorContent),
          ],
        ),
      ],
    ),
  );

  Widget commentSpace(UserComment userComment) => Container(
    decoration: const BoxDecoration(
      color: Color.fromARGB(35, 158, 158, 158),
      borderRadius: BorderRadius.all(
        Radius.circular(20),
      ),
    ),
    child: commentDesc(userComment),
  );

  Widget commenterPic(UserComment userComment) => Container(
    padding: const EdgeInsets.symmetric(
      horizontal: 10,
    ),
    child: CircleAvatar(
      radius: 20,
      backgroundImage: AssetImage(userComment.commentorImg),
    ),
  );

  Widget usercommenterLine(UserPost userPost, UserComment userComment) => Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      commenterPic(userComment),
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          commentSpace(userComment),
          commentBtn(userComment),
        ],
      ),
    ],
  );

  Widget userpostdetails(UserComment userComment) => Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      const SizedBox(height: 15),
      usercommenterLine(widget.userPost, userComment),
    ],
  );

  Widget commenters(UserPost userPost) => Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      const Divider(color: Color.fromARGB(86, 158, 158, 158)),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            Text(userPost.numshare, style: boldtxtStyle),
          ],
        ),
      ),
      const SizedBox(height: 15),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            Text('All comments', style: boldtxtStyle1),
            const Icon(Icons.arrow_drop_down),
          ],
        ),
      ),
      const SizedBox(height: 15),
    ],
  );

  Widget buttons(UserPost userPost) => Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      const Divider(color: Color.fromRGBO(158, 158, 158, 0.337)),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton.icon(
              style: TextButton.styleFrom(
                  foregroundColor:
                  (!userPost.isLiked) ? Colors.grey : Colors.blue),
              onPressed: () {},
              icon: const Icon(Icons.thumb_up, size: 20),
              label: const Text('Like'),
            ),
            TextButton.icon(
              style: TextButton.styleFrom(foregroundColor: Colors.grey),
              onPressed: () {
                setState(() {
                  isCommentBoxVisible = !isCommentBoxVisible;
                });
              },
              icon: const Icon(Icons.chat_bubble, size: 20),
              label: const Text('Comment'),
            ),
            TextButton.icon(
              style: TextButton.styleFrom(foregroundColor: Colors.grey),
              onPressed: () {},
              icon: const Icon(Icons.share),
              label: const Text('Share'),
            ),
          ],
        ),
      ),
      const Divider(color: Color.fromARGB(86, 158, 158, 158)),
    ],
  );

  Widget commentInputBox() {
    return isCommentBoxVisible
        ? Padding(
      padding: const EdgeInsets.fromLTRB(10, 5, 10, 20),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: commentController,
              decoration: InputDecoration(
                hintText: 'Write a comment...',
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 15.0,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: const BorderSide(
                    color: Colors.grey,
                    width: 1.5,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: const BorderSide(
                    color: Colors.blue,
                    width: 2.0,
                  ),
                ),
                suffixIcon: IconButton(
                  icon: const Icon(
                    Icons.send,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    setState(() {
                      if (commentController.text.isNotEmpty) {
                        userData.commentList.add(UserComment(
                          commentorName: 'Greendee Roper Panogalon',
                          commentorContent: commentController.text,
                          commentorTime: 'Just now',
                          commentorImg: 'assets/greendee.jpg',
                        ));
                        commentController.clear();
                        isCommentBoxVisible = false;
                      }
                    });
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    )
        : Container();
  }

  Widget userline(UserPost userPost) => Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        child: CircleAvatar(
          radius: 20,
          backgroundImage: AssetImage(userPost.userimg),
        ),
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(userPost.username, style: nametxtStyle),
          Row(
            children: [
              Text(userPost.time),
              const Text(' . '),
              const Icon(Icons.group, size: 16, color: Colors.grey),
            ],
          ),
        ],
      ),
    ],
  );

  Widget postImage(UserPost userPost) => Padding(
    padding: const EdgeInsets.all(10.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            Text(userPost.postcontent),
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        Container(
          height: 350,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(userPost.posting),
              fit: BoxFit.fill,
            ),
          ),
        ),
      ],
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        bottomOpacity: 0.0,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.grey,
          ),
        ),
      ),
      body: ListView(
        children: [
          userline(widget.userPost),
          postImage(widget.userPost),
          buttons(widget.userPost),
          commenters(widget.userPost),
          ListView(
            shrinkWrap: true,
            children: userData.commentList.map((userComment) {
              return userpostdetails(userComment);
            }).toList(),
          ),
          commentInputBox(),
        ],
      ),
    );
  }
}