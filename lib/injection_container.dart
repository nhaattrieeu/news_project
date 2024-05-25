import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'data/news/datasources/remote/news_remote_data_source.dart';
import 'data/news/repositories/news_repository_impl.dart';
import 'domain/news/repositories/news_repository.dart';
import 'domain/news/usecases/get_news.dart';
import 'domain/news/usecases/get_trending.dart';
import 'presentation/news/cubit/news_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //cubit
  sl.registerFactory<NewsCubit>(
      () => NewsCubit(getNewsUseCase: sl(), getTrendingUseCase: sl()));

  //use case
  sl.registerLazySingleton<GetNewsUseCase>(
      () => GetNewsUseCase(repository: sl()));
  sl.registerLazySingleton<GetTrendingUseCase>(
      () => GetTrendingUseCase(repository: sl()));

  //repository
  sl.registerLazySingleton<NewsRepository>(
    () => NewsRepositoryImpl(remoteDataSource: sl()),
  );

  //data source
  sl.registerLazySingleton<NewsRemoteDataSource>(
    () => NewsRemoteDataSourceImpl(dio: sl()),
  );

  //external
  sl.registerLazySingleton<Dio>(() => Dio());
}
