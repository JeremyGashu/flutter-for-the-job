import 'package:flutter/material.dart';
import 'package:flutter_chat_for_job/components/ConversationsContainer.dart';
import 'package:flutter_chat_for_job/models/ApplicationModel.dart';
import 'package:provider/provider.dart';

import 'components/PlaceHolderWidget.dart';

void main() {
  runApp(MaterialApp(
    home: ChangeNotifierProvider(
      create: (_) => ApplicationModel(),
      child: HomeScreen(),
    ),
    debugShowCheckedModeBanner: false,
  ));
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    PlaceholderWidget(),
    PlaceholderWidget(),
    ConversationsContainer(),
    PlaceholderWidget()
  ];

  onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: _children[_currentIndex],
        ),
        bottomNavigationBar: BottomNavigationBar(
          iconSize: 30,
          unselectedItemColor: Colors.black45,
          selectedItemColor: Colors.deepPurple,
          onTap: onTabTapped, // new
          currentIndex: _currentIndex, // new
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.message),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: '',
            )
          ],
        ),
      ),
    );
  }
}
