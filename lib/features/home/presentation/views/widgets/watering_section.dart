import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';

class WateringSection extends StatelessWidget {
  const WateringSection({
    super.key, required this.image, required this.title, required this.description,
  });

  final String image;
  final String title;
  final String description;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          border:
          Border.all(width: .5, color: const Color(0xFF838383))),
      child: SizedBox(
        height: 48,
        width: 256,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40.0),
          ),
          elevation: 0,
          color: const Color(0xFF292929),
          child: Row(
            children: [
              const SizedBox(
                width: 13,
              ),
              Image.asset(
                image,
                width: 31,
                height: 31,
              ),
              const Spacer(),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      style: Styles.styleRegular10.copyWith(color: Colors.white),
                    ),
                    Text(
                      description,
                      style: Styles.styleRegular10.copyWith(color: Colors.white),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 43,
              )
            ],
          ),
        ),
      ),
    );
  }
}
