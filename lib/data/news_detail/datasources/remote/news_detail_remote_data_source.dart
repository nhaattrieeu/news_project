import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';

import '../../../../../core/error/exceptions.dart';
import '../../../../domain/news_detail/entities/news_detail.dart';
import '../../models/news_detail_model.dart';

abstract class NewsDetailRemoteDataSource {
  Future<NewsDetail> getNewsDetail(String id);
}

class NewsDetailRemoteDataSourceImpl implements NewsDetailRemoteDataSource {
  final Dio dio;

  NewsDetailRemoteDataSourceImpl({required this.dio});

  @override
  Future<NewsDetail> getNewsDetail(String id) async {
    final response = await dio.get(
        "https://raw.githubusercontent.com/nhaattrieeu/temp_storage/main/news-detail.json");
    if (response.statusCode == HttpStatus.ok) {
      return NewsDetailModel.fromJson(jsonDecode(response.data));
    } else {
      throw ServerException();
    }
  }
}
