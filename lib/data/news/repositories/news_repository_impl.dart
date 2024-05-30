import 'package:dartz/dartz.dart';
import 'package:news_project/domain/news/entities/news_home.dart';

import '../../../../core/error/exceptions.dart';
import '../../../core/error/failures.dart';
import '../../../domain/news/repositories/news_repository.dart';
import '../datasources/remote/news_remote_data_source.dart';

class NewsRepositoryImpl implements NewsRepository {
  final NewsRemoteDataSource remoteDataSource;

  NewsRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, NewsHome>> getNewsHome() async {
    try {
      final remoteData = await remoteDataSource.getNewsHome();
      return Right(remoteData);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
