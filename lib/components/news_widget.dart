import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';

import '../Models/New_Model.dart';
import '../Screens/briefNews_screen.dart';
import '../Screens/webview_Screen.dart';

class NewsWidget extends StatelessWidget {
  const NewsWidget({super.key, required this.news});
  final NewsModel news;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => webConainer(url: news.url)));
      },
      onLongPress: () {
        Navigator.push(
          context,
          HeroDialogRoute(
            builder: (BuildContext context) {
              return BriefNews(news: news);
            },
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
        child: SizedBox(
          width: double.infinity,
          child: Column(
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
                      size: 200,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                news.headTitile,
                maxLines: 2,
                style: const TextStyle(
                  height: 1.8,
                  color: Colors.black,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                news.subHeadTitle,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.normal),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// for hero animation on opening the news
class HeroDialogRoute<T> extends PageRoute<T> {
  HeroDialogRoute({required this.builder}) : super();

  final WidgetBuilder builder;

  @override
  bool get opaque => false;

  @override
  bool get barrierDismissible => true;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 300);

  @override
  bool get maintainState => true;

  @override
  Color get barrierColor => Colors.black54;

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return FadeTransition(
        opacity: CurvedAnimation(parent: animation, curve: Curves.easeOut),
        child: child);
  }

  @override
  String? get barrierLabel {
    return "";
  }

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return builder(context);
  }
}
