import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:news_project/data/explore/models/explore_model.dart';

import '../../../../core/error/exceptions.dart';

abstract class ExploreRemoteDataSource {
  Future<ExploreModel> getExplore();
}

class ExploreRemoteDataSourceImpl implements ExploreRemoteDataSource {
  final Dio dio;

  ExploreRemoteDataSourceImpl({required this.dio});

  @override
  Future<ExploreModel> getExplore() async {
    final response = await dio.get(
        "https://raw.githubusercontent.com/nhaattrieeu/temp_storage/main/explore.json");
    if (response.statusCode == HttpStatus.ok) {
      return ExploreModel.fromJson(jsonDecode(response.data));
    } else {
      throw ServerException();
    }
  }
}
