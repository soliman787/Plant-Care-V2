import 'package:flutter/material.dart';
import 'package:plant_care_ut/features/chatbot/presentation/views/widgets/chatbot_view_body.dart';

class ChatbotView extends StatelessWidget {
  const ChatbotView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(


      body: SafeArea(child: ChatbotViewBody()),
    );
  }
}
