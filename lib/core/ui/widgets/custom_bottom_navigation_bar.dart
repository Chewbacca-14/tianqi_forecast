import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  State<CustomBottomNavigationBar> createState() => _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color:Color(0xFF1E293B) ))
      ),
      child: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: "HOME",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "FAVORITES",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "PROFILE"),
        ],
        selectedItemColor: Color(0xFF4B91E2),
        unselectedItemColor: Color(0xFF64748B),
        backgroundColor: Color(0xFF121820),
        iconSize: 30,
        selectedFontSize: 10,
        unselectedFontSize: 10,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.w500),
        unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w500),
        elevation: 10,
      ),
    );
  }
}
