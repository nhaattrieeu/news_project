import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/news/entities/news.dart';
import '../../../domain/news/usecases/get_news.dart';
import '../../../domain/news/usecases/get_trending.dart';
part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  final GetNewsUseCase getNewsUseCase;
  final GetTrendingUseCase getTrendingUseCase;

  NewsCubit({
    required this.getNewsUseCase,
    required this.getTrendingUseCase,
  }) : super(const NewsState(
          latest: [],
          trending: News.empty,
          status: NewsStatus.initial,
        ));

  Future<void> getNewsData() async {
    final failureOrData = await getNewsUseCase();
    failureOrData.fold(
      (failure) => print(failure),
      (data) {
        emit(state.copyWith(latest: data));
      },
    );
  }

  Future<void> getTrendingData() async {
    final failureOrData = await getTrendingUseCase();
    failureOrData.fold(
      (failure) => print(failure),
      (data) => emit(state.copyWith(trending: data)),
    );
  }
}
