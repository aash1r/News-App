import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/models/news_model.dart';

class Api {
  static Future<NewsModel> getNews() async {
    const url =
        "https://newsapi.org/v2/top-headlines?country=us&apiKey=2e5ec2e2488940eebaaf9a4681d3e853";
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return NewsModel.fromjson(data);
    }
    return NewsModel();
  }
}
