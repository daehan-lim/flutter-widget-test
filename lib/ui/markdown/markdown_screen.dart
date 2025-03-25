import 'package:first_app/ui/markdown/widgets/markdown_content.dart';
import 'package:flutter/material.dart';

class MarkdownScreen extends StatefulWidget {
  const MarkdownScreen({super.key, required this.title});

  final String title;

  @override
  State<MarkdownScreen> createState() => _MarkdownScreenState();
}

class _MarkdownScreenState extends State<MarkdownScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFEB2327),
        title: Text(widget.title, style: const TextStyle(color: Colors.white)),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(22.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: const MarkdownContent(),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
