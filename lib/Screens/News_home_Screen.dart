import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../components/category_widget.dart';
import 'NewsListBuilder.dart';
import 'Search_screen.dart';

class NewsHomeScreen extends StatelessWidget {
  const NewsHomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: false,
        backgroundColor: Colors.white,
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverAppBar(
              centerTitle: false,
              stretch: true,
              floating: true,
              title: Text(
                'Good Moring ! ',
                style: GoogleFonts.montserrat(
                  fontSize: 23,
                  color: Colors.white,
                ),
              ),
              actions: [
                IconButton(
                    onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => const SearchPage())),
                    icon: const Icon(
                      Icons.search,
                      color: Colors.white,
                      size: 25,
                    )),
              ],
              expandedHeight: 250,
              flexibleSpace: Stack(
                children: [
                  Positioned.fill(
                    child: Container(
                      color: Colors.deepOrangeAccent,
                    ),
                  ),
                  // Tabbar  And the curve
                  Positioned(
                    bottom: -4,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 100,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(30),
                        ),
                      ),
                      child: ListviwCategory(),
                    ),
                  ),
                  Positioned(
                    top: 100,
                    left: 20,
                    right: 100,
                    child: Text("Explore today's world news",
                        style: GoogleFonts.montserrat(
                            color: Color.fromARGB(255, 248, 248, 248),
                            fontSize: 30,
                            fontWeight: FontWeight.bold)),
                  )
                ],
              ),
            ),
          ],
          body: const TabBarView(children: [
            NewWidgetListBuilder(category: 'general'),
            NewWidgetListBuilder(category: 'entertainment'),
            NewWidgetListBuilder(category: 'business'),
            NewWidgetListBuilder(category: 'health'),
            NewWidgetListBuilder(category: 'technology'),
            NewWidgetListBuilder(category: 'sports')
          ]),
        ),
      ),
    );
  }
}
