import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';

class AuthCustomButton extends StatelessWidget {
  const AuthCustomButton({
    super.key, required this.text, this.onPressed,
  });
  final String text;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF43A047),
          padding: const EdgeInsets.symmetric(vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        child: Text(
          text,
          style: Styles.styleSemiBold24.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
