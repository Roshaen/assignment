import 'package:assignment/screens/add_comment.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  static final List<Widget> _widgetOptions = <Widget>[
    const AddComment(),
    const Center(
      child: Text("Tickets"),
    ),
    const Center(
      child: Text("News"),
    ),
    const Center(
      child: Text("Profile"),
    )
  ];

  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onItemTap,
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color.fromARGB(255, 248, 250, 255),
        selectedItemColor: const Color.fromARGB(255, 94, 65, 240),
        unselectedItemColor: const Color.fromARGB(255, 128, 128, 128),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(FluentIcons.home_24_filled),
            label: "Home",
          ),
          BottomNavigationBarItem(
              icon: Icon(FluentIcons.card_ui_24_filled), label: "Add Card"),
          BottomNavigationBarItem(
              icon: Icon(FluentIcons.news_24_filled), label: "News"),
          BottomNavigationBarItem(
              icon: Icon(FluentIcons.person_24_filled), label: "Profile"),
        ],
      ),
    );
  }
}
