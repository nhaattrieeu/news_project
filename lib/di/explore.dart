import 'package:news_project/domain/explore/repositories/explore_repository.dart';
import 'package:news_project/domain/explore/usecases/get_explore_usecase.dart';

import '../data/explore/datasources/remote/explore_remote_data_source.dart';
import '../data/explore/explore_repository_impl.dart';
import '../presentation/explore/cubit/explore_cubit.dart';
import 'di.dart';

void registerExploreFeature() {
  //bloc
  sl.registerFactory<ExploreCubit>(() => ExploreCubit(sl()));

  //use case
  sl.registerLazySingleton<GetExploreUseCase>(() => GetExploreUseCase(sl()));

  //repository
  sl.registerLazySingleton<ExploreRepository>(
      () => ExploreRepositoryImpl(remoteDataSource: sl()));

  //data source
  sl.registerLazySingleton<ExploreRemoteDataSource>(
      () => ExploreRemoteDataSourceImpl(dio: sl()));
}
