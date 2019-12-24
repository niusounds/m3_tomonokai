M3友の会 HTML parser

## Usage

A simple usage example:

```dart
import 'package:m3_tomonokai/m3_tomonokai.dart';

void main() async {
  final articles = await TomonokaiParser().loadArticles();
  articles.forEach(print);
}
```
