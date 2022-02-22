



class News{

 late String title;
 late String author;
 late String published_date;
 late String link;
 late String summary;
 late String image;

 News({
   required this.title,
   required this.image,
   required this.author,
   required this.link,
   required this.published_date,
   required this.summary,
});


  factory News.fromJson(Map<String, dynamic> json){
    return News(
        title: json['title'] ?? '',
        image: json['media'] ?? '',
        author: json['author'] ?? '',
        link: json['link'] ?? '',
        published_date: json['published_date'] ?? '',
        summary: json['summary'] ?? '',
    );
  }





}