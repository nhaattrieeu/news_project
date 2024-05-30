import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/news_detail/entities/news_detail.dart';
import '../../../domain/news_detail/usecases/get_news_detail_usecase.dart';

part 'news_detail_state.dart';

class NewsDetailCubit extends Cubit<NewsDetailState> {
  final GetNewsDetailUseCase getNewsDetailUseCase;

  NewsDetailCubit(this.getNewsDetailUseCase)
      : super(const NewsDetailState(
          status: NewsDetailStatus.init,
          newsDetail: NewsDetail.empty,
        ));

  void getNewsDetailData(String id) async {
    emit(state.copyWith(
      status: NewsDetailStatus.loading,
      newsDetail: NewsDetail.empty,
    ));
    final failureOrData = await getNewsDetailUseCase(id);
    failureOrData.fold(
      (failure) => emit(state.copyWith(status: NewsDetailStatus.error)),
      (data) => emit(
          state.copyWith(status: NewsDetailStatus.loaded, newsDetail: data)),
    );
  }

  void followButtonClick() {
    NewsDetail current = state.newsDetail;
    emit(
      state.copyWith(
        newsDetail: current.copyWith(
          author: current.author.copyWith(
            follow: !current.author.follow,
          ),
        ),
      ),
    );
  }

  void loveButtonClick() {
    NewsDetail current = state.newsDetail;
    emit(
      state.copyWith(
        newsDetail: current.copyWith(
          love: !current.love,
          numOfLove:
              current.love ? current.numOfLove - 1 : current.numOfLove + 1,
        ),
      ),
    );
  }

  void bookmarkButtonClick() {
    NewsDetail current = state.newsDetail;
    emit(
      state.copyWith(
        newsDetail: current.copyWith(
          bookmark: !current.bookmark,
        ),
      ),
    );
  }
}
