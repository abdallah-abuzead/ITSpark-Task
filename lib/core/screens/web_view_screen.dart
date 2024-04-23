import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../../core/widgets/app_text.dart';
import '../constants/app_colors.dart';

class WebViewScreen extends StatefulWidget {
  final String url;
  final String title;

  const WebViewScreen({
    super.key,
    this.url = 'https://www.google.com.eg/',
    required this.title,
  });

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  late final WebViewController controller = WebViewController();

  @override
  void initState() {
    super.initState();
    controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppText(widget.title, color: AppColors.text, fontWeight: FontWeight.w600, fontSize: 15),
        centerTitle: false,
        leadingWidth: 24,
        elevation: 0,
      ),
      body: WebViewWidget(controller: controller),
    );
  }
}
