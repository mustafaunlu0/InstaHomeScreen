import 'package:flutter/material.dart';
import 'package:flutter_insta_app/model/story.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'model/post.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      
      children: [
        StorySection([
          Story("assets/ragnar.jpg", "Your story", isProfile: true),
          Story("assets/unkown.jpg", "big_boss."),
          Story("assets/sau.png", "sakaryauni"),
          Story("assets/dayim.png", "dayi"),
          Story("assets/wick.jpg", "johnwick"),
          Story("assets/punisher.jpg", "punisher"),
        ]),
        PostSection([
          Post(
              "assets/punisher.jpg",
              "mustunlu0",
              "assets/ragnar.jpg",
              "punisher",
              "goat - messi",
              "assets/unkown.jpg",
              "assets/dayim.png",
              "dayi",
              "221.321",
              "Maybe the best of future",
              "2312",
              "43",
              isLiked: true),
               Post(
              "assets/ragnar.jpg",
              "kingofnorth",
              "assets/ragnar.jpg",
              "mustunlu0",
              "Original - I will die",
              "assets/sau.png",
              "assets/punisher.jpg",
              "punisher",
              "91.350",
              "Who wants to be king?",
              "632",
              "53"),
        ])
      ],
    );
  }

  List<Widget> toPostItems(List<Post> posts) {
    List<Widget> postItems = [];
    for (var post in posts) {
      postItems.add(PostItem(post));
    }
    return postItems;
  }

  Widget PostSection(List<Post> posts) {
    return Material(
      
      borderRadius: BorderRadius.circular(16),
      elevation: 4,
      child: Container(
        width: double.infinity,
        color: Colors.black,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: toPostItems(posts)),
      ),
    );
  }

  PostItem(Post post) {
    return Column(
      
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        UserTitle(post.postProfileImage, post.postUsername, post.sarki),
        Divider(
          color: Color.fromARGB(255, 51, 49, 49),
        ),
        PostImage(post.postImage),
        UserActions(post.isLiked),
        LikedInfo(post.likedImage, post.likedUsername, post.likedNumbers),
        PostInfo(post.postUsername, post.postDesc),
        OtherInfo(post.commentNumbers, post.profileImage, post.postMinute),
        
      ],
    );
  }

  Widget UserTitle(String profileImage, String username, String sarki) {
    return Padding(
      padding: EdgeInsets.only(top: 8, left: 8, bottom: 2),
      child: Row(
        children: [
          //Profile Photo
          Stack(children: [
            Container(
              height: 45,
              width: 45,
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                    width: 4,
                  ),
                  borderRadius: BorderRadius.circular(40),
                  image: DecorationImage(
                      image: AssetImage(profileImage), fit: BoxFit.cover)),
            ),
          ]),
          //Profile Info

          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  username,
                  style: TextStyle(
                      letterSpacing: 0.7, fontWeight: FontWeight.bold),
                ),
                Text(
                  sarki,
                  style: TextStyle(letterSpacing: 0.7),
                ),
              ],
            ),
          ),
          //Option

          Expanded(
            child: Container(
              alignment: Alignment.topRight,
              child: IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    "assets/menu_dot.svg",
                    colorFilter:
                        ColorFilter.mode(Colors.white, BlendMode.srcIn),
                        height: 30,
                  )),
            ),
          ),
        ],
      ),
    );
  }

  Widget PostImage(String postImage) {
    return Container(
      width: double.infinity,
      height: 350,
      decoration: BoxDecoration(
          image:
              DecorationImage(image: AssetImage(postImage), fit: BoxFit.cover)),
    );
  }

  Widget UserActions(bool? isLiked) {
    //Kullanıcı Actionları Oluşturulacak beğeni yorum direct
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Icon(
                  isLiked != null ? Icons.favorite : Icons.favorite_border,
                  color: isLiked != null ? Colors.redAccent : Colors.white,
                  size: 32,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    "assets/comment.svg",
                    colorFilter:
                        ColorFilter.mode(Colors.white, BlendMode.srcIn),
                    width: 28,
                    height: 28,
                  ),
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  "assets/direct.svg",
                  colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
                  width: 32,
                  height: 32,
                ),
              ),
            ],
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            "assets/save.svg",
            colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
            width: 28,
            height: 28,
          ),
        ),
      ],
    );
  }

  Widget LikedInfo(
      String likedImage, String likedUsername, String likedNumbers) {
    return Padding(
      padding: EdgeInsets.only(left: 10),
      child: Row(
        children: [
          Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(60),
                image: DecorationImage(
                    image: AssetImage(likedImage), fit: BoxFit.cover)),
          ),
          Padding(padding: EdgeInsets.only(left: 5), child: Text("Liked by ")),
          Text(
            likedUsername,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(" and $likedNumbers others")
        ],
      ),
    );
  }

  Widget PostInfo(String username, String desc) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Row(
        children: [
          Text(
            username,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text("  $desc"),
        ],
      ),
    );
  }

  Widget OtherInfo(String commentNumbers, String userImage, String postMinute) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 10),
          child: Text(
            "View all $commentNumbers comments",
            style: TextStyle(color: Colors.grey),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(10),
          child: Row(
            children: [
              Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(60),
                    image: DecorationImage(
                        image: AssetImage(userImage), fit: BoxFit.cover)),
              ),
              Padding(
                padding: EdgeInsets.only(left: 5),
                child: Text(
                  " Add a comment...",
                  style: TextStyle(color: Colors.grey),
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 5,bottom: 20),
          child: Row(
            children: [
              Text(
                " $postMinute minutes ago •",
                style: TextStyle(color: Colors.grey, fontSize: 11),
              ),
              Text(
                " See translation",
                style: TextStyle(color: Colors.white, fontSize: 11),
              ),
            ],
          ),
        )
      ],
    );
  }

  List<Widget> toStoryItems(List<Story> resimler) {
    List<Widget> storyItems = [];
    for (var resim in resimler) {
      storyItems.add(StoryItem(resim.imagePath, resim.isProfile, resim.desc));
    }
    return storyItems;
  }

  Widget StorySection(List<Story> resimler) {
    return Container(
      width: double.infinity,
      color: Colors.black,
      height: 110,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: toStoryItems(resimler),
      ),
    );
  }

  Widget StoryItem(String imagePath, bool? first, String desc) {
    return Padding(
      padding: EdgeInsets.only(left: 10, top: 5, bottom: 5),
      child: Column(
        children: [
          Stack(
            children: [
              Stack(children: [
                Container(
                  height: 65,
                  width: 65,
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                        width: 4,
                      ),
                      borderRadius: BorderRadius.circular(40),
                      image: DecorationImage(
                          image: AssetImage(imagePath), fit: BoxFit.cover)),
                ),
                first == null
                    ? Container(
                        height: 66,
                        width: 65,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.red,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(40),
                        ),
                      )
                    : SizedBox()
              ]),
              first != null
                  ? Positioned(
                      top: 40,
                      left: 40,
                      child: Container(
                        width: 25,
                        height: 25,
                        decoration: BoxDecoration(
                            border: Border.all(width: 3, color: Colors.black),
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(40)),
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    )
                  : SizedBox()
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 8),
            child: Text(
              desc,
              style: TextStyle(letterSpacing: 0.7),
            ),
          )
        ],
      ),
    );
  }
}
