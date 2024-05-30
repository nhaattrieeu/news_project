import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:news_project/data/news/models/news_home_model.dart';

import '../../../../../core/error/exceptions.dart';

abstract class NewsRemoteDataSource {
  Future<NewsHomeModel> getNewsHome();
}

class NewsRemoteDataSourceImpl implements NewsRemoteDataSource {
  final Dio dio;

  NewsRemoteDataSourceImpl({required this.dio});

  @override
  Future<NewsHomeModel> getNewsHome() async {
    final response = await dio.get(
        "https://raw.githubusercontent.com/nhaattrieeu/temp_storage/main/home.json");
    if (response.statusCode == HttpStatus.ok) {
      return NewsHomeModel.fromJson(jsonDecode(response.data));
    } else {
      throw ServerException();
    }
  }
}
