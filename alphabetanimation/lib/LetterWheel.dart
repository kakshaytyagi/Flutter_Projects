import 'package:flutter/material.dart';

class LetterWheel extends StatelessWidget {
  final FixedExtentScrollController scrollController;
  final List<String> alphabets;
  final int selectedLetterIndex;
  final ValueChanged<int> onLetterSelected;
  final ValueChanged<String> onLetterTapped;

  LetterWheel({
    required this.scrollController,
    required this.alphabets,
    required this.selectedLetterIndex,
    required this.onLetterSelected,
    required this.onLetterTapped,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: ListWheelScrollView(
        controller: scrollController,
        itemExtent: 200,
        physics: FixedExtentScrollPhysics(),
        perspective: 0.007,
        diameterRatio: 2.0,
        squeeze: 1.0,
        offAxisFraction: -0.4,
        onSelectedItemChanged: onLetterSelected,
        children: alphabets.map((value) {
          bool isSelected = alphabets.indexOf(value) == selectedLetterIndex;

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () => onLetterTapped(value),
              child: Container(
                child: Center(
                  child: RotatedBox(
                    quarterTurns: 1,   // turn the letter horizontal or vertical
                    child: Text(
                      value,
                      style: TextStyle(
                        fontSize: 61,
                        fontWeight: FontWeight.bold,
                        color: isSelected ? Colors.white : Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                  color: isSelected ? Colors.yellow : Colors.blue,
                  borderRadius: BorderRadius.circular(21),
                  border: Border.all(
                    color: isSelected ? Colors.white : Colors.transparent,
                    width: isSelected ? 3.0 : 0.0,
                  ),
                ),
                width: 200,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
