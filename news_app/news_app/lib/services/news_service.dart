import 'dart:convert';

import 'package:news_app/models/articles.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/models/news.dart';

class NewsService {
  Future<List<Articles>> fetchNews(String category) async {
    String url =
        "https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=a1a40df715eb448894f3f6dfbbfb3d76";
    Uri uri = Uri.parse(url);
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final result = json.decode(response.body);
      News news = News.fromJson(result);
      return news.articles ?? [];
    }
    throw Exception("Bad Request");
  }
}
