class NewsModel {
  late final String headTitile;
  late final String subHeadTitle;
  late final String imageURl;
  late final String auother;
  late final String url;

  NewsModel(
      {required this.headTitile,
      required this.subHeadTitle,
      required this.imageURl,
      required this.url,
      required this.auother});
  NewsModel.fromJson(Map<String, dynamic> json) {
    headTitile = json['title'];
    url = json['url'] ?? "https://newsapi.org";
    subHeadTitle = json['description'] ?? " ";
    imageURl = json['urlToImage'] ?? " ";
    auother = json['author'] ?? '';
  }
}
