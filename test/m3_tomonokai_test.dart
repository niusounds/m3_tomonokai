import 'dart:io';

import 'package:m3_tomonokai/m3_tomonokai.dart';
import 'package:test/test.dart';

void main() {
  group('TomonokaiParser', () {
    late String testSource;

    setUp(() {
      final testFile = File('test.html');
      testSource = testFile.readAsStringSync();
    });

    test('parse', () {
      final articles = TomonokaiParser().parse(testSource);

      expect(
        articles[0].date,
        equals(
          '2019.11.23',
        ),
      );
      expect(
        articles[0].linkUrl,
        equals(
          'http://muselab.seesaa.net/article/471698409.html?1574515435',
        ),
      );
      expect(
        articles[0].title,
        equals(
          '【2019秋 M04a】cruel dolls購入者特典配信開始 / cruel dolls secret contents is available now!',
        ),
      );
      expect(
        articles[0].description,
        equals(
          'Muse Lab最新作”cruel dolls”購入者特典の配信が開始しました。お持ちの方は是非ご覧下さい。',
        ),
      );
      expect(
        articles[0].imageUrl,
        equals(
          'https://www.m3net.jp/friend/news/banner/20191123.22338.png',
        ),
      );

      expect(articles.length, equals(273));
    });
  });
}
