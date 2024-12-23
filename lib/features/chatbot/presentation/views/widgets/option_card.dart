import 'package:flutter/material.dart';

class OptionCard extends StatelessWidget {
  final Color color;
  final String icon;
  final String text;
  final void Function()? onTap;

  const OptionCard({super.key,
    required this.color,
    required this.icon,
    required this.text, this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(20),
        width: 188,
        height: 156,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
                backgroundColor: const Color(0xFF4C5B4C),
                child: Image.asset(icon)),
            const SizedBox(height: 10),
            Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
