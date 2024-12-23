import 'package:flutter/material.dart';

class HomeCropsListViewItem extends StatelessWidget {
  const HomeCropsListViewItem({
    super.key,
    required this.crops,
  });

  final String crops;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(width: .5, color: Colors.white),
        ),
        child: Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: const Color(0xFF3B3B3B),
            border:
            Border.all(width: 2, color: const Color(0xFF8A8A8A)),
          ),
          child: Image.asset(crops),
        ),
      ),
    );
  }
}
