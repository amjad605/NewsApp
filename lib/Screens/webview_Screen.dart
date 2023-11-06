import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class webConainer extends StatefulWidget {
  const webConainer({required this.url, super.key});
  final String url;

  @override
  State<webConainer> createState() => _webConainerState();
}

class _webConainerState extends State<webConainer> {
  late final WebViewController _controller;
  var loadingPercentage = 0;
  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setNavigationDelegate(NavigationDelegate(
        onPageStarted: (url) {
          setState(() {
            loadingPercentage = 0;
          });
        },
        onProgress: (progress) {
          setState(() {
            loadingPercentage = progress;
          });
        },
        onPageFinished: (url) {
          setState(() {
            loadingPercentage = 100;
          });
        },
      ))
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onNavigationRequest: (navigation) {
            if (navigation.url != widget.url) {
              // return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(context) {
    return Scaffold(
        appBar: AppBar(),
        body: Stack(
          children: [
            WebViewWidget(
              controller: _controller,
            ),
          ],
        ));
  }
}
