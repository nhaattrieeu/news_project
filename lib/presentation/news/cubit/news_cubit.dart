import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:news_project/domain/news/entities/news_home.dart';

import '../../../domain/news/usecases/get_news_home_usecase.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  final GetNewsHomeUseCase _getNewsHomeUseCase;

  NewsCubit(this._getNewsHomeUseCase) : super(NewsInitial());

  void getNewsHomeData() async {
    final failureOrData = await _getNewsHomeUseCase();
    failureOrData.fold(
      (failure) => emit(NewsError()),
      (data) => emit(NewsLoaded(data)),
    );
  }
}
