import 'package:dio/dio.dart';



class VideoProvider{

  Future<String> getMovieKey(int movieId) async{
    final dio = Dio();
    try{
      final response = await dio.get('https://api.themoviedb.org/3/movie/$movieId/videos?api_key=2a0f926961d00c667e191a21c14461f8&language=en-US');
    return response.data['results'][0]['key'];

    }on DioError catch (err){
      print(err);
      return '';
    }
  }



}