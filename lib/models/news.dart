



class News{

  late String title;
  late String author;
  late String published_date;
  late String link;
  late String summary;
  late String media;

  News({
    required this.summary,
    required this.published_date,
    required this.link,
    required this.author,
    required this.title,
    required this.media
});


  factory News.fromJson(Map<String, dynamic> json){
    return News(
        summary: json['summary'] ?? '',
        published_date: json['published_date'] ?? '',
        link: json['link'] ?? '',
        author: json['author'] ?? '',
        title: json['title'] ?? '',
        media: json['media'] ?? ''
    );
  }


}