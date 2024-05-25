import '../../../domain/news/entities/news.dart';
import 'author_model.dart';

class NewsModel extends News {
  const NewsModel({
    required super.id,
    required super.title,
    required super.image,
    required super.createdAt,
    required super.author,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      id: json["id"],
      title: json["title"],
      image: json["image"],
      createdAt: json["created_at"],
      author: AuthorModel.fromJson(json["author"]),
    );
  }
}
