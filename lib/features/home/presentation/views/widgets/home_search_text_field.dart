import 'package:flutter/material.dart';

import '../../../../../generated/l10n.dart';

class HomeSearchTextField extends StatelessWidget {
  const HomeSearchTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35),
      child: Container(
        height: 45,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border:
            Border.all(width: 1.2, color: const Color(0xFF404040))),
        child: TextField(
          decoration: InputDecoration(
            filled: true,
            fillColor: const Color(0xFF292929),
            hintText: S.of(context).HomeSearch,
            hintStyle: const TextStyle(
                color: Color(0xFF7D7D7D),
                fontSize: 18,
                fontWeight: FontWeight.w400,
                height: 1.1),
            suffixIcon: const Icon(Icons.search_outlined,
                color: Color(0xFF7D7D7D)),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
    );
  }
}
