import 'package:flutter/material.dart';

class HumanMessage extends StatelessWidget {
  const HumanMessage({
    super.key, required this.message,
  });
  final String message;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Text(
          'ماهي اعراض تلف التربه',
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }
}
