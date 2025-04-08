import 'package:flutter/material.dart';
import 'package:plant_care_ut/core/utils/styles.dart';
import 'package:plant_care_ut/features/chatbot/presentation/views/chat_view.dart';
import 'package:plant_care_ut/features/chatbot/presentation/views/widgets/option_card.dart';
import 'package:plant_care_ut/features/chatbot/presentation/views/widgets/past_topic_card.dart';
import 'package:plant_care_ut/generated/assets.dart';

import '../../../../../generated/l10n.dart';

class ChatbotViewBody extends StatelessWidget {
  const ChatbotViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(onPressed: (){
                Navigator.of(context).pop();
              }, icon: const Icon(Icons.arrow_back_ios_rounded)),
              Padding(
                padding: const EdgeInsets.only(right: 24, left: 24),
                child: Text(
                  S.of(context).Welcome,
                  style: Styles.styleBoldLeagueSpartan40.copyWith(
                      color: Colors.white),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10, left: 10),
                child: RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: '${S.of(context).How} ',
                        style: Styles.styleExtraBold32,
                      ),
                      TextSpan(text: S.of(context).HowTo, style: Styles.styleMedium32),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Image.asset(
                  Assets.imagesChatbot,
                  height: 280,
                  width: 280,
                ),
              ),
              const SizedBox(height: 14),
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                   OptionCard(
                    color: const Color(0xFF2E372E),
                    icon: Assets.imagesCamera,
                    text: S.of(context).SearchByPhoto,
                  ),
                  OptionCard( onTap: ()
                    {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ChatView()));
                    },
                    color: const Color(0xFF4B8A4E),
                    icon: Assets.imagesPen,
                    text: S.of(context).AskAgain,
                  ),
                ],
              ),
              const SizedBox(height: 32),
              Padding(
                padding: const EdgeInsets.only(left: 24, right: 24),
                child: Text(
                  S.of(context).ChatHistory,
                  style: Styles.styleBold24.copyWith(
                      color: Colors.white),
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),

        // Use SliverList for dynamic content
        SliverList(
          delegate: SliverChildBuilderDelegate(
                (context, index) {
              return PastTopicCard(
                text: S.of(context).PreviousChats,
                icon: index % 2 == 0 ? Assets.imagesGallery : Assets.imagesMessageText,
              );
            },
            childCount: 4, // Number of items in the list
          ),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 50,))
      ],
    );
  }
}
