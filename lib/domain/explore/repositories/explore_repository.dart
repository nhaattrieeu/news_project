import 'package:dartz/dartz.dart';

import '../../../core/error/failures.dart';
import '../entities/explore.dart';

abstract class ExploreRepository {
  Future<Either<Failure, Explore>> getExplore();
}
