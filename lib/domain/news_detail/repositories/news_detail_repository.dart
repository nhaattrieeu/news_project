import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/news_detail.dart';

abstract class NewsDetailRepository {
  Future<Either<Failure, NewsDetail>> getNewsDetail(String id);
}
