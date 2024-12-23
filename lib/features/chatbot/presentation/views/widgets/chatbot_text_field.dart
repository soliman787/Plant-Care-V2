
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_care_ut/constants.dart';
import 'package:plant_care_ut/features/chatbot/presentation/manager/chat_cubit.dart';
import '../../../../../generated/assets.dart';
import '../../../../../generated/l10n.dart';

class ChatbotTextField extends StatelessWidget {
  const ChatbotTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<ChatCubit>().formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
          decoration: BoxDecoration(
            color: Colors.grey.shade800,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(Assets.imagesMessages),

              Expanded(
                child: SizedBox(
                  height: 55,
                  child: TextFormField(
                    controller: context.read<ChatCubit>().textEditingController,
                    onChanged: (value) {
                      if (context.read<ChatCubit>().messagesList.isEmpty) {
                        context.read<ChatCubit>().changeTypingState(value.isNotEmpty);
                      }
                    },
                    onTapOutside: (PointerDownEvent x){
                      FocusScope.of(context).unfocus();

                    },

                    maxLines: null,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none, // No visible border
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                      hintText: S.of(context).WriteYourMessage,
                      hintStyle: const TextStyle(color: Colors.white,height: 1.3),
                    ),
                  ),
                ),
              ),
              IconButton(
                  onPressed: () {
                    FocusScope.of(context).unfocus();
                    context.read<ChatCubit>().sendMessage();
                  },
                  icon: const Icon(Icons.send_sharp,
                    size: 24,
                    color: kPrimaryColor,
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
