import 'package:flutter/material.dart';
import 'package:post_assessment/constants/constant.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var size, height, width;

  void nextPage() {
    setState(() {
      Navigator.of(context).pushNamed('/second');
    });
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(Constant.appTitle),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: width,
            height: height / 3,
            child: Image.network(
                'https://cdn-icons-png.flaticon.com/512/1042/1042680.png'),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            Constant.appTitle,
            style: TextStyle(
                color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 25),
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              elevation: 5,
            ),
            onPressed: nextPage,
            child: const Text('Latest News'),
          ),
        ],
      ),
    );
  }
}
