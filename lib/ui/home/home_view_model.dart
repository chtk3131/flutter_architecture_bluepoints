import 'package:flutter/material.dart';
import 'package:hooks_riverpod/all.dart';

import '../../data/model/news.dart';
import '../../data/model/result.dart';
import '../../data/repository/news_repository_base.dart';

class HomeViewModel extends StateNotifier<Result<News>> {
  final NewsRepositoryBase _newsRepository;

  HomeViewModel(this._newsRepository) : super(null);

  Future<void> fetchNews() async {
    state = await _newsRepository.getNews();
  }
}
