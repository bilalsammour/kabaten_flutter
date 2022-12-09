import 'package:flutter/material.dart';
import 'package:kabaten/generated/l10n.dart';
import 'package:kabaten/view/resources/app_resources.dart';
import 'package:kabaten/view/screens/dashboard/dashboard_section.dart';
import 'package:kabaten/view/screens/user/user_section.dart';
import 'package:kabaten/view/shared_widgets/templates/main_template.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const int _initialActiveIndex = 0;

  final List<Widget> _sections = const [
    DashboardSection(),
    UserSection(),
  ];

  int _selectedIndex = _initialActiveIndex;

  @override
  Widget build(BuildContext context) => MainTemplate(
        padding: EdgeInsets.zero,
        appBar: AppBar(
          title: Text(
            S.current.appName,
          ),
        ),
        bottomNavigationBar: NavigationBar(
          selectedIndex: _selectedIndex,
          onDestinationSelected: (index) => setState(
            () => _selectedIndex = index,
          ),
          destinations: [
            NavigationDestination(
              icon: const Icon(
                AppIcons.home,
              ),
              label: S.current.home,
              tooltip: S.current.home,
            ),
            NavigationDestination(
              icon: const Icon(
                AppIcons.user,
              ),
              label: S.current.user,
              tooltip: S.current.user,
            ),
          ],
        ),
        child: IndexedStack(
          index: _selectedIndex,
          children: _sections,
        ),
      );
}
