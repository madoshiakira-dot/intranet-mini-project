class PostModel {
  String id;
  String userId;
  String text;
  String imageUrl;
  int likes;
  DateTime createdAt;

  PostModel({
    required this.id,
    required this.userId,
    required this.text,
    required this.imageUrl,
    required this.likes,
    required this.createdAt,
  });
}
