import 'package:flutter/material.dart';

class HealthButton extends StatelessWidget {
  const HealthButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 360,
      height: 100,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(2),
            border: Border.all(color: Colors.grey.shade400),
          ),
          clipBehavior:
              Clip.hardEdge, 
          child: Image.asset(
            'assets/images/card.png', 
            fit: BoxFit.cover, 
          ),
        ),
      ),
    );
  }
}
