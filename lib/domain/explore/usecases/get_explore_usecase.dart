import 'package:dartz/dartz.dart';
import 'package:news_project/core/error/failures.dart';
import 'package:news_project/core/usecases/usecase.dart';

import '../entities/explore.dart';
import '../repositories/explore_repository.dart';

class GetExploreUseCase implements UseCaseWithoutParams<Explore> {
  final ExploreRepository repository;

  GetExploreUseCase(this.repository);

  @override
  Future<Either<Failure, Explore>> call() async {
    return await repository.getExplore();
  }
}
