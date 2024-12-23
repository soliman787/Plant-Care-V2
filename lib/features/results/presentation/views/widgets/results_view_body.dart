import 'package:flutter/material.dart';
import 'package:plant_care_ut/features/results/presentation/views/widgets/result_card.dart';
import 'package:plant_care_ut/features/results/presentation/views/widgets/result_list_view_item.dart';
import 'package:plant_care_ut/generated/assets.dart';

import '../../../../../core/widgets/custom_card.dart';
import '../../../../../generated/l10n.dart';

class ResultsViewBody extends StatelessWidget {
  const ResultsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ResultCard(),
          SizedBox(
            height: 32,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: ListView.builder(
                shrinkWrap: true,
                // Ensures the ListView takes the height of its children
                physics: NeverScrollableScrollPhysics(),
                // Prevents scrolling if inside a scrollable parent
                itemCount: 2,
                itemBuilder: (context, index) {
                  return ResultListViewItem(
                    image: Assets.imagesSilver2,
                    text1: S.of(context).Result2,
                    text2: S.of(context).Result3,
                  );
                }),
          ),
          CustomCard(
            horizontalPadding: 24,
            text: S.of(context).ResultIncorrect,
            image: Assets.imagesDoc,
            onPressed: () {},
          ),
          SizedBox(height: 15,)
        ],
      ),
    );
  }
}
