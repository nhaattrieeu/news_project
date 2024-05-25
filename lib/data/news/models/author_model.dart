import '../../../domain/news/entities/author.dart';

class AuthorModel extends Author {
  const AuthorModel({
    required super.id,
    required super.username,
    required super.fullName,
    required super.avatar,
  });

  factory AuthorModel.fromJson(Map<String, dynamic> json) {
    return AuthorModel(
      id: json["id"],
      username: json["username"],
      fullName: json["full_name"],
      avatar: json["avatar"],
    );
  }
}
