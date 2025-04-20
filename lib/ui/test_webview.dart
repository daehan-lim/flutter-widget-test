import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class TestWebview extends StatelessWidget {
  const TestWebview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: InAppWebView(
        // The URL to request first in InAppWebView
        initialUrlRequest: URLRequest(url: WebUri("https://www.naver.com/")),

        // WebView settings:
        // Don't try to memorize this!
        // Settings may change as versions update—
        // just understand that these settings exist.
        initialSettings: InAppWebViewSettings(
          // Whether video/audio can autoplay without user gesture
          mediaPlaybackRequiresUserGesture: true,

          // Whether to enable JavaScript on the page.
          // A must-have for modern web pages, so set to true!
          javaScriptEnabled: true,

          // Information about the client's browser, OS, device, etc.
          // This is sent to the server.
          // Default is WebView, but some pages block WebView access,
          // so you *must* set this!
          userAgent: 'Mozilla/5.0 (Linux; Android 10; Mobile; SM-G973F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.5481.77 Mobile Safari/537.36',
          /*userAgent:
              'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36',*/
        ),

        // Called when the native WebView component is created
        onWebViewCreated: (controller) {
          print('onWebViewCreated');
        },

        // Called when the page starts loading
        onLoadStart: (controller, url) {
          print('onLoadStart');
        },

        // Called when the page finishes loading
        onLoadStop: (controller, url) {
          print('onLoadStop');
        },

        // Called when the webpage inside WebView requests permissions
        // like GPS, camera, etc.
        onPermissionRequest: (controller, request) async {
          print('onPermissionRequest');
          return null;
        },
      ),
    );
  }
}
