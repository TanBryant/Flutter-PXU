import 'dart:html';
import 'package:flutter/material.dart';
import 'providers/NewsProvider.dart';
import 'package:provider/provider.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var newsProvider = Provider.of<NewsProvider>(context);
    newsProvider.getList();
    return Scaffold(
        body: ListView(
      scrollDirection: Axis.vertical,
      children: [
        ...newsProvider.list.map((e) {
          return Column(
            children: [
              Text(e.title ?? ""),
              Text(e.urlToImage ?? ""),
              Container(
                height: 400,
                child: Image.network(e.urlToImage ?? "", fit: BoxFit.fill),
              )
            ],
          );
        })
      ],
    ));
  }
}
