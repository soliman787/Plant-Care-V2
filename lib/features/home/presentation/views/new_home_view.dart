import 'package:flutter/material.dart';
import 'package:plant_care_ut/features/account/presentation/manager/views/account_view.dart';
import 'package:plant_care_ut/features/home/presentation/views/widgets/home_view_body.dart';
import 'package:plant_care_ut/features/home/presentation/views/widgets/new_home_view_body.dart';
import 'package:plant_care_ut/generated/assets.dart';

import '../../../account/presentation/manager/views/widgets/account_view_body.dart';
import '../../../chatbot/presentation/views/chatbot_view.dart';


class NewHomeView extends StatefulWidget {
  const NewHomeView({super.key});

  @override
  State<NewHomeView> createState() => _NewHomeViewState();
}

class _NewHomeViewState extends State<NewHomeView> {
  int _currentIndex = 0;
  final List<Widget> _body = const [
    NewHomeViewBody(),
    AccountView(),
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
      backgroundColor: Colors.black87,
      body: _body[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), label: 'Account'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),

        ],
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.white,
        backgroundColor: Colors.black87,
        type: BottomNavigationBarType.fixed,
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

