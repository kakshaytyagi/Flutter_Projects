import 'package:flutter/material.dart';

class LetterList extends StatelessWidget {
  final List<String> alphabets;
  final int selectedLetterIndex;
  final ValueChanged<int> onLetterSelected;

  LetterList({
    required this.alphabets,
    required this.selectedLetterIndex,
    required this.onLetterSelected,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: alphabets.length,
      itemBuilder: (context, index) {
        bool isSelected = index == selectedLetterIndex;
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: GestureDetector(
            onTap: () => onLetterSelected(index),
            child: Text(
              alphabets[index],
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: isSelected ? Colors.yellow : Colors.white,
              ),
            ),
          ),
        );
      },
    );
  }
}
