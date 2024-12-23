import 'package:flutter/material.dart';

class DiseaseAction extends StatelessWidget {
  const DiseaseAction({super.key, required this.image, required this.title});
  final String title;
  final String image;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      height: 226,
      child: Card(
        color: Colors.grey[800],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        elevation: 3, // Adjust elevation to add a shadow
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
              child: Image.asset(
                image,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
