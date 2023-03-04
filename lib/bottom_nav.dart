import 'package:flutter/material.dart';
import './pages/TestRecords.dart';
import './pages/add_patient.dart';
import './pages/critical_paitent.dart';
import './pages/home.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<StatefulWidget> createState() {
    return _BottomNavState();
  }
}

class _BottomNavState extends State<BottomNav> {
  int _selectedIndex = 0;

  void _navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = const [
    Home(),
    AddPatient(),
    TestRecords(),
    CriticalPaitent()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _navigateBottomBar,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: Image.asset('lib/assets/icons/home.png', height: 22),
              label: "Home"),
          BottomNavigationBarItem(
              icon: Image.asset('lib/assets/icons/addpaitent.png', height: 22),
              label: 'Add Patient'),
          BottomNavigationBarItem(
              icon: Image.asset('lib/assets/icons/addmedicalrecords.png',
                  height: 22),
              label: 'Add Test'),
          BottomNavigationBarItem(
              icon: Image.asset('lib/assets/icons/critical.png', height: 26),
              label: 'Critical Patients'),
        ],
      ),
    );
  }
}
