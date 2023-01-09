import 'dart:convert';
import 'package:http/http.dart' as http;

class NewsQueryModel
{
  // String newsHead;
  // String newsName;
  // String newsUrl;
  // String newsImg;
  // NewsQueryModel({required this.newsImg, required this.newsHead , required this.newsName, required this.newsUrl  });

  getNews() async {
    var response = await http.get(Uri.parse("https://newsapi.org/v2/top-headlines?country=us&category=technology&apiKey=3e0409d94d1240a5948c27e8e4bec961"));
    var data = jsonDecode(response.body);
    // String datetime = data['publishedAt'];
    // DateTime now = DateTime.parse(datetime);
    // String date = now.toString();
    return data;
  }
}