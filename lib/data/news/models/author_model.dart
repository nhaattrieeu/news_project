import '../../../domain/news/entities/author.dart';

class AuthorModel extends Author {
  const AuthorModel({required super.fullName, required super.avatar});

  factory AuthorModel.fromJson(Map<String, dynamic> json) {
    return AuthorModel(
      fullName: json["full_name"],
      avatar: json["avatar"],
    );
  }
}
