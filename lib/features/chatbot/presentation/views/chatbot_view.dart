import 'package:flutter/material.dart';
import 'package:plant_care_ut/features/chatbot/presentation/views/widgets/chatbot_view_body.dart';

class ChatbotView extends StatelessWidget {
  const ChatbotView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        surfaceTintColor: const Color(0xFF171717),

      leading: IconButton(onPressed: (){
        Navigator.of(context).pop();
      }, icon: const Icon(Icons.arrow_back_ios_rounded)),
      ),
      body: const SafeArea(child: ChatbotViewBody()),
    );
  }
}
