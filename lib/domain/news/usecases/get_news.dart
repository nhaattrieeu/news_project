import 'package:dartz/dartz.dart';

import '../../../core/error/failures.dart';
import '../../../core/usecases/usecase.dart';
import '../entities/news.dart';
import '../repositories/news_repository.dart';

class GetNewsUseCase implements UseCaseWithoutParams<List<News>> {
  final NewsRepository repository;

  GetNewsUseCase({required this.repository});

  @override
  Future<Either<Failure, List<News>>> call() async {
    return await repository.getNews();
  }
}
