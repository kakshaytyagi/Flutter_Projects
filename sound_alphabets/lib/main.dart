import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Alphabetic Sounds'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

final player = AudioPlayer();

  List<Color> colorArray = [
    Color(0xFF303F9F), // Dark Blue
    Color(0xFF388E3C), // Dark Green
    Color(0xFFC2185B), // Dark Pink
    Color(0xFF512DA8), // Dark Purple
    Color(0xFFD32F2F), // Dark Red
    Color(0xFFE64A19), // Dark Orange
    Color(0xFF9E9D24), // Dark Yellow
    Color(0xFF0097A7), // Dark Cyan
    Color(0xFF616161), // Dark Grey
    Color(0xFF607D8B), // Dark Blue Grey
    Color(0xFF1B5E20), // Darker Green
    Color(0xFF4A148C), // Darker Purple
    Color(0xFFAD1457), // Darker Pink
    Color(0xFF5D4037), // Dark Brown
    Color(0xFF006064), // Darker Cyan
    Color(0xFFC62828), // Darker Red
    Color(0xFF689F38), // Darker Green
    Color(0xFF8C0032), // Darker Maroon
    Color(0xFF1A237E), // Darker Indigo
    Color(0xFFB71C1C), // Darker Red
    Color(0xFFE65100), // Darker Orange
    Color(0xFF827717), // Darker Yellow
    Color(0xFF004D40), // Darker Teal
    Color(0xFF424242), // Darker Grey
    Color(0xFF455A64), // Darker Blue Grey
    Color(0xFF0D47A1), // Darkest Blue
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16.0,
              mainAxisSpacing: 16.0,
              childAspectRatio: 1.0,
            ),
            itemCount: 26,
            itemBuilder: (context, index) {
              int alphabetIndex = index % 26;
              String alphabet = String.fromCharCode(alphabetIndex + 65); // A-Z alphabets

              return Material(
                elevation: 2,
                borderRadius: BorderRadius.circular(8.0),
                color: colorArray[index],
                child: InkWell(
                  borderRadius: BorderRadius.circular(8.0),
                  onTap: () async {
                    // Add your button click logic here
                    print('Button $alphabet clicked!');
                    await player.play(AssetSource("sounds/${alphabet.toLowerCase()}_sound.mp3"));
                    print('${alphabet.toLowerCase()}_sound.mp3');
                  },
                  child: Center(
                    child: Text(
                      alphabet,
                      style: TextStyle(
                        fontSize: 44,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        )
    );
  }
}
