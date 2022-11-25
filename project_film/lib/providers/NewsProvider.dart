import 'dart:convert';

import 'package:project_film/models/NewsModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class NewsProvider extends ChangeNotifier {
  List<NewsModel> list = [];
  void getList() async {
    String apiURL =
        "https://newsapi.org/v2/everything?q=apple&from=2022-09-19&to=2022-09-19&sortBy=popularity&apiKey=c1172b716679428e9df24c4f43881fa8";
    var client = http.Client();
    var jsonString = await client.get(Uri.parse(apiURL));
    var jsonObject = jsonDecode(jsonString.body);
    var newsListObject = jsonObject['articles'] as List;
    list = newsListObject.map((e) {
      return NewsModel(
          author: e['author'], title: e['title'], urlToImage: e['urlToImage']
          // description: e['description'],
          // url: e['url'],
          // publishedAt: e['publishedAt'],
          // content: e['content']
          );
    }).toList();
    notifyListeners();
  }
}
