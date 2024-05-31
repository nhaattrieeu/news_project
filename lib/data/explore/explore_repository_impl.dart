import 'package:dartz/dartz.dart';
import 'package:news_project/core/error/failures.dart';
import 'package:news_project/data/explore/datasources/remote/explore_remote_data_source.dart';
import 'package:news_project/domain/explore/entities/explore.dart';
import 'package:news_project/domain/explore/repositories/explore_repository.dart';

import '../../core/error/exceptions.dart';

class ExploreRepositoryImpl implements ExploreRepository {
  final ExploreRemoteDataSource remoteDataSource;

  ExploreRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, Explore>> getExplore() async {
    try {
      final remoteData = await remoteDataSource.getExplore();
      return Right(remoteData);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
