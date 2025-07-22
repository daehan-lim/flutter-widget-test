import 'package:first_app/ui/animations/animated_container.dart';
import 'package:first_app/ui/animations/animated_opacity.dart';
import 'package:first_app/ui/animations/animated_position.dart';
import 'package:first_app/ui/animations/move_game.dart';
import 'package:first_app/ui/maps_intent/page.dart';
import 'package:first_app/ui/riverpod/home_page.dart';
import 'package:first_app/ui/test_form.dart';
import 'package:first_app/ui/test_grid_view.dart';
import 'package:first_app/ui/test_image_picker.dart';
import 'package:first_app/ui/test_text_form_field.dart';
import 'package:first_app/ui/test_webview.dart';
import 'package:flutter/material.dart';
import 'package:first_app/ui/containers.dart';
import 'package:first_app/ui/image_displayer.dart';
import 'package:first_app/ui/markdown/markdown_screen.dart';
import 'package:first_app/ui/navigation/test_first.dart';
import 'package:first_app/ui/recipe/recipe_page.dart';
import 'package:first_app/ui/seat/seat_page.dart';
import 'package:first_app/ui/store_page.dart';
import 'package:first_app/ui/test_aspect_ratio.dart';
import 'package:first_app/ui/test_buttons.dart';
import 'package:first_app/ui/test_list_view.dart';
import 'package:first_app/ui/test_list_view_builder.dart';
import 'package:first_app/ui/test_spinner.dart';
import 'package:first_app/ui/test_stack.dart';
import 'package:first_app/ui/test_stateful.dart';

import '../animations/animated_align.dart';
import '../animations/explicit_animation.dart';

class NavigationTest extends StatelessWidget {
  const NavigationTest({super.key});

  @override
  Widget build(BuildContext context) {
    // List of all pages with their titles
    final pages = [
      ('ExplicitAnimationExample', ExplicitAnimationExample()),
      ('AnimatedPositionedExample', AnimatedPositionedExample()),
      ('AnimatedOpacityExample', AnimatedOpacityExample()),
      ('AnimatedContainerExmple', AnimatedContainerExmple()),
      ('MoveGame', MoveGame()),
      ('AnimatedAlignExmple', AnimatedAlignExmple()),
      ('PlaceListPage', PlaceListPage()),
      ('TestImagePicker', TestImagePicker()),
      ('PrettyTextFieldDemo', PrettyTextFieldDemo()),
      ('TestWebview', TestWebview()),
      ('TestGridView', TestGridView()),
      ('AdvancedSearchPage', AdvancedSearchPage()),
      ('HomePage Riverpod', HomePage()),
      ('Containers', Containers()),
      ('Image Displayer', ImageDisplayer()),
      ('Markdown Screen', MarkdownScreen(title: 'Markdown')),
      ('Navigation Test First', TestFirst()),
      ('Recipe Page', RecipePage()),
      ('Seat Page', SeatPage()),
      ('Store Page', StorePage()),
      ('Test Aspect Ratio', TestAspectRatio()),
      ('Test Buttons', TestButtons()),
      ('Test List View', TestListView()),
      ('Test List View Builder', TestListViewBuilder()),
      ('Test Spinner', TestSpinner()),
      ('Test Stack', TestStack()),
      ('Test Stateful', MyHomePage(title: 'Stateful Widget')),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Navigation Test'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: pages.length,
        itemBuilder: (context, index) {
          final page = pages[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
            child: Card(
              child: ListTile(
                title: Text(page.$1),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => page.$2),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}