import 'package:dartz/dartz.dart';

import '../../../core/error/failures.dart';
import '../../../core/usecases/usecase.dart';
import '../entities/news_detail.dart';
import '../repositories/news_detail_repository.dart';

class GetNewsDetailUseCase implements UseCaseWithParams<NewsDetail, String> {
  final NewsDetailRepository repository;

  GetNewsDetailUseCase(this.repository);

  @override
  Future<Either<Failure, NewsDetail>> call(String params) async {
    return await repository.getNewsDetail(params);
  }
}
