class NewsModel {
  List<Article>? articles;

  NewsModel({this.articles});

  factory NewsModel.fromjson(Map<String, dynamic> json) {
    return NewsModel(
        articles: json["articles"]
            .map((article) => Article.fromjson(article))
            .toList()
            .cast<Article>());
  }
}

class Article {
  Source? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  Article(
      {this.author,
      this.content,
      this.description,
      this.publishedAt,
      this.source,
      this.title,
      this.url,
      this.urlToImage});

  factory Article.fromjson(Map<String, dynamic> json) {
    return Article(
      author: json["author"],
      content: json["content"],
      description: json["description"],
      publishedAt: json["publishedAt"],
      title: json["title"],
      url: json["url"],
      urlToImage: json["urlToImage"],
      source: Source.fromjson(json["source"]),
    );
  }
}

class Source {
  String? id;
  String? name;

  Source({this.id, this.name});

  factory Source.fromjson(Map<String, dynamic> json) {
    return Source(id: json["id"], name: json["name"]);
  }
}
