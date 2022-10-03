import 'package:flutter/material.dart';
import 'package:news_app/services/news_service.dart';
import 'package:news_app/viewmodel/article_view_model.dart';

import 'package:flutter/cupertino.dart';

enum Status { initial, loading, loaded }

class ArticleListViewModel extends ChangeNotifier {
  ArticleViewModel viewModel = ArticleViewModel('general', []);
  Status status = Status.initial;

  ArticleListViewModel() {
    getNews();
  }

  Future<void> getNews() async {
    status = Status.loading;
    notifyListeners();
    viewModel.articles = await NewsService().fetchNews(viewModel.category);
    status = Status.loaded;
    notifyListeners();
  }
}
