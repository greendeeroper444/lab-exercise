class Friend {
  final String img;
  final String name;

  Friend({
    required this.img,
    required this.name,
  });
}

class Account {
  final String name;
  final String email;
  final String img;
  final String numFollowers;
  final String numPosts;
  final String numFollowing;
  final String numFriends;

  Account({
    required this.name,
    required this.email,
    required this.img,
    required this.numFollowers,
    required this.numPosts,
    required this.numFollowing,
    required this.numFriends,
  });
}

class UserPost {
  final String userimg;
  final String username;
  final String time;
  final String postcontent;
  final String posting;
  final String numcomments;
  final String numshare;
  bool isLiked;

  UserPost({
    required this.userimg,
    required this.username,
    required this.time,
    required this.postcontent,
    required this.posting,
    required this.numcomments,
    required this.numshare,
    required this.isLiked,
  });
}

class UserComment {
  final String commentorImg;
  final String commentorName;
  final String commentorTime;
  final String commentorContent;

  UserComment({
    required this.commentorImg,
    required this.commentorName,
    required this.commentorTime,
    required this.commentorContent,
  });
}

class UserData {
  List<UserPost> userList = [
    UserPost(
      userimg: 'assets/greendee.jpg',
      username: 'Greendee Roper Panogalon',
      time: '2 hrs ago',
      postcontent: 'code sata sa activity ni sir 😎',
      posting: 'assets/greendeepost.png',
      numcomments: '50 comments',
      numshare: '90 shares   ',
      isLiked: false,
    ),
    UserPost(
      userimg: 'assets/emil.jpg',
      username: 'Emil Anasco',
      time: 'An hour ago',
      postcontent: 'Coding po ☕',
      posting: 'assets/coding.png',
      numcomments: '4k comments',
      numshare: '120 shares   ',
      isLiked: false,
    ),
    UserPost(
      userimg: 'assets/jarryl.jpg',
      username: 'Jarryl Jovenir',
      time: '23 minutes ago',
      postcontent: 'mga agaw 😎',
      posting: 'assets/friends.jpg',
      numcomments: '8k comments',
      numshare: '950 shares   ',
      isLiked: false,
    ),
  ];

  List<Friend> friendList = [
    Friend(
      img: 'assets/kyla.jpg',
      name: 'Kyla Jardinico',
    ),
    Friend(
      img: 'assets/rhea.jpg',
      name: 'Rhea Vitualla',
    ),
    Friend(
      img: 'assets/jarryl.jpg',
      name: 'Jarryl Jovenir',
    ),
    Friend(
      img: 'assets/zyrah.jpg',
      name: 'Zyrah Faith Gascon',
    ),
    Friend(
      img: 'assets/emil.jpg',
      name: 'Emil Anasco',
    ),
    Friend(
      img: 'assets/caberto.jpg',
      name: 'Ephraim Cabriel Caberto',
    ),
    Friend(
      img: 'assets/art.jpg',
      name: 'Artjohn Mandras',
    ),
  ];
  List<UserComment> commentList = [
    UserComment(
      commentorImg: 'assets/jarryl.jpg',
      commentorName: 'Jarryl Jovenir',
      commentorTime: '5 minutes ago',
      commentorContent: 'hawda sakong agaw oy',
    ),
    UserComment(
      commentorImg: 'assets/kyla.jpg',
      commentorName: 'Kyla Jardinico',
      commentorTime: '1 hr ago',
      commentorContent: 'ayosa oy',
    ),
    UserComment(
      commentorImg: 'assets/zyrah.jpg',
      commentorName: 'Zyrah Faith Gascon',
      commentorTime: '2 minutes ago',
      commentorContent: 'patudlo ko ana berds',
    ),
  ];

  Account myUserAccount = Account(
    name: 'Greendee Roper Panogalon',
    email: 'panogalon.greendeeroper@dnsc.edu.ph',
    img: 'assets/greendee.jpg',
    numFollowers: '1.4k',
    numPosts: '  100',
    numFollowing: '   32  ',
    numFriends: '234',
  );
}