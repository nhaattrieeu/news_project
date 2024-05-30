import 'package:dartz/dartz.dart';
import 'package:news_project/domain/news/entities/news_home.dart';

import '../../../../core/error/failures.dart';

abstract class NewsRepository {
  Future<Either<Failure, NewsHome>> getNewsHome();
}
