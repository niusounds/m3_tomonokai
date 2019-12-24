import 'dart:convert';
import 'dart:io';

import 'package:html/dom.dart';

import 'article.dart';

class TomonokaiParser {
  final String sourceUrl;

  const TomonokaiParser({
    this.sourceUrl = 'https://www.m3net.jp/friend/index.php',
  }) : assert(sourceUrl != null);

  Future<List<Article>> loadArticles() async {
    final client = HttpClient();
    final request = await client.getUrl(Uri.parse(sourceUrl));
    final response = await request.close();
    final responseBody = await response.transform(utf8.decoder).join();
    return parse(responseBody);
  }

  List<Article> parse(String html) {
    final document = Document.html(html);
    final tableElements = document.getElementsByClassName('tblFriend01');
    if (tableElements.isEmpty) {
      return const [];
    }

    final table = tableElements[0];
    final trElements = table.getElementsByTagName('tr');

    final results = <Article>[];
    String currentDate;

    trElements.forEach((tr) {
      if (tr.classes.contains('top')) {
        currentDate = tr.querySelector('td').text.trim();
      } else {
        final td = tr.querySelector('td');
        final link = td.querySelector('a.link');
        final image = td.querySelector('img');

        final linkUrl = link != null ? link.attributes['href'] : null;
        final title = link?.text?.trim();
        var imageUrl = image != null ? image.attributes['src'] : null;

        final description =
            title != null ? td.text.replaceAll(title, '') : td.text;

        if (imageUrl != null) {
          imageUrl = Uri.parse(sourceUrl).resolve(imageUrl).toString();
        }

        results.add(Article(
          date: currentDate,
          title: title,
          linkUrl: linkUrl,
          imageUrl: imageUrl,
          description: description.trim(),
        ));
      }
    });

    return results;
  }
}
