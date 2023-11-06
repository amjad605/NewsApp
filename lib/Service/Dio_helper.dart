import 'package:NewsApp/Models/New_Model.dart';
import 'package:dio/dio.dart';

class ApiProvider {
  static final _dio = Dio();
  static Dio get dio => _dio;
}

class NewsApi {
  final dio = ApiProvider.dio;

  Future<List<NewsModel>> getNews({required String category}) async {
    Response response = await dio.get(
        "https://newsapi.org/v2/top-headlines?country=us&apiKey=4cf0be97100d426e8c80f647545f3300&category=$category&country=eg");
    Map<String, dynamic> json = response.data;

    final List<NewsModel> news = [];
    for (var j in json["articles"]) {
      news.add(NewsModel.fromJson(j));
    }

    return news;
  }

  Future<List<NewsModel>> searchnews({required String search}) async {
    Response response = await dio.get(
        "https://newsapi.org/v2/everything?q=$search&apiKey=4cf0be97100d426e8c80f647545f3300");
    Map<String, dynamic> json = response.data;

    final List<NewsModel> news = [];
    for (var j in json["articles"]) {
      news.add(NewsModel.fromJson(j));
    }

    return news;
  }
}
