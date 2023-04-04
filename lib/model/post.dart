class Post {
  String postProfileImage;
  String postUsername;
  String profileImage;
  String profileUsername;
  String sarki;
  String postImage;
  bool? isLiked;
  String likedImage;
  String likedUsername;
  String likedNumbers;
  String postDesc;
  String commentNumbers;
  String postMinute;

  Post(
      this.postProfileImage,
      this.postUsername,
      this.profileImage,
      this.profileUsername,
      this.sarki,
      this.postImage,
      this.likedImage,
      this.likedUsername,
      this.likedNumbers,
      this.postDesc,
      this.commentNumbers,
      this.postMinute,
      {this.isLiked});
}
