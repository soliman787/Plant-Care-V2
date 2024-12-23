import 'package:flutter/material.dart';
import 'package:plant_care_ut/core/utils/styles.dart';
import 'package:plant_care_ut/core/widgets/custom_button.dart';
import 'package:plant_care_ut/generated/assets.dart';
import 'package:plant_care_ut/generated/l10n.dart';

import '../../../../home/presentation/views/new_home_view.dart';

class NewSelectYourCropViewBody extends StatefulWidget {
  const NewSelectYourCropViewBody({super.key});

  @override
  State<NewSelectYourCropViewBody> createState() => _NewSelectYourCropViewBodyState();
}

class _NewSelectYourCropViewBodyState extends State<NewSelectYourCropViewBody> {
  List<int> selectedCrops = []; // Keep track of selected crop indices

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> crops = [
      {'name': S.of(context).carrot, 'image': Assets.imagesCarrot},
      {'name': S.of(context).tomato, 'image': Assets.imagesTomato},
      {'name': S.of(context).cucumber, 'image': Assets.imagesCucomber},
      {'name': S.of(context).onion, 'image': Assets.imagesOnion},
      {'name': S.of(context).eggPlant, 'image': Assets.imagesEggplant},
      {'name': S.of(context).bananas, 'image': Assets.imagesBanana},
      {'name': S.of(context).grape, 'image': Assets.imagesGrape},
      {'name': S.of(context).watermelon, 'image': Assets.imagesWatermelom},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const SizedBox(
          height: 50,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    S.of(context).selectCrops,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    S.of(context).selectEightCrops,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    S.of(context).youCanChange,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 5),
                ],
              ),
              const Spacer(),
              Text(
                '${selectedCrops.length}/8', // Displays number of selected crops
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(
                height: 90,
              ),
            ],
          ),
        ),
        const Divider(
          height: 0,
          endIndent: 0,
        ),
        // Grid of crops
        Expanded(
          child: GridView.builder(
            itemCount: crops.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 0.85,
            ),
            itemBuilder: (context, index) {
              final isSelected = selectedCrops.contains(index);
              return GestureDetector(
                onTap: () {
                  setState(() {
                    if (isSelected) {
                      selectedCrops.remove(index);
                    } else if (selectedCrops.length < 8) {
                      selectedCrops.add(index);
                    } else {
                      showCustomOverlay(context);
                    }
                  });
                },
                child: Column(
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundImage: AssetImage(crops[index]['image']!),
                          backgroundColor: isSelected
                              ? Colors.blue.withOpacity(0.5)
                              : Colors.transparent,
                        ),
                        if (isSelected)
                          const Icon(
                            Icons.check_circle,
                            color: Colors.green,
                            size: 40,
                          ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Text(
                      crops[index]['name']!,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        // Next button
        Container(
          height: 109,
          color: const Color(0x000000),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 30, bottom: 20),
              child: CustomButton1(
                buttonWidth: 135,
                buttonHeight: 38,
                borderRadius: BorderRadius.circular(12),
                backgroundColor:
                    selectedCrops.isNotEmpty // Disable if no crop is selected
                        ? const Color(0xFFD9D9D9)
                        : Colors.grey,
                text: S.of(context).nextInBoarding,
                onPressed: selectedCrops.isNotEmpty
                    ? () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => NewHomeView()));
                      }
                    : () {}, // Disable button if no crop is selected
                textStyle: Styles.styleBoldLeagueSpartan15
                    .copyWith(color: Colors.black),
              ),
            ),
          ),
        ),
      ],
    );
  }

  void showCustomOverlay(BuildContext context) {
    OverlayState? overlayState = Overlay.of(context);
    OverlayEntry overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        bottom: 50, // Adjust the position of the overlay
        left: 20,
        right: 20,
        child: Material(
          color: Colors.transparent,
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey[900],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.info, color: Colors.white),
                const SizedBox(width: 10),
                Text(
                  S.of(context).youCant,
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                ),
              ],
            ),
          ),
        ),
      ),
    );

    // Insert the overlay
    overlayState?.insert(overlayEntry);

    // Remove the overlay after 3 seconds
    Future.delayed(const Duration(seconds: 3), () {
      overlayEntry.remove();
    });
  }
}
