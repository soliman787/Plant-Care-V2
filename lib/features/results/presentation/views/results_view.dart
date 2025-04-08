import 'dart:io';

import 'package:flutter/material.dart';
import 'package:plant_care_ut/core/utils/styles.dart';
import 'package:plant_care_ut/features/results/presentation/views/widgets/results_view_body.dart';

import '../../../../generated/l10n.dart';

class ResultsView extends StatelessWidget {
  const ResultsView({super.key, required this.file, required this.numberOfModel});
  final File? file;
  final int numberOfModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        title: Text(
          S.of(context).SimilarResults,
          style: Styles.styleBold24,
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios_rounded),
        ),
      ),
      body: SafeArea(child: ResultsViewBody(file: file,numberOfModel: numberOfModel,)),
    );
  }
}
