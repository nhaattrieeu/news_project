import '../data/news/datasources/remote/news_remote_data_source.dart';
import '../data/news/repositories/news_repository_impl.dart';
import '../domain/news/repositories/news_repository.dart';
import '../domain/news/usecases/get_news_home_usecase.dart';
import '../presentation/news/cubit/news_cubit.dart';
import 'di.dart';

void registerNewsFeature() {
  //bloc
  sl.registerFactory<NewsCubit>(() => NewsCubit(sl()));

  //use case
  sl.registerLazySingleton<GetNewsHomeUseCase>(() => GetNewsHomeUseCase(sl()));

  //repository
  sl.registerLazySingleton<NewsRepository>(
      () => NewsRepositoryImpl(remoteDataSource: sl()));

  //data source
  sl.registerLazySingleton<NewsRemoteDataSource>(
      () => NewsRemoteDataSourceImpl(dio: sl()));
}
