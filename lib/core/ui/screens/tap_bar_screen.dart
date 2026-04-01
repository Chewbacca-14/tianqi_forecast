import 'package:flutter/material.dart';
import 'package:tianqi_forecast/core/ui/screens/home_screen.dart';
import 'package:tianqi_forecast/core/ui/screens/profile_screen.dart';
import 'package:tianqi_forecast/core/ui/widgets/custom_bottom_navigation_bar.dart';

class TapBarScreen extends StatefulWidget {
  const TapBarScreen({super.key});

  @override
  State<TapBarScreen> createState() => _TapBarScreenState();
}

class _TapBarScreenState extends State<TapBarScreen> {
  int currentIndex = 0;
  List<Widget> pageList = [
    const HomeScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pageList[currentIndex],
      bottomNavigationBar: CustomBottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
      ),
    );
  }
}
