import 'dart:io';

import 'package:flutter/material.dart';
import 'package:plant_care_ut/features/results/presentation/views/widgets/result_card.dart';
import 'package:plant_care_ut/features/results/presentation/views/widgets/result_list_view_item.dart';
import 'package:plant_care_ut/generated/assets.dart';

import '../../../../../core/widgets/custom_card.dart';
import '../../../../../generated/l10n.dart';

class ResultsViewBody extends StatelessWidget {
  const ResultsViewBody({super.key, required this.file, required this.numberOfModel});
  final File? file;
  final int numberOfModel;


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const ResultCard(),
          const SizedBox(
            height: 32,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: ResultListViewItem(
              numberOfModel: numberOfModel,
              file: file,
              image: Assets.imagesSilver2,
              text1: S.of(context).Result2,
              text2: 'Symptoms of the disease appear as silver spots ',
            )
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
