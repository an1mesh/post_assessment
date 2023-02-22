import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:post_assessment/models/post.dart';

import '../views/news_page.dart';

class CustomSearchDelegate extends SearchDelegate {
  List<Article> posts = [];
  CustomSearchDelegate({required this.posts});

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<Article> matchQuery = [];
    for (var article in posts) {
      if (article.title.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(article);
      }
    }

    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(matchQuery[index].title),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<Article> matchQuery = [];
    for (var article in posts) {
      if (article.title.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(article);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () async {
            Navigator.push(
              context,
              PageTransition(
                  child: NewsPage(
                      title: posts[index].title,
                      content: posts[index].content,
                      urlToImage: posts[index].urlToImage,
                      urlPage: posts[index].url),
                  type: PageTransitionType.leftToRight),
            );
          },
          child: Row(
            children: [
              Image.network(
                posts[index].urlToImage.toString(),
                height: 100,
                width: 100,
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(child: Text(posts[index].title)),
            ],
          ),
        );
      },
    );
  }
}
