import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:post_assessment/models/post.dart';
import '../services/remoteServices.dart';
import '../widgets/search.dart';
import 'news_page.dart';

class NewsApiPage extends StatefulWidget {
  const NewsApiPage({Key? key}) : super(key: key);

  @override
  State<NewsApiPage> createState() => _NewsApiPageState();
}

class _NewsApiPageState extends State<NewsApiPage> {
  final List<Article> posts = [];
  bool isLoaded = false;
  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    final newPosts = await RemoteService().getPosts();
    posts.clear();
    posts.addAll(newPosts);
    isLoaded = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Welcome')),
        actions: [
          IconButton(
            onPressed: () {
              showSearch(
                context: context,
                delegate: CustomSearchDelegate(posts: posts),
              );
            },
            icon: const Icon(
              Icons.search,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: FutureBuilder(
        future: RemoteService().getPosts(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                return Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(22)),
                  child: Card(
                    elevation: 20,
                    child: Column(
                      children: [
                        Visibility(
                          replacement: const CircularProgressIndicator(),
                          visible: isLoaded,
                          child: Image.network(posts[index].urlToImage ?? ''),
                        ),
                        InkWell(
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
                          child: ListTile(
                            title: Center(child: Text(posts[index].title)),
                            subtitle: Text(posts[index].publishedAt.toString()),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          } else {
            return Center(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircularProgressIndicator(),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    'Please Wait',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
