import 'package:flutter/material.dart';
import 'package:plant_care_ut/generated/l10n.dart';

import '../../../../../../generated/assets.dart';

class AccountViewBody extends StatelessWidget {
  const AccountViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          // User Account Section
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Color(0xFF263926),
              ),
              child: ListTile(
                leading: Image.asset(Assets.imagesProfileIcon,
                    width: 50), // Replace with your image
                title: Text(S.of(context).profile,style: const TextStyle(color: Colors.white),),
                subtitle: Text(S.of(context).JoinTheCommunity,style: const TextStyle(color: Colors.white),),
                trailing: ElevatedButton(
                  onPressed: () {},
                  child: Text(S.of(context).signIn),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.green,
                    side: BorderSide(color: Colors.green),
                  ),
                ),
              ),
            ),
          ),
          // First Card
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Color(0xFF263926),
              ),
              child: ListTile(
                leading: Image.asset(Assets.imagesWhLeaf,
                    width: 50), // Replace with your image
                title: Text(style: const TextStyle(color: Colors.white),S.of(context).growSmart),
                subtitle: Text(
                  style: const TextStyle(color: Colors.white),
                    S.of(context).share),
                trailing: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(backgroundColor: Colors.green),
                  child: Text(S.of(context).share1,style: const TextStyle(color: Colors.white),),
                ),
              ),
            ),
          ),
          // Second Card
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Color(0xFF263926),
              ),
              child: ListTile(
                leading: Image.asset(Assets.imagesPen,
                    width: 50), // Replace with your image
                title: Text(S.of(context).howYourExperience,style: const TextStyle(color: Colors.white),),
                subtitle: Text(S.of(context).yourIdeas,style: const TextStyle(color: Colors.white),),
                trailing: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(backgroundColor: Colors.green),
                  child: Text(S.of(context).rate,style: const TextStyle(color: Colors.white),),
                ),
              ),
            ),
          ),
        ],
      );
  }
}
