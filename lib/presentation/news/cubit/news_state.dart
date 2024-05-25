part of 'news_cubit.dart';

enum NewsStatus { initial, loading, success, failure }

final class NewsState extends Equatable {
  final List<News> latest;
  final News trending;
  final NewsStatus status;

  const NewsState({
    required this.latest,
    required this.trending,
    required this.status,
  });

  NewsState copyWith({
    List<News>? latest,
    News? trending,
    NewsStatus? status,
  }) {
    return NewsState(
      latest: latest ?? this.latest,
      trending: trending ?? this.trending,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [latest, trending, status];
}
