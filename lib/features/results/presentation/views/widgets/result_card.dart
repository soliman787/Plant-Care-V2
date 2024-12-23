import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/utils/styles.dart';
import '../../../../../generated/assets.dart';
import '../../../../../generated/l10n.dart';

class ResultCard extends StatelessWidget {
  const ResultCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24,right: 24,top: 10),
      child: Container(
        height: 85,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Color(0xFF292929)),
        child: Row(
          children: [
            SizedBox(width: 7,),
            SvgPicture.asset(Assets.imagesAsk),
            SizedBox(width: 8,),
            Flexible(
              child: Text(
                S.of(context).Result1,
                softWrap: true,
                textAlign: TextAlign.justify,
                style: Styles.styleRegular16,
              ),
            ),
            SizedBox(width: 22,),

          ],
        ),
      ),
    );
  }
}
