import 'package:equatable/equatable.dart';
import 'package:news_project/domain/explore/entities/author.dart';
import 'package:news_project/domain/news/entities/news.dart';

class Explore extends Equatable {
  final List<Author> authors;
  final List<News> popular;

  const Explore({required this.authors, required this.popular});

  Explore copyWith({
    List<Author>? authors,
    List<News>? popular,
  }) {
    return Explore(
      authors: authors ?? this.authors,
      popular: popular ?? this.popular,
    );
  }

  static const empty = Explore(authors: [], popular: []);

  @override
  List<Object> get props => [authors];
}
