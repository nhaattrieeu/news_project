import 'package:dartz/dartz.dart';

import '../../../../core/error/exceptions.dart';
import '../../../core/error/failures.dart';
import '../../../domain/news/entities/news.dart';
import '../../../domain/news/repositories/news_repository.dart';
import '../datasources/remote/news_remote_data_source.dart';

class NewsRepositoryImpl implements NewsRepository {
  final NewsRemoteDataSource remoteDataSource;

  NewsRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<News>>> getNews() async {
    try {
      final remoteData = await remoteDataSource.getNews();
      return Right(remoteData);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, News>> getTrending() async {
    try {
      final remoteData = await remoteDataSource.getTrending();
      return Right(remoteData);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
