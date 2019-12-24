class Article {
  final String title;
  final String description;
  final String date;
  final String imageUrl;
  final String linkUrl;

  const Article({
    this.title,
    this.description,
    this.date,
    this.imageUrl,
    this.linkUrl,
  });

  @override
  String toString() {
    return 'Article['
        'title: $title'
        ', description: $description'
        ', date: $date'
        ', imageUrl: $imageUrl'
        ', linkUrl: $linkUrl'
        ']';
  }
}
