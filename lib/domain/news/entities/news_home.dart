import 'package:equatable/equatable.dart';
import 'package:news_project/domain/news/entities/news.dart';

class NewsHome extends Equatable {
  final News trending;
  final List<News> latest;

  const NewsHome({required this.trending, required this.latest});

  @override
  List<Object> get props => [trending, latest];
}
