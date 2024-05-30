import 'package:news_project/data/news/models/news_model.dart';
import 'package:news_project/domain/news/entities/news_home.dart';

class NewsHomeModel extends NewsHome {
  const NewsHomeModel({required super.trending, required super.latest});

  factory NewsHomeModel.fromJson(Map<String, dynamic> json) {
    List<dynamic> data = json["latest"];
    return NewsHomeModel(
      trending: NewsModel.fromJson(json["trending"]),
      latest: data.map((e) => NewsModel.fromJson(e)).toList(),
    );
  }
}
