import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:plant_care_ut/features/chatbot/presentation/manager/chat_cubit.dart';
import 'package:plant_care_ut/features/chatbot/presentation/views/widgets/chatbot_message.dart';
import 'package:plant_care_ut/features/chatbot/presentation/views/widgets/chatbot_text_field.dart';
import 'package:plant_care_ut/features/chatbot/presentation/views/widgets/human_message.dart';
import 'package:plant_care_ut/features/chatbot/presentation/views/widgets/list_view_of_messages.dart';

class ChatViewBody extends StatelessWidget {
  const ChatViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          Expanded(
            child: BlocBuilder<ChatCubit, ChatState>(
              builder: (context, state) {
                if (state is MessageSent) {
                  return ListViewOfMessages(
                    messages: state.messages,
                  );
                }
                return const Center(child: Text('No messages yet !'));
              },
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 15),
            child: ChatbotTextField(),
          ),
          const SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }
}
