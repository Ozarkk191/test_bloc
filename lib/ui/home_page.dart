import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/article_bloc/article_bloc.dart';
import '../bloc/article_bloc/article_state.dart';
import '../models/api_result_model.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: Container(
        child: BlocBuilder<ArticleBloc, ArticleState>(
            builder: (BuildContext context, ArticleState state) {
          if (state is ArticleInitialState) {
            return buildLoading();
          } else if (state is ArticleLoadingState) {
            return buildLoading();
          } else if (state is ArticleLoadedState) {
            return buildArticleList(state.article);
          } else if (state is ArticleErrorState) {
            return buildErrorUi(state.message);
          } else {
            return buildLoading();
          }
        }),
      ),
    );
  }

  Widget buildLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget buildErrorUi(String message) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          message,
          style: TextStyle(color: Colors.red),
        ),
      ),
    );
  }

  Widget buildArticleList(List<Articles> articles) {
    return ListView.builder(
      itemCount: articles.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
              child: ListTile(
                leading: ClipOval(
                  child: Hero(
                    tag: articles[index].urlToImage,
                    child: Image.network(
                      articles[index].urlToImage,
                      fit: BoxFit.cover,
                      height: 50.0,
                      width: 50.0,
                    ),
                  ),
                ),
                title: Text(articles[index].title),
                subtitle: Text(articles[index].publishedAt),
              ),
              onTap: () {}),
        );
      },
    );
  }
}
