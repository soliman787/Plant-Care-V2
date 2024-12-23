import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../../../../select_your_crop/presentation/views/select_your_crop_view.dart';

class HomeCropsSelection extends StatelessWidget {
  const HomeCropsSelection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
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
    );
  }
}
