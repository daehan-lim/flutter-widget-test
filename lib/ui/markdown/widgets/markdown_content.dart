import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

import '../../../utils/asset_loader.dart';

class MarkdownContent extends StatelessWidget {
  const MarkdownContent({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: loadMarkdownAsset(
        'Enhancing Privacy and Robustness in Federated Random Forests.md',
      ),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Error loading markdown: ${snapshot.error}'),
          );
        } else if (!snapshot.hasData) {
          return const Center(child: Text('No data found.'));
        }
        return MarkdownBody(
          data: snapshot.data!.replaceAll('\n\n', '\nㅤ\n'),
          softLineBreak: true,
          styleSheet: MarkdownStyleSheet(
            p: const TextStyle(fontSize: 18.0),
            h1: const TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
            h2: const TextStyle(fontSize: 26.0, fontWeight: FontWeight.bold),
            h3: const TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
            code: TextStyle(fontSize: 16.0, backgroundColor: Colors.grey[200]),
          ),
        );
      },
    );
  }
}
