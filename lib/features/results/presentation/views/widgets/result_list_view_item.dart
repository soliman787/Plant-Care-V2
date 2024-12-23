import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../generated/assets.dart';
import '../../../../../generated/l10n.dart';

class ResultListViewItem extends StatelessWidget {
  const ResultListViewItem({
    super.key, required this.text1, required this.text2, required this.image,
  });

  final String text1,text2,image;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25),
      child: Container(
        height: 375,
        width: 392,
        decoration: BoxDecoration(
            color: Color(0xFF2E372E),
            borderRadius: BorderRadius.circular(12)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:
          [
            Padding(
              padding: const EdgeInsets.only(left: 17,right: 17,top: 21.55,bottom: 17.55),
              child: Text(text1,style: Styles.styleBold20,),

            ),
            Padding(
              padding: const EdgeInsets.only(left: 17,right: 17),
              child: Row(
                children: [
                  SvgPicture.asset(Assets.imagesText),
                  SizedBox(width: 10,),
                  Flexible(child: Text(text2,style: Styles.styleRegular16,softWrap: true,))
                ],
              ),
            ),
            SizedBox(height: 15,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Image.asset(image,width: 500,height: 145,),
            ),
            SizedBox(height: 18,),
            Center(
              child: CustomButton1(
                backgroundColor: kPrimaryColor,
                text: S.of(context).ExploreDiagnosis,
                onPressed: (){},
                borderRadius: BorderRadius.circular(32),
                buttonHeight: 37,
                buttonWidth: 250,
                textStyle: Styles.styleSemiBold12.copyWith(color: Colors.white),
              ),
            ),
            SizedBox(height: 15,),

          ],),
      ),
    );
  }
}
