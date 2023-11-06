import 'package:NewsApp/Models/New_Model.dart';
import 'package:NewsApp/Screens/NewsList.dart';
import 'package:NewsApp/Service/Dio_helper.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final SerachtextController = TextEditingController();
  List<NewsModel> news = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Container(
        width: double.infinity,
        height: 40,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(5)),
        child: Center(
          child: TextFormField(
            controller: SerachtextController,
            onChanged: (Value) async {
              news = await NewsApi().searchnews(search: Value);
              setState(() {});
            },
            decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.deepOrangeAccent,
                ),
                suffixIcon: IconButton(
                  icon: const Icon(
                    Icons.clear,
                    color: Colors.deepOrangeAccent,
                  ),
                  onPressed: () {
                    SerachtextController.text = '';
                    // setState(() {});
                  },
                ),
                hintText: 'Search...',
                border: InputBorder.none),
          ),
        ),
      )),
      body: FutureBuilder<List<NewsModel>>(
          future: NewsApi().searchnews(search: SerachtextController.text),
          builder: (context, snapShot) {
            if (snapShot.hasData) {
              return NewsList(
                  news: snapShot.data!.where((element) {
                return element.headTitile != "[Removed]" ||
                    element.imageURl != " ";
              }).toList());
            } else if (snapShot.hasError) {
              return Center(
                child: Text(''),
              );
            } else
              return Center(
                child: CircularProgressIndicator(
                  color: Colors.deepOrangeAccent,
                ),
              );
          }),
    );
  }
}
