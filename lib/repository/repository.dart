import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app_bloc/model/article_response.dart';
import 'package:news_app_bloc/model/source_response.dart';

class NewRepository{
  static String mainUrl = "http://newsapi.org/v2/";

  final String apiKey = "9de5c6e86bad412791ed9a1ed8905f1b";

  final Dio _dio = Dio();

  var getSourcesUrl = "$mainUrl/sources";
  var getTopHeadlinesUrl = "$mainUrl/top-headlines";
  var everythingUrl = "$mainUrl/everything";

  Future<SourceResponse> getSources()async{
    var params = {
      "apiKey": apiKey,
      "language": "ru",
      "country": "ru"
    };

    try{
      Response response = await _dio.get(getSourcesUrl, queryParameters: params);
      return SourceResponse.fromJson(response.data);
    }catch(error, stacktrace){
      print("Exception: $error, stacktrace: $stacktrace");
      return SourceResponse.withError(error);
    }
  }

  Future<ArticleResponse> getHotNews()async{
    var params = {
      "apiKey": apiKey,
      "q": "apple",
      "sortBy": "popularity"
    };
    try{
      Response response = await _dio.get(everythingUrl, queryParameters: params);
      return ArticleResponse.fromJson(response.data);
    }catch(error, stacktrace){
      print("Exception: $error, stacktrace: $stacktrace");
      return ArticleResponse.withError(error);
    }
  }

  Future<ArticleResponse> getTopHeadLines()async{
    var params = {
      "apiKey": apiKey,
      "language": "ru",
      "country": "ru"
    };
    try{
      Response response = await _dio.get(getTopHeadlinesUrl, queryParameters: params);
      return ArticleResponse.fromJson(response.data);
    }catch(error, stacktrace){
      print("Exception: $error, stacktrace: $stacktrace");
      return ArticleResponse.withError(error);
    }
  }

  Future<ArticleResponse> getSourceNews(String sourceId)async{
    var params = {
      "apiKey": apiKey,
      "sources": sourceId
    };
    try{
      Response response = await _dio.get(getTopHeadlinesUrl, queryParameters: params);
      return ArticleResponse.fromJson(response.data);
    }catch(error, stacktrace){
      print("Exception: $error, stacktrace: $stacktrace");
      return ArticleResponse.withError(error);
    }
  }

  Future<ArticleResponse> search(String searchValue)async{
    var params = {
      "apiKey": apiKey,
      "q": searchValue
    };
    try{
      Response response = await _dio.get(getTopHeadlinesUrl, queryParameters: params);
      return ArticleResponse.fromJson(response.data);
    }catch(error, stacktrace){
      print("Exception: $error, stacktrace: $stacktrace");
      return ArticleResponse.withError(error);
    }
  }

}

