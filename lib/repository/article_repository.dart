import 'dart:convert';

import 'package:http/http.dart' as http;
import '../models/api_result_model.dart';
import '../strings/strings.dart';

abstract class ArticleRepository {
  Future<List<Articles>> getArticles();
}

class ArticleRepositoryImp implements ArticleRepository {
  @override
  Future<List<Articles>> getArticles() async {
    var repository = await http.get(StringInApp.criArticleUrl);
    if (repository.statusCode == 200) {
      var data = json.decode(repository.body);
      List<Articles> articles = ApiResultModel.fromJson(data).articles;

      return articles;
    } else {
      throw Exception();
    }
  }
}
