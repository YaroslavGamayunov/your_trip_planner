import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:your_trip_planner/screens/routes/views/routes_screen.dart';

import '../screens/cities/views/cities_screen.dart';

class YourTripPlannerScaffold extends StatefulWidget {
  const YourTripPlannerScaffold({super.key});

  @override
  State<YourTripPlannerScaffold> createState() =>
      _YourTripPlannerScaffoldState();
}

class _YourTripPlannerScaffoldState extends State<YourTripPlannerScaffold> {
  int _selectedIndex = 0; //New

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: switch (_selectedIndex) {
          0 => const CitiesScreen(),
          1 => const MyRoutesScreen(),
          2 => ProfileScreen(actions: [
              SignedOutAction((context) {
                Navigator.of(context).pushReplacementNamed('/sign-in');
              })
            ]),
          int() => throw Exception("invalid bottom nav tab id: $_selectedIndex")
        },
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.location_city),
              label: 'Cities',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.route),
              label: 'My routes',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
          onTap: _onItemTapped, //New
        ));
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
