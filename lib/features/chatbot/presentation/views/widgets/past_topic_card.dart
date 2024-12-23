import 'package:flutter/material.dart';
import 'package:plant_care_ut/core/utils/styles.dart';

class PastTopicCard extends StatelessWidget {
  final String text;
  final String icon;

  const PastTopicCard({super.key,
    required this.text,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Container(
        height: 70,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        margin: const EdgeInsets.symmetric(vertical: 6),
        decoration: BoxDecoration(
          color: const Color(0xFF2E372E),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(

          children: [
            const SizedBox(width: 5,),
            Image.asset(icon),
            const SizedBox(width: 13,),
            Text(
              text,
              style: Styles.styleRegular16.copyWith(color: Colors.white,fontSize: 15),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
            const Spacer(),
            IconButton(onPressed: (){},icon: const Icon(Icons.arrow_forward, color: Colors.white)),
          ],
        ),
      ),
    );
  }
}