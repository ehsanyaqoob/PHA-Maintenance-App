import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewBrowser extends StatefulWidget {
  const WebViewBrowser({super.key});

  @override
  State<WebViewBrowser> createState() => _WebViewBrowserState();
}

class _WebViewBrowserState extends State<WebViewBrowser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Simple Example')),
      body: WebViewWidget(
          controller: WebViewController()
              ..loadRequest(Uri.parse('http://20.46.49.230/api/initiate-payment')),
      ),
    );
  }
}
