import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Divider(thickness: 2),
        Center(
          child: Container(
            height: 30,
            width: 40,
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
            ),
            child: const Center(
              child: Text(
                'أو',
                style: TextStyle(fontFamily: 'Cairo', fontSize: 20),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
