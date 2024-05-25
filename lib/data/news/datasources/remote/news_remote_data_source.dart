import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';

import '../../../../../core/error/exceptions.dart';
import '../../models/news_model.dart';

abstract class NewsRemoteDataSource {
  Future<List<NewsModel>> getNews();

  Future<NewsModel> getTrending();
}

class NewsRemoteDataSourceImpl implements NewsRemoteDataSource {
  final Dio dio;

  NewsRemoteDataSourceImpl({required this.dio});

  @override
  Future<List<NewsModel>> getNews() async {
    final response = await dio.get(
        "https://raw.githubusercontent.com/nhaattrieeu/temp_storage/main/latest.json");
    if (response.statusCode == HttpStatus.ok) {
      List<dynamic> listData = jsonDecode(response.data);
      return listData.map((e) => NewsModel.fromJson(e)).toList();
    } else {
      throw ServerException();
    }
  }

  @override
  Future<NewsModel> getTrending() async {
    final response = await dio.get(
        "https://raw.githubusercontent.com/nhaattrieeu/temp_storage/main/trending.json");
    if (response.statusCode == HttpStatus.ok) {
      return NewsModel.fromJson(jsonDecode(response.data));
    } else {
      throw ServerException();
    }
  }
}
