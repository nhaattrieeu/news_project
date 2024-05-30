part of 'news_detail_cubit.dart';

enum NewsDetailStatus { init, loading, loaded, error }

final class NewsDetailState extends Equatable {
  final NewsDetailStatus status;
  final NewsDetail newsDetail;

  const NewsDetailState({required this.status, required this.newsDetail});

  NewsDetailState copyWith({
    NewsDetailStatus? status,
    NewsDetail? newsDetail,
  }) {
    return NewsDetailState(
      status: status ?? this.status,
      newsDetail: newsDetail ?? this.newsDetail,
    );
  }

  @override
  List<Object?> get props => [newsDetail, status];
}
