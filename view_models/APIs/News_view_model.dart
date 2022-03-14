import 'package:apeye/API/model/testNews.dart';
import 'package:apeye/services/News_services.dart';
import 'package:flutter/cupertino.dart';

class News_view_model extends ChangeNotifier {
  List<News_test> _newsList = [];

  Future<void> fetchNews(List interests) async {
    _newsList = await News_services().fetchNews(
      endpoint: "",
      query: {
        "q": 'Covid',
        "country": 'US',
        "lang": 'en',
        "limit": '50',
        "when": 'Engineer'
      },
    );

    print(_newsList);
    notifyListeners();
  }

  List<News_test> get newsList => _newsList;
}
