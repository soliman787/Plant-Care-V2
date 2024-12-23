import 'package:flutter/material.dart';
import 'package:plant_care_ut/constants.dart';
import 'package:plant_care_ut/core/utils/styles.dart';
import 'package:plant_care_ut/features/home/presentation/views/widgets/home_action.dart';
import 'package:plant_care_ut/features/home/presentation/views/widgets/treat_your_crop_card.dart';
import 'package:plant_care_ut/features/home/presentation/views/widgets/watering_section.dart';
import 'package:plant_care_ut/features/home/presentation/views/widgets/weather_section.dart';
import 'package:plant_care_ut/generated/l10n.dart';

import '../../../../../generated/assets.dart';
import '../../../../select_your_crop/presentation/views/select_your_crop_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> yourCrops = [
      Assets.imagesCrop2,
      Assets.imagesCrop3,
      Assets.imagesCrop4,
      Assets.imagesCrop5,
      Assets.imagesCrop3,
      Assets.imagesCrop2,
   ];
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: CircleAvatar(
                    backgroundColor: kPrimaryColor,
                    child: Center(
                        child: IconButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      const SelectYourCropView()));
                            },
                            icon: const Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 25,
                            )))),
              ),
              const SizedBox(
                width: 20,
              ),
              Container(
                height: 50,
                width: 290,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(15)),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return IconButton(
                      onPressed: () {},
                      icon: Image.asset(
                        yourCrops[index],
                        fit: BoxFit
                            .contain, // Ensure image retains its original size
                      ),
                    );
                  },
                  itemCount: yourCrops.length,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 62,
            child: ListView(
              shrinkWrap: false,
              scrollDirection: Axis.horizontal,
              children: [
                const SizedBox(
                  width: 15,
                ),
                WateringSection(
                  image: Assets.imagesRemoveIcon,
                  title: S.of(context).spray,
                  description: S.of(context).notSuitable,
                ),
                const SizedBox(
                  width: 15,
                ),
                WeatherSection(
                  image: Assets.imagesSunIcon,
                  temp: '34°C',
                  description: S.of(context).weatherDetails,
                  title: S.of(context).weather,
                ),
                const SizedBox(
                  width: 15,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25, bottom: 11, right: 25),
            child: Text(
              S.of(context).treatCrop,
              style: Styles.styleSemiBoldLeagueSpartan16.copyWith(color: Colors.white),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          TreatYourCropCard(
            onPressed: () {},
          ),
          const SizedBox(
            height: 24,
          ),
          HomeAction(
            image: Assets.imagesHome4,
            title: S.of(context).disease,
          ),
          const SizedBox(
            height: 30,
          ),
          HomeAction(
            image: Assets.imagesHome5,
            title: S.of(context).consultant,
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
