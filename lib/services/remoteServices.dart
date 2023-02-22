import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:post_assessment/models/post.dart';

class RemoteService {
  Future<List<Article>> getPosts() async {
    var client = http.Client();

    var uri = Uri.parse(
        'https://newsapi.org/v2/everything?domains=wsj.com&apiKey=ed0230ac26874f549b360d3528ad5878');

    var response = await client.get(uri);
    if (response.statusCode == 200) {
      final json = await compute(postFromJson, response.body);
      final List<Article> article = json.articles.toList();
      return article;
    }
    return [];
  }
}
