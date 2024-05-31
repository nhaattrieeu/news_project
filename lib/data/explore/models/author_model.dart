import 'package:news_project/domain/explore/entities/author.dart';

class AuthorModel extends Author {
  const AuthorModel({
    required super.id,
    required super.fullName,
    required super.avatar,
    required super.follow,
  });

  factory AuthorModel.fromJson(Map<String, dynamic> json) {
    return AuthorModel(
      id: json["id"],
      fullName: json["full_name"],
      avatar: json["avatar"],
      follow: json["follow"],
    );
  }
}
