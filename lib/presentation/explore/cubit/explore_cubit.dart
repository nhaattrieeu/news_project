import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:news_project/domain/explore/entities/author.dart';
import 'package:news_project/domain/explore/entities/explore.dart';

import '../../../domain/explore/usecases/get_explore_usecase.dart';

part 'explore_state.dart';

class ExploreCubit extends Cubit<ExploreState> {
  final GetExploreUseCase _getExploreUseCase;

  ExploreCubit(this._getExploreUseCase)
      : super(const ExploreState(
          status: ExploreStatus.init,
          explore: Explore.empty,
        ));

  void getExploreData() async {
    final failureOrData = await _getExploreUseCase();
    failureOrData.fold(
      (failure) => emit(state.copyWith(status: ExploreStatus.error)),
      (data) =>
          emit(state.copyWith(status: ExploreStatus.loaded, explore: data)),
    );
  }

  void followButtonClick(String id) {
    Explore current = state.explore;
    List<Author> authors = List.from(current.authors);
    for (var e in authors) {
      if (e.id == id) {
        Author author = e.copyWith(follow: !e.follow);
        authors[authors.indexOf(e)] = author;
        break;
      }
    }
    emit(state.copyWith(explore: current.copyWith(authors: authors)));
  }
}
