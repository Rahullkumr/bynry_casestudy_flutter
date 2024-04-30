import 'package:bynry_casestudy_flutter/dashboard_viewpage.dart';
import 'package:bynry_casestudy_flutter/history.dart';
import 'package:bynry_casestudy_flutter/profile.dart';
import 'package:bynry_casestudy_flutter/support.dart';
import 'package:bynry_casestudy_flutter/usage.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _selectedIndex = 0; // Track the selected index

  final List<Widget> _screens = const [
    DashboardViewpage(),
    UsagePage(),
    HistoryPage(),
    SupportPage(),
    ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        leading: Builder(
          builder: (context) => RotatedBox(
            quarterTurns: 1, // Rotate 90 degrees clockwise
            child: IconButton(
              icon: const Icon(
                Icons.bar_chart,
                color: Colors.white,
              ),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle),
            color: Colors.white,
            onPressed: () {
              // Handle notification icon press event
            },
          ),
          IconButton(
            icon: const Icon(Icons.notifications_none),
            color: Colors.white,
            onPressed: () {
              // Handle profile icon press event
            },
          ),
        ],
      ),
      drawer: const Drawer(),
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 30,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.speed),
            label: "Dashboard",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.data_usage),
            label: "Usage",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: "History",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.support_agent),
            label: "Support",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.manage_accounts),
            label: "Profile",
          ),
        ],
        currentIndex: _selectedIndex, // makes icon active onTap
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.red,
        
      ),
    );
  }
}
