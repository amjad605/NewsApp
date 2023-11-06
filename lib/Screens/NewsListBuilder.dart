import 'package:NewsApp/Service/Dio_helper.dart';
import 'package:flutter/material.dart';

import '../Models/New_Model.dart';
import 'NewsList.dart';

class NewWidgetListBuilder extends StatefulWidget {
  const NewWidgetListBuilder({
    required this.category,
    super.key,
  });

  final String category;

  @override
  State<NewWidgetListBuilder> createState() => _NewWidgetListBuilderState();
}

class _NewWidgetListBuilderState extends State<NewWidgetListBuilder> {
  final List<NewsModel> news = [];
  var _future;
  @override
  void initState() {
    // TODO: implement initState
    _future = NewsApi().getNews(category: widget.category);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<NewsModel>>(
        future: _future,
        builder: (context, snapShot) {
          //Checking for the returned data from the api
          if (snapShot.hasData) {
            return NewsList(
                news: snapShot.data!.where((element) {
              return element.headTitile != "[Removed]" ||
                  element.imageURl != " ";
            }).toList());
          } else if (snapShot.hasError) {
            return const Center(
              child: Text('Somting went Wrong'),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.deepOrangeAccent,
              ),
            );
          }
        });
  }
}
