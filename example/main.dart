import 'package:m3_tomonokai/m3_tomonokai.dart';

void main() async {
  final articles = await TomonokaiParser().loadArticles();
  articles.forEach(print);
}
