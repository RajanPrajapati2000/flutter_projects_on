


class User{
  final String imageUrl;
  final String userId;
  final String username;
  final String email;

  User({
    required this.username,
    required this.userId,
    required this.imageUrl,
    required this.email
});

factory User.fromJson(Map<String, dynamic> json){

  return User(
      username: json['username'],
      userId: json['userId'],
      imageUrl: json['imageUrl'],
      email: json['email']
  );

}

}