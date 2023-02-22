import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class NewsPage extends StatelessWidget {
  String title;
  String? urlToImage;
  String content;
  String urlPage;
  NewsPage(
      {super.key,
      required this.title,
      required this.content,
      required this.urlToImage,
      required this.urlPage});

  _launchURLApp() async {
    var url = Uri.parse(urlPage);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('News Now')),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Image.network(urlToImage.toString()),
              const SizedBox(
                height: 30,
              ),
              Text(
                content,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
              ),
              TextButton(
                  onPressed: _launchURLApp, child: const Text('View more')),
            ],
          ),
        ),
      ),
    );
  }
}
