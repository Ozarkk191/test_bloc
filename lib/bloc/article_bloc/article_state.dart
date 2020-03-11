import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../models/api_result_model.dart';

abstract class ArticleState extends Equatable {
  const ArticleState();
}

class ArticleInitialState extends ArticleState {
  @override
  List<Object> get props => [];
}

class ArticleLoadingState extends ArticleState {
  @override
  List<Object> get props => [];
}

class ArticleLoadedState extends ArticleState {
  final List<Articles> article;

  ArticleLoadedState({@required this.article});
  @override
  List<Object> get props => article;
}

class ArticleErrorState extends ArticleState {
  final String message;

  ArticleErrorState({@required this.message});
  @override
  List<Object> get props => [message];
}
