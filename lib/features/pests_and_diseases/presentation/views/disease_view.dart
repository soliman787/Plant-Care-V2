import 'package:flutter/material.dart';
import 'package:plant_care_ut/features/pests_and_diseases/presentation/views/widgets/disease_action.dart';

import '../../../../../generated/assets.dart';


class PestAndDiseaseView extends StatelessWidget {
  const PestAndDiseaseView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('الآفات والأمراض'),
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'معلومات حول النبات خاصتك',
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
                DropdownButton<String>(
                  dropdownColor: Colors.grey[850],
                  value: 'المحاصيل',
                  items: <String>['المحاصيل', 'الخيار الثاني']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Row(
                        children: [
                          Icon(Icons.bug_report, color: Colors.white),
                          SizedBox(width: 8),
                          Text(
                            value,
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {},
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'الأمراض حسب المرحله',
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),
                    const Text(
                      'جميع الآفات والأمراض التي قد تظهر في محصولك\nفي مراحل مختلفة',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Switch(
                          value: false,
                          onChanged: (value) {},
                          activeColor: Colors.white,
                        ),
                        const Text(
                          'مرحلة الشتلات',
                          style: TextStyle(color: Colors.white, fontSize: 22),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    // DiseaseAction(image: (Assets.imagesApple), title: 'sadfasd'),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        DiseaseAction(
                            image: 'assets/images/pen.jpeg', title: 'sadfasd'),
                        DiseaseAction(
                            image: 'assets/images/pen.jpeg', title: 'sadfasd'),
                      ],
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        DiseaseAction(
                            image: 'assets/images/pen.jpeg', title: 'sadfasd'),
                        DiseaseAction(
                            image: 'assets/images/pen.jpeg', title: 'sadfasd'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
