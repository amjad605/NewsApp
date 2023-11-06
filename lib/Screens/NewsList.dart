import 'package:NewsApp/Models/New_Model.dart';
import 'package:NewsApp/components/news_widget.dart';
import 'package:flutter/material.dart';

//List of News Widget
class NewsList extends StatelessWidget {
  const NewsList({
    super.key,
    required this.news,
  });

  final List<NewsModel> news;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: [
      SliverList(
          delegate: SliverChildBuilderDelegate(
              (ctx, index) => NewsWidget(
                    news: news[index],
                  ),
              childCount: news.length)),
    ]);
  }
}
