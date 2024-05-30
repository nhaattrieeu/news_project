import 'package:dartz/dartz.dart';

import '../../../../core/error/exceptions.dart';
import '../../../core/error/failures.dart';
import '../../../domain/news_detail/entities/news_detail.dart';
import '../../../domain/news_detail/repositories/news_detail_repository.dart';
import '../datasources/remote/news_detail_remote_data_source.dart';

class NewsDetailRepositoryImpl implements NewsDetailRepository {
  final NewsDetailRemoteDataSource remoteDataSource;

  NewsDetailRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, NewsDetail>> getNewsDetail(String id) async {
    try {
      final remoteData = await remoteDataSource.getNewsDetail(id);
      return Right(remoteData);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
