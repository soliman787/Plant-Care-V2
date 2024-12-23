import 'package:flutter/material.dart';
import 'package:plant_care_ut/features/pests_and_diseases/presentation/views/disease_view.dart';

import '../../../../../core/utils/styles.dart';

class HomeAction extends StatelessWidget {
  const HomeAction({
    super.key, required this.image, required this.title,
  });
  final String image;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: SizedBox(
        height: 150,
        child: InkWell(
          onTap: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>PestAndDiseaseView()));
          },
          borderRadius: BorderRadius.circular(8),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            elevation: 0,
            color: const Color(0xFF292929),
            child: Row(
              children: [
                const SizedBox(width: 21,),
                const Icon(Icons.arrow_back_ios_sharp,size: 28,),
                const Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment:MainAxisAlignment.center,
                  children: [
                    Image.asset(image),
                    const SizedBox(height: 8,),
                    Text(
                      title,
                      style: Styles.styleRegularInterLight16.copyWith(color: Colors.white),
                    )
                  ],
                ),
                const SizedBox(width: 29,),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
