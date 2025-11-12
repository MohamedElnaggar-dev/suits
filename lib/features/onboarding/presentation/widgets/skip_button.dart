import 'package:flutter/material.dart';

class SkipButton extends StatelessWidget {
  const SkipButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        color: Colors.transparent,
        border: Border.all(color: Colors.black, width: 1.5),
      ),
      child: const Center(
        child: Text(
          'Skip',
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
      ),
    );
  }
}
