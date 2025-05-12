import 'package:flutter/material.dart';

import 'di.dart';
import 'features/photos/views/photos_page.dart';

void main() {
  DI().setup();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: PhotosPage(),
    );
  }
}
