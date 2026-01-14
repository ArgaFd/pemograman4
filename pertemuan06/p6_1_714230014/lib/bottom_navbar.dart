import 'package:flutter/material.dart';
import 'simple_input.dart';
import 'input_validation.dart';
import 'input_form.dart';

// Global key untuk mempertahankan state
final Map<int, GlobalKey<NavigatorState>> _navigatorKeys = {
  0: GlobalKey<NavigatorState>(),
  1: GlobalKey<NavigatorState>(),
  2: GlobalKey<NavigatorState>(),
};

class DynamicBottomNavbar extends StatefulWidget {
  const DynamicBottomNavbar({super.key});
  @override
  State<DynamicBottomNavbar> createState() => _DynamicBottomNavbarState();
}

class _DynamicBottomNavbarState extends State<DynamicBottomNavbar> {
  int _currentPageIndex = 0;
  late final List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
      _buildPage(0, const MyInput()),
      _buildPage(1, const MyFormValidation()),
      _buildPage(2, const MyInputForm()),
    ];
  }

  Widget _buildPage(int index, Widget child) {
    return KeyedSubtree(
      key: ValueKey('page_$index'),
      child: child,
    );
  }
  void onTabTapped(int index) {
    setState(() {
      _currentPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final isFirstRouteInCurrentTab = !await _navigatorKeys[_currentPageIndex]!.currentState!.maybePop();
        return isFirstRouteInCurrentTab;
      },
      child: Scaffold(
        body: IndexedStack(
          index: _currentPageIndex,
          children: _pages,
        ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentPageIndex,
        onTap: onTabTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.task_alt_outlined),
            label: 'Latihan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.input_outlined),
            label: 'Form Validation',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt_outlined),
            label: 'CRUD',
          ),
        ],
        backgroundColor: Colors.blueAccent,
        selectedItemColor: Colors.yellow,
        unselectedItemColor: Colors.white,
        ),
      ),
    );
  }
}
