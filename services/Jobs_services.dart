import 'dart:convert';

import 'package:apeye/API/model/Jobs.dart';
import 'package:apeye/API/model/Jobs_model.dart';

import 'package:http/http.dart' as http;

class Jobs_services {
  static const _api_key = "99b9587abdmshaf1a689b0758402p1fe876jsn56a8b0714e25";
  static const String _baseUrl = "google-news1.p.rapidapi.com";
  static const Map<String, String> _headers = {
    "content-type": "application/json",
    "x-rapidapi-host": "google-news1.p.rapidapi.com",
    "x-rapidapi-key": _api_key,
  };
  Future<List<Jobs>> fetchJobs({
    required String endpoint,
    required Map<String, String> query,
  }) async {
    Uri uri = Uri.https(_baseUrl, endpoint, query);
    print(_baseUrl);
    http.Response response = await http.get(uri, headers: _headers);
    if (response.statusCode == 200) {
      // return json.decode(response.body);

      String data = response.body;
      var jsonData = jsonDecode(data);

      Jobs_model jobs = Jobs_model.fromJson(jsonData);
      List<Jobs> jobs_list =
          jobs.jobs_model.map((e) => Jobs.fromJson(e)).toList();
      return jobs_list;
    } else {
      throw Exception('Failed to load json data');
      // print(response.statusCode);
      // throw (response.statusCode);
    }
  }
}
