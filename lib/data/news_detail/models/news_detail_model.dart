import '../../../domain/news_detail/entities/news_detail.dart';
import 'author_detail_model.dart';

class NewsDetailModel extends NewsDetail {
  const NewsDetailModel({
    required super.id,
    required super.title,
    required super.content,
    required super.image,
    required super.author,
    required super.numOfLove,
    required super.numOfComment,
    required super.createdAt,
    required super.love,
    required super.bookmark,
  });

  factory NewsDetailModel.fromJson(Map<String, dynamic> json) {
    return NewsDetailModel(
      id: json["id"],
      title: json["title"],
      content: json["content"],
      image: json["image"],
      numOfLove: json["num_of_love"],
      numOfComment: json["num_of_comment"],
      author: AuthorDetailModel.fromJson(json["author"]),
      createdAt: json["created_at"],
      love: json["love"],
      bookmark: json["bookmark"],
    );
  }
}
