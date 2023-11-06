import 'package:NewsApp/Models/New_Model.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';

class BriefNews extends StatelessWidget {
  const BriefNews({required this.news, super.key});
  final NewsModel news;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
      child: Center(
        child: AlertDialog(
          insetPadding: const EdgeInsets.all(0),
          clipBehavior: Clip.antiAlias,
          contentPadding: const EdgeInsets.all(0),
          content: Container(
            width: double.infinity,
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(10),
                color: Colors.white),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Hero(
                    tag: news.url,
                    child: CachedNetworkImage(
                      imageUrl: news.imageURl,
                      placeholder: (context, url) =>
                          const CircularProgressIndicator(
                        color: Colors.deepOrangeAccent,
                      ),
                      errorWidget: (context, url, error) => const Icon(
                        Icons.error,
                        color: Colors.red,
                        size: 100,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 13,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10.0, vertical: 0),
                  child: Text(
                    news.headTitile,
                    style: const TextStyle(
                        fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 12),
                  child: Text(news.subHeadTitle,
                      maxLines: 10,
                      style:
                          const TextStyle(fontSize: 16, color: Colors.black)),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
