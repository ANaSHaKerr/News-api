class ArticleModel {
  String author, title, description, url, imageUrl, content;
  DateTime publishedAt;

  ArticleModel(
      {this.author,
      this.title,
      this.description,
      this.url,
      this.imageUrl,
      this.content,
      this.publishedAt});

 /* Map<String, dynamic> toMap() {
    return {
      'author': author,
      'title': title,
      'description': description,
      'url': url,
      'imageUrl': imageUrl,
      'content': content,
      'publishedAt': publishedAt,
    };
  }
  ArticleModel.fromMap(Map<String, dynamic> map) {
    author = map['author'];
    title = map['title'];
    description = map['description'];
    url = map['url'];
    imageUrl = map['imageUrl'];
    content = map['content'];
    publishedAt = map['publishedAt'];


  }*/
}
