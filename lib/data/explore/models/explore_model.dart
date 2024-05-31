import 'package:news_project/data/explore/models/author_model.dart';
import 'package:news_project/data/news/models/news_model.dart';
import 'package:news_project/domain/explore/entities/explore.dart';

class ExploreModel extends Explore {
  const ExploreModel({required super.authors, required super.popular});

  factory ExploreModel.fromJson(Map<String, dynamic> json) {
    List<dynamic> authors = json["author"];
    List<dynamic> popular = json["popular"];
    return ExploreModel(
      authors: authors.map((e) => AuthorModel.fromJson(e)).toList(),
      popular: popular.map((e) => NewsModel.fromJson(e)).toList(),
    );
  }
}
