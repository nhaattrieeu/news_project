part of 'news_cubit.dart';

sealed class NewsState extends Equatable {
  const NewsState();
}

final class NewsInitial extends NewsState {
  @override
  List<Object> get props => [];
}

final class NewsLoading extends NewsState {
  @override
  List<Object> get props => [];
}

final class NewsLoaded extends NewsState {
  final NewsHome newsHome;

  const NewsLoaded(this.newsHome);

  @override
  List<Object> get props => [newsHome];
}

final class NewsError extends NewsState {
  @override
  List<Object> get props => [];
}
