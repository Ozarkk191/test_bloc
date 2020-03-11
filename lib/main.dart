import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/article_bloc/article_bloc.dart';
import 'repository/article_repository.dart';
import 'ui/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
      create: (BuildContext context) => ArticleBloc(
        repository: ArticleRepositoryImp(),
      ),
    );
  }
}
