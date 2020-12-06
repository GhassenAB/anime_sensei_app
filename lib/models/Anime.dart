class Anime {
  final String title;
  final String link;
  final String cover;

  Anime({this.title, this.link, this.cover});

  factory Anime.fromJson(Map<String, dynamic> json) {
    return Anime(
      title: json['title'],
      link: json['link'],
      cover: json['cover'],
    );
  }
}
