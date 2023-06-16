import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '_AlphabetPageState.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const AlphabetPage(title: 'Alphabets...'),
    );
  }
}

class AlphabetPage extends StatefulWidget {
  final String title;

  const AlphabetPage({required this.title});

  @override
  AlphabetPageState createState() => AlphabetPageState();
}


