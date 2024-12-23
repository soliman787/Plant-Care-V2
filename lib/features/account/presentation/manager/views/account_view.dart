import 'package:flutter/material.dart';
import 'package:plant_care_ut/features/account/presentation/manager/views/widgets/account_view_body.dart';

import '../../../../../generated/assets.dart';
import '../../../../../generated/l10n.dart';

class AccountView extends StatelessWidget {
  const AccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        elevation: .6,
        title: Row(
          children: [
            Text(
              S.of(context).appName,
              style: const TextStyle(color: Colors.white),
            ),
            const Spacer(),
            IconButton(
                onPressed: () {}, icon: Image.asset(Assets.imagesHomeIcon))
          ],
        ),
      ),
      body: AccountViewBody(),
    );
  }
}
