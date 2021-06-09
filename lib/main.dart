import 'package:flutter/material.dart';

import 'src/pages/first_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animate_Do',
      home: FirstPage(),
    );
  }
}
