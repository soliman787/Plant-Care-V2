import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:plant_care_ut/constants.dart';
import 'package:plant_care_ut/core/widgets/custom_card.dart';
import 'package:plant_care_ut/features/home/presentation/views/widgets/home_crops_list_view_item.dart';
import 'package:plant_care_ut/features/home/presentation/views/widgets/home_crops_selection.dart';
import 'package:plant_care_ut/features/home/presentation/views/widgets/home_search_text_field.dart';
import 'package:plant_care_ut/features/home/presentation/views/widgets/treat_your_crop_card.dart';
import 'package:plant_care_ut/features/home/presentation/views/widgets/weather_card.dart';
import 'package:plant_care_ut/features/pests_and_diseases/presentation/views/disease_view.dart';
import 'package:plant_care_ut/features/results/presentation/views/results_view.dart';
import 'package:plant_care_ut/generated/assets.dart';
import 'package:badges/badges.dart' as badges;
import '../../../../../core/utils/styles.dart';
import '../../../../../generated/l10n.dart';
import '../../../../select_your_crop/presentation/views/select_your_crop_view.dart';

class NewHomeViewBody extends StatelessWidget {
  const NewHomeViewBody({super.key});


  @override
  Widget build(BuildContext context) {
    List<String> crops = [
      Assets.imagesPota,
      Assets.imagesC1,
      Assets.imagesC2,
      Assets.imagesC3,
      Assets.imagesC4,
      Assets.imagesC5,
      Assets.imagesC6,
    ];
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        S.of(context).Welcome,
                        style: Styles.styleMedium32
                            .copyWith(color: Colors.white, fontSize: 30),
                      ),
                      Text(
                        S.of(context).HomeSentence,
                        style: Styles.styleMedium20.copyWith(
                            fontWeight: FontWeight.w400,
                            color: const Color(0xFF888888)),
                      ),
                    ],
                  ),
                  const Spacer(),
                  badges.Badge(
                    showBadge: true,
                    position: badges.BadgePosition.topEnd(top: 0, end: 3),
                    badgeContent: const Text(
                      '3',
                      style: TextStyle(color: Colors.white),
                    ),
                    badgeStyle: badges.BadgeStyle(
                      shape: badges.BadgeShape.circle,
                      badgeColor: Colors.red,
                      padding: const EdgeInsets.all(5),
                      borderRadius: BorderRadius.circular(4),
                      borderSide:
                          const BorderSide(color: Colors.white, width: .8),
                    ),
                    child: IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset(Assets.imagesNotification)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            const HomeSearchTextField(),
            const SizedBox(
              height: 32,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 23, right: 23,bottom: 24),
              child: Text(
                S.of(context).YourCrops,
                style: Styles.styleRegularInterLight22
                    .copyWith(fontWeight: FontWeight.w500, color: Colors.white),
              ),
            ),
            Stack(
              children: [
                SizedBox(
                  height: 56,
                  child: ListView.builder(
                      itemCount: crops.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index)
                      {
                        return HomeCropsListViewItem(crops: crops[index]);
                      }),
                ),
                HomeCropsSelection()
              ],
            ),
            const SizedBox(
              height: 32,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 23, right: 23, bottom: 24),
              child: Text(
                S.of(context).WeatherConditions,
                style: Styles.styleRegularInterLight22
                    .copyWith(fontWeight: FontWeight.w500, color: Colors.white),
              ),
            ),
            WeatherCard(
              temp: '34°C',
              location: S.of(context).Location,
              tempCon: S.of(context).TempCon,
              water1: S.of(context).Water1,
              water2: S.of(context).Water1,
              water3: S.of(context).Water2,
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 23, right: 23, bottom: 24, top: 24),
              child: Text(
                S.of(context).Treat,
                style: Styles.styleRegularInterLight22
                    .copyWith(fontWeight: FontWeight.w500, color: Colors.white),
              ),
            ),
            TreatYourCropCard(
              onPressed: () {},
            ),
            const SizedBox(
              height: 46,
            ),
            CustomCard(
              onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>PestAndDiseaseView()));
              },
              image: Assets.imagesVirus,
              text: S.of(context).disease,
            ),
            const SizedBox(
              height: 8,
            ),
            CustomCard(
              onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ResultsView()));
              },
              image: Assets.imagesDoc,
              text: S.of(context).consultant,
            ),
            const SizedBox(
              height: 70,
            )
          ],
        ),
      ),
    );
  }
}

