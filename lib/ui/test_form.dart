import 'package:flutter/material.dart';

class AdvancedSearchPage extends StatefulWidget {
  const AdvancedSearchPage({super.key});

  @override
  State<AdvancedSearchPage> createState() => _AdvancedSearchPageState();
}

class _AdvancedSearchPageState extends State<AdvancedSearchPage> {
  final _generalSearchController = TextEditingController();
  final _titleSearchController = TextEditingController();
  final _contentSearchController = TextEditingController();
  bool _exactMatch = false;

  @override
  void dispose() {
    _generalSearchController.dispose();
    _titleSearchController.dispose();
    _contentSearchController.dispose();
    super.dispose();
  }

  void _performSearch() {
    // Implement search logic here
    /*print('General: ${_generalSearchController.text}');
    print('Title: ${_titleSearchController.text}');
    print('Content: ${_contentSearchController.text}');
    print('Exact Match: $_exactMatch');*/
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('Advanced Search'),
          backgroundColor: Colors.white,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // General search
              _buildSectionHeader('General'),
              TextField(
                controller: _generalSearchController,
                onChanged: (text) {
                  setState(() {
                    _generalSearchController.text = text;
                  });
                },
                decoration: InputDecoration(
                  errorText: 'Error',
                  labelText: 'General search',
                  hintText: 'Enter search terms',
                  // counterText: '${_generalSearchController.text.length}/120',
                  border: WidgetStateInputBorder.resolveWith((
                    Set<WidgetState> states,
                  ) {
                    if (states.contains(WidgetState.error)) {
                      return OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.red),
                      );
                    }
                    else if (states.contains(WidgetState.focused)) {
                      return OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.black),
                      );
                    }
                    return OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.grey),
                    );
                  }),
                  // filled: true,
                  // fillColor: Colors.grey[100],
                ),
                maxLength: 120,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done,
              ),

              CheckboxListTile(
                title: const Text('Exact match'),
                value: _exactMatch,
                onChanged: (value) {
                  setState(() {
                    _exactMatch = value ?? false;
                  });
                },
                contentPadding: EdgeInsets.zero,
              ),

              const SizedBox(height: 16),

              // Title search
              _buildSectionHeader('Title'),
              TextField(
                controller: _titleSearchController,
                decoration: InputDecoration(
                  labelText: 'Title search',
                  hintText: 'Search in title',
                  counterText: '${_titleSearchController.text.length}/80',
                  border: const OutlineInputBorder(),
                  // filled: true,
                  // fillColor: Colors.grey[100],
                ),
                maxLength: 80,
                keyboardType: TextInputType.text,
              ),

              const SizedBox(height: 16),

              // Content search
              _buildSectionHeader('Content'),
              TextField(
                controller: _contentSearchController,
                decoration: InputDecoration(
                  labelText: 'Content search',
                  hintText: 'Search in content',
                  helperText: 'Search for text within article contents',
                  counterText: '${_contentSearchController.text.length}/120',
                  border: const OutlineInputBorder(),
                  // filled: true,
                  // fillColor: Colors.grey[100],
                ),
                maxLength: 120,
                keyboardType: TextInputType.text,
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _performSearch,
          tooltip: 'Search',
          child: const Icon(Icons.search),
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const Divider(thickness: 1),
        const SizedBox(height: 8),
      ],
    );
  }
}
