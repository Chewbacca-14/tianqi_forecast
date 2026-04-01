import 'package:flutter/material.dart';

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: Colors.white70
      ),
      child: Icon(Icons.person,size: 60,color: Colors.black12,),
    );
  }
}
