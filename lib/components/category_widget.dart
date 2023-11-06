import 'package:NewsApp/Service/Dio_helper.dart';
import 'package:flutter/material.dart';

import '../Models/category_Model.dart';

class ListviwCategory extends StatelessWidget {
  const ListviwCategory({super.key});
  final List<CategoryModel> category = const [
    CategoryModel(category: 'General'),
    CategoryModel(category: 'Entertainment'),
    CategoryModel(category: 'Bussniss'),
    CategoryModel(category: 'health'),
    CategoryModel(category: 'technology'),
    CategoryModel(category: 'sports'),
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 100,
        child: TabBar(
            automaticIndicatorColorAdjustment: false,
            isScrollable: true,
            labelColor: Colors.deepOrangeAccent,
            indicatorWeight: 7,
            indicatorColor: Colors.deepOrangeAccent,
            onTap: (index) async {
              await NewsApi().getNews(category: category[index].category);
            },
            indicatorSize: TabBarIndicatorSize.label,
            tabs: [
              ...category
                  .map((e) => Text(
                        e.category,
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                      ))
                  .toList()
            ])
        //
        );
  }
}
