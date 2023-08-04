class Post {
  int id;
  int userId;
  String title;
  String body;

  Post({
    required this.id,
    required this.userId,
    required this.title,
    required this.body,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'] as int,
      userId: json['userId'] as int,
      title: json['title'] as String,
      body: json['body'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'title': title,
      'body': body,
    };
  }
}






































//
// class PostDataModel {
//   int userId;
//   int id;
//   String title;
//   String body;
//
//   PostDataModel({
//     required this.userId,
//     required this.id,
//     required this.title,
//     required this.body,
//   });
//
//   factory PostDataModel.fromJson(Map<String, dynamic> json) {
//     return PostDataModel(
//       userId: json['userId'] as int,
//       id: json['id'] as int,
//       title: json['title'] as String,
//       body: json['body'] as String,
//     );
//   }
// }

