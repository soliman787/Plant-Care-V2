import 'package:flutter/material.dart';

import '../utils/styles.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key, required this.image, required this.text, this.onPressed, this.horizontalPadding,
  });

  final String image;
  final String text;
  final double? horizontalPadding;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding ?? 15),
      child: Container(
        height: 76,
        decoration: BoxDecoration(
            color: const Color(0xFF292929),
            borderRadius: BorderRadius.circular(8)
        ),
        child: Row(
          children: [
            const SizedBox(width: 16,),
            Image.asset(image),
            const SizedBox(width: 12,),
            Text(text,style: Styles.styleMedium18,),
            const Spacer(),
            IconButton(onPressed: onPressed, icon: const Icon(Icons.arrow_forward_ios)),
            const SizedBox(width: 13,)

          ],
        ),
      ),
    );
  }
}
