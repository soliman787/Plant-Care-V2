import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_care_ut/core/utils/styles.dart';
import 'package:plant_care_ut/features/chatbot/presentation/manager/chat_cubit.dart';
import 'package:plant_care_ut/features/chatbot/presentation/views/widgets/chat_view_body.dart';

import '../../../../generated/l10n.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: const Color(0xFF171717),
        title: Text(S.of(context).TalkWithBot,style: Styles.styleMedium20.copyWith(color: Colors.white),),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            }, icon: const Icon(Icons.arrow_back_ios_rounded)),
        actions: [
          IconButton(onPressed: (){
            context.read<ChatCubit>().clearMessages();

          }, icon: const Icon(Icons.delete))
        ],
      ),
      body: const ChatViewBody(),
    );
  }
}
