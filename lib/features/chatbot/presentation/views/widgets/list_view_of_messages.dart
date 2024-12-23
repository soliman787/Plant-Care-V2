import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_care_ut/features/chatbot/data/models/message_model.dart';
import 'package:plant_care_ut/features/chatbot/presentation/manager/chat_cubit.dart';
import 'package:plant_care_ut/features/chatbot/presentation/views/widgets/chatbot_message.dart';
import 'package:plant_care_ut/features/chatbot/presentation/views/widgets/human_message.dart';
import 'package:plant_care_ut/features/chatbot/presentation/views/widgets/message_widget.dart';

class ListViewOfMessages extends StatelessWidget {
  final List<MessageModel> messages;

  const ListViewOfMessages({
    super.key, required this.messages,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 10),
      controller: context.read<ChatCubit>().scrollController,
      itemCount: messages.length,
      itemBuilder: (context ,index){
        final message = messages[index];
        final isUserMessage = message.sender == "user";


        return MessageWidget(
          message: message.message,
          isFromUser: isUserMessage,

        );
      },
    );
  }
}
