import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:workwell/pages/Notification_page.dart';
import 'package:workwell/pages/dashboard_page.dart';
import 'package:workwell/pages/home_page.dart';
import 'package:workwell/pages/setting_page.dart';
import 'package:workwell/pages/team_page.dart';

class MainMenu extends StatefulWidget {
  const MainMenu({super.key});

  @override
  State<MainMenu> createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  int _page = 2;
  final PageController _pageController = PageController(initialPage: 2);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      bottomNavigationBar: CurvedNavigationBar(
        index: _page,
        color: Theme.of(context).colorScheme.onBackground,
        buttonBackgroundColor: Theme.of(context).colorScheme.primary,
        backgroundColor: Theme.of(context).colorScheme.background,
        items: [
          CurvedNavigationBarItem(
            child: Icon(
              Icons.dashboard_outlined,
              color: _page == 0
                  ? Theme.of(context).colorScheme.background
                  : Theme.of(context).colorScheme.inversePrimary,
            ),
          ),
          CurvedNavigationBarItem(
            child: Icon(
              Icons.work_outline,
              color: _page == 1
                  ? Theme.of(context).colorScheme.background
                  : Theme.of(context).colorScheme.inversePrimary,
            ),
          ),
          CurvedNavigationBarItem(
            child: Icon(
              Icons.home_outlined,
              color: _page == 2
                  ? Theme.of(context).colorScheme.background
                  : Theme.of(context).colorScheme.inversePrimary,
            ),
          ),
          CurvedNavigationBarItem(
            child: Icon(
              Icons.notifications_outlined,
              color: _page == 3
                  ? Theme.of(context).colorScheme.background
                  : Theme.of(context).colorScheme.inversePrimary,
            ),
          ),
          CurvedNavigationBarItem(
            child: Icon(
              Icons.settings_outlined,
              color: _page == 4
                  ? Theme.of(context).colorScheme.background
                  : Theme.of(context).colorScheme.inversePrimary,
            ),
          ),
        ],
        onTap: (index) {
          setState(() {
            _page = index;
            _pageController.animateToPage(index,
                duration: const Duration(milliseconds: 600),
                curve: Curves.ease);
          });
        },
      ),
      body: PageView(
        controller: _pageController,
        children: const <Widget>[
          DashBoardPage(),
          TeamPage(),
          HomePage(),
          NotificationsPage(),
          SettingsPage(),
        ],
      ),
    );
  }
}
