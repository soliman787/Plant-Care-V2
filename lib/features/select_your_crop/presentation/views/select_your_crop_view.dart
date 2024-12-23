import 'package:flutter/material.dart';
import 'package:plant_care_ut/features/select_your_crop/presentation/views/widgets/new_select_your_crop_view_body.dart';
import 'package:plant_care_ut/features/select_your_crop/presentation/views/widgets/select_your_crop_view_body.dart';

class SelectYourCropView extends StatelessWidget {
  const SelectYourCropView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: NewSelectYourCropViewBody(),
    );
  }
}
