import 'package:flutter/material.dart';
import 'package:plant_care_ut/constants.dart';
import 'package:plant_care_ut/generated/l10n.dart';

import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../generated/assets.dart';

class TreatYourCropCard extends StatelessWidget {
  const TreatYourCropCard({
    super.key,
    required this.onPressed,
  });

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: SizedBox(
        height: 205,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
            side: const BorderSide(
              color: Color(0xFF838383), // Set your desired border color
              width: 1, // Set your desired border width
            ),
          ),
          elevation: 0,
          color: const Color(0xFF292929),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 31),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            Assets.imagesHome2,
                            width: 34,
                            height: 34,
                          ),
                          const SizedBox(height: 11),
                          Text(
                            S.of(context).takePhoto,
                            textAlign: TextAlign.center,
                            style: const TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                      const Spacer(),
                      const Padding(
                        padding: EdgeInsets.only(bottom: 18),
                        child: Icon(
                          Icons.arrow_forward_ios,
                          color: Color(0xFF949494),
                        ),
                      ),
                      const Spacer(),
                      Column(
                        children: [
                          Image.asset(
                            Assets.imagesHome1,
                            width: 34,
                            height: 34,
                          ),
                          const SizedBox(height: 11),
                          Text(
                            S.of(context).discover,
                            textAlign: TextAlign.center,
                            style: const TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                      const Spacer(),
                      const Padding(
                        padding: EdgeInsets.only(bottom: 18),
                        child: Icon(
                          Icons.arrow_forward_ios,
                          color: Color(0xFF949494),
                        ),
                      ),
                      const Spacer(),
                      Column(
                        children: [
                          Image.asset(
                            Assets.imagesHome3,
                            width: 34,
                            height: 34,
                          ),
                          const SizedBox(height: 11),
                          Text(
                            S.of(context).getMedicine,
                            textAlign: TextAlign.center,
                            style: const TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 29),
                Container(
                  width: 250,
                  height: 37,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFF43A047), Color(0xFFE8B520)],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      // Set transparent color
                      shadowColor: Colors.transparent,
                      // Remove shadow
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onPressed: () {
                      // Action for the button
                    },
                    child: Text(
                      "التقط صورة",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white, // Ensure text color is visible
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 11),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
