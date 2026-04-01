import 'package:flutter/material.dart';
import 'package:tianqi_forecast/core/ui/widgets/profile/color_switcher.dart';
import 'package:tianqi_forecast/core/ui/widgets/profile/profile_avatar.dart';
import 'package:tianqi_forecast/models/user.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({
    super.key,
  });

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final User _user = User(email: "example@gmail.com", createdAt: DateTime.now());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121820),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Profile',
              style: TextStyle(
                color: Color(0xFFF1F5F9),
                fontWeight: FontWeight.w700,
                fontSize: 24,
              ),
            ),
            SizedBox(
              height: 100,
            ),
            Center(
              child: Column(
                children: [
                  ProfileAvatar(),
                  SizedBox(
                    height: 30,
                  ),
                  ...[
                    Text(
                      _user.email,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                  SizedBox(
                    height: 30,
                  ),
                  CompactColorSwitch(
                    lightColor: Colors.white,
                    darkColor: Color(0xFF121820),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
