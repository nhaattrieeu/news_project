import 'package:dartz/dartz.dart';

import '../../../core/error/failures.dart';
import '../../../core/usecases/usecase.dart';
import '../entities/news.dart';
import '../repositories/news_repository.dart';

class GetTrendingUseCase implements UseCaseWithoutParams<News> {
  final NewsRepository repository;

  GetTrendingUseCase({required this.repository});

  @override
  Future<Either<Failure, News>> call() async {
    return await repository.getTrending();
  }
}
