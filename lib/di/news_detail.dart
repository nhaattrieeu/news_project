import '../data/news_detail/datasources/remote/news_detail_remote_data_source.dart';
import '../data/news_detail/repositories/news_detail_repository_impl.dart';
import '../domain/news_detail/repositories/news_detail_repository.dart';
import '../domain/news_detail/usecases/get_news_detail_usecase.dart';
import '../presentation/news_detail/cubit/news_detail_cubit.dart';
import 'di.dart';

void registerNewsDetailFeature() {
  //bloc
  sl.registerFactory<NewsDetailCubit>(() => NewsDetailCubit(sl()));

  //use case
  sl.registerLazySingleton<GetNewsDetailUseCase>(
      () => GetNewsDetailUseCase(sl()));

  //repository
  sl.registerLazySingleton<NewsDetailRepository>(
      () => NewsDetailRepositoryImpl(remoteDataSource: sl()));

  //data source
  sl.registerLazySingleton<NewsDetailRemoteDataSource>(
      () => NewsDetailRemoteDataSourceImpl(dio: sl()));
}
