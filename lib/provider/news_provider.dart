import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_project/models/news.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final queryProvider = StateNotifierProvider.family<QueryMovieProvider, List<News>,
    String>((ref, query) => QueryMovieProvider(query: query));


class QueryMovieProvider extends StateNotifier<List<News>>{
  QueryMovieProvider({required this.query}) : super([]){
    getQuery();
  }

  final String query;

  Future<void> getQuery() async{
    final dio = Dio();
    try{
      final response = await dio.get('https://free-news.p.rapidapi.com/v1/search', queryParameters: {
        'q': query,
        'lang': 'en'
      }, options: Options(
          headers: {
            'x-rapidapi-host': 'free-news.p.rapidapi.com',
            'x-rapidapi-key': '9cac60b351msh530cc0e2b8d88d2p1f9661jsn2c0049707e46'
          }
      ));

      if(response.data['status'] == 'No matches for your search.'){
        state = [News(summary: '', published_date: '', link: '', author: '', title: 'not found', media: '')];
      }else{
        final data = (response.data['articles'] as List).map((e) => News.fromJson(e)).toList();
        state = data;

      }
    }on DioError catch (err){
      print(err.response);

    }
  }


}









final newsProvider = StateNotifierProvider<NewsProvider, List<News>>((ref) => NewsProvider());



class NewsProvider extends StateNotifier<List<News>>{
  NewsProvider() : super([]){
    getData();
  }


  Future<void> getData() async{
    final dio = Dio();
    try{
      final response = await dio.get('https://free-news.p.rapidapi.com/v1/search', queryParameters: {
        'q': 'news',
        'lang': 'en'
      }, options: Options(
          headers: {
            'x-rapidapi-host': 'free-news.p.rapidapi.com',
            'x-rapidapi-key': '9cac60b351msh530cc0e2b8d88d2p1f9661jsn2c0049707e46'
          }
      ));

   if(response.data['status'] == 'No matches for your search.'){
           state = [News(summary: '', published_date: '', link: '', author: '', title: 'not found', media: '')];
      }else{
   final data = (response.data['articles'] as List).map((e) => News.fromJson(e)).toList();
   state = data;

}
    }on DioError catch (err){
      print(err.response);

    }
  }



  Future<void> searchNews(String query) async{
    final dio = Dio();
    state = [];
    try{
      final response = await dio.get('https://free-news.p.rapidapi.com/v1/search', queryParameters: {
        'q': query,
        'lang': 'en'
      }, options: Options(
          headers: {
            'x-rapidapi-host': 'free-news.p.rapidapi.com',
            'x-rapidapi-key': '9cac60b351msh530cc0e2b8d88d2p1f9661jsn2c0049707e46'
          }
      ));

      if(response.data['status'] == 'No matches for your search.'){
        state = [News(summary: '', published_date: '', link: '', author: '', title: 'not found', media: '')];
      }else {
        final data = (response.data['articles'] as List).map((e) =>
            News.fromJson(e)).toList();
        state = data;
      }
    }on DioError catch (err){
      print(err.response);

    }
  }
}


