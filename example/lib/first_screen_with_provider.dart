import 'package:example/first_screen_provider.dart';
import 'package:example/second_screen.dart';
import 'package:flutter/material.dart';
import 'package:photo_editor/photo_editor.dart';
import 'package:provider/provider.dart';

class FirstScreenWithProvider extends StatelessWidget {
  final _globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => FirstScreenProvider(),
      child: Consumer<FirstScreenProvider>(
        builder: (_, provider, __) => Scaffold(
          appBar: AppBar(
            title: Text('Photo editor test'),
            actions: [
              IconButton(
                icon: Icon(Icons.add_a_photo),
                onPressed: provider.getImage,
              ),
              IconButton(
                icon: Icon(Icons.check),
                onPressed: () => _navigate(provider),
              ),
            ],
          ),
          body: _handleState(provider),
        ),
      ),
    );
  }

  Widget _handleState(FirstScreenProvider provider) {
    if (provider.imageFile == null) {
      return Center(
        child: Text('Test'),
      );
    }
    return Column(
      children: [
        Expanded(
          child: RepaintBoundary(
            key: _globalKey,
            child: ColorFiltered(
              colorFilter: provider.filter.filter,
              child: Image.file(provider.imageFile),
            ),
          ),
        ),
        FilterList(
          filters: presetFilters,
          image: FileImage(provider.imageFile),
          onFilterSelected: provider.onFilterSelected,
        ),
      ],
    );
  }

  void _navigate(FirstScreenProvider provider) async {
    final bytes = await provider.convertWidgetToImage(_globalKey.currentContext?.findRenderObject());
    if (bytes != null) {
      Navigator.of(_globalKey.currentContext).push(MaterialPageRoute(
        builder: (context) => SecondScreen(
          imageData: bytes,
        ),
      ));
    }
  }
}
