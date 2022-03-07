



class Movie{

  late int id;
  late String title;
  late String overview;
  late String poster_path;
  late String release_date;
  late String vote_average;

    

  Movie({
   required this.id,
    required this.release_date,
    required this.poster_path,
    required this.vote_average,
    required this.overview,
    required this.title,
  });

  Movie.initState() : id=0, overview='', poster_path='', release_date='', title='not available', vote_average='';

 factory Movie.fromJson(Map<String, dynamic> json){
   return Movie(
       id: json['id'] ?? '',
       release_date: json['release_date'] ?? '',
       poster_path: json['poster_path'] ?? '',
       vote_average: '${json['vote_average']}' ,
       overview: json['overview'] ?? '',
       title: json['title'] ?? '',
   );
 }



}