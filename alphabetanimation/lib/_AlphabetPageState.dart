import 'package:flutter/material.dart';

import 'LetterList.dart';
import 'LetterWheel.dart';
import 'SoundManager.dart';
import 'main.dart';

class AlphabetPageState extends State<AlphabetPage> {
  List<String> alphabets = [
    'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J',
    'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T',
    'U', 'V', 'W', 'X', 'Y', 'Z'
  ];

  int selectedLetterIndex = 0;
  final FixedExtentScrollController _scrollController = FixedExtentScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF0D47A1),
                  Color(0xFF1976D2),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Center(
            child: RotatedBox(
              quarterTurns: -1,
              child: SizedBox(
                height: 300,
                child: LetterWheel(
                  scrollController: _scrollController,
                  alphabets: alphabets,
                  selectedLetterIndex: selectedLetterIndex,
                  onLetterSelected: (index) {
                    setState(() {
                      selectedLetterIndex = index;
                    });
                  },
                  onLetterTapped: (letter) {
                    final letterIndex = alphabets.indexOf(letter);
                    _scrollController.animateToItem(
                      letterIndex,
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    );
                    SoundManager.playSoundForLetter(letter);
                  },
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 80,
              decoration: BoxDecoration(
                color: Colors.black,
                border: Border(
                  bottom: BorderSide(
                    color: Colors.white,
                    width: 2.0,
                  ),
                ),
              ),
              child: LetterList(
                alphabets: alphabets,
                selectedLetterIndex: selectedLetterIndex,
                onLetterSelected: (index) {
                  setState(() {
                    selectedLetterIndex = index;
                    _scrollController.animateToItem(
                      index,
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    );
                    SoundManager.playSoundForLetter(alphabets[index]);
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}