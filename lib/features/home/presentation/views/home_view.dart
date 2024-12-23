import 'package:flutter/material.dart';
import 'package:plant_care_ut/features/account/presentation/manager/views/widgets/account_view_body.dart';
import 'package:plant_care_ut/features/chatbot/presentation/views/chat_view.dart';
import 'package:plant_care_ut/features/chatbot/presentation/views/chatbot_view.dart';
import 'package:plant_care_ut/features/home/presentation/views/widgets/home_view_body.dart';
import 'package:plant_care_ut/generated/assets.dart';
import 'package:plant_care_ut/generated/l10n.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _currentIndex = 0;
  final List<Widget> _body = const [
    HomeViewBody(),
    AccountViewBody(),
    Placeholder()
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

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
      body: _body[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.grass, size: 30),
            label: S.of(context).crops,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.person_outline, size: 30),
            label: S.of(context).profile,
          ),
          BottomNavigationBarItem(
            icon: const Icon(
              Icons.forum,
              size: 30,
            ),
            label: S.of(context).forum,
          ),
        ],
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.black,
        backgroundColor: const Color(
            0xFF353636), // Similar to the light blue background in your image
      ),
      floatingActionButton: SizedBox(

        width: 77,
        height: 77,
        child: FloatingActionButton(
          elevation: 0,
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const ChatbotView()));

          },
          shape: const CircleBorder(),
          backgroundColor: Colors.transparent,
          child: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [ Color(0xFF98AFFF),Color(0xFF17EC6C),],

                ),
              ),
              child: Image.asset(Assets.imagesChatBot,width: 50,height: 50,)),
        ),
      ),
    );
  }
}
