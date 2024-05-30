import 'package:dartz/dartz.dart';
import 'package:news_project/domain/news/entities/news_home.dart';

import '../../../core/error/failures.dart';
import '../../../core/usecases/usecase.dart';
import '../repositories/news_repository.dart';

class GetNewsHomeUseCase implements UseCaseWithoutParams<NewsHome> {
  final NewsRepository repository;

  GetNewsHomeUseCase(this.repository);

  @override
  Future<Either<Failure, NewsHome>> call() async {
    return await repository.getNewsHome();
  }
}
