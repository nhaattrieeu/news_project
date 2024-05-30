import '../../../domain/news_detail/entities/author_detail.dart';

class AuthorDetailModel extends AuthorDetail {
  const AuthorDetailModel({
    required super.id,
    required super.username,
    required super.fullName,
    required super.avatar,
    required super.follow,
  });

  factory AuthorDetailModel.fromJson(Map<String, dynamic> json) {
    return AuthorDetailModel(
      id: json["id"],
      username: json["username"],
      fullName: json["full_name"],
      avatar: json["avatar"],
      follow: json["follow"],
    );
  }
}
