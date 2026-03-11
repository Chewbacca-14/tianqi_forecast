import 'package:flutter/material.dart';
import 'package:tianqi_forecast/core/ui/screens/home_screen.dart';
import 'package:tianqi_forecast/core/ui/screens/tap_bar_screen.dart';
import 'package:tianqi_forecast/core/ui/widgets/custom_button.dart';
import 'package:tianqi_forecast/core/ui/widgets/custom_text_field.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool isLogin = true;

  final emailAddressController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  void changeScreen() {
    if (!mounted) return;
    setState(() {
      isLogin = !isLogin;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF121820),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Container(
                width: 76,
                height: 64,
                decoration: BoxDecoration(
                  color: Color(0xFF4B91E2).withAlpha(20),
                  borderRadius: BorderRadius.circular(600),
                ),
                child: Icon(
                  Icons.cloud_outlined,
                  size: 44,
                  color: Color(0xFF4B91E2),
                ),
              ),
            ),
            SizedBox(height: 39),
            Text(
              isLogin == true ? "Login" : "Join Tianqi Forecast",
              style: TextStyle(
                color: Color(0xFFF1F5F9),
                fontSize: 30,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 9),
            Text(
              "Get hyper-local forecasts and severe\nweather alerts.",
              style: TextStyle(
                color: Color(0xFF94A3B8),
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 24),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Email Address",
                style: TextStyle(
                  color: Color(0xFFCBD5E1),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 8),
            CustomTextField(
              decoration: BoxDecoration(
                color: Color(0xFF0F172A).withAlpha(80),
                border: BoxBorder.all(
                  color: Color(0xFF1E293B),
                ),
                borderRadius: BorderRadius.circular(24),
              ),
              controller: emailAddressController,
              height: 56,
              hintText: "name@example.com",
            ),
            SizedBox(height: 16),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Password",
                style: TextStyle(
                  color: Color(0xFFCBD5E1),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.start,
              ),
            ),
            SizedBox(height: 8),
            CustomTextField(
              decoration: BoxDecoration(
                color: Color(0xFF0F172A).withAlpha(80),
                border: BoxBorder.all(
                  color: Color(0xFF1E293B),
                ),
                borderRadius: BorderRadius.circular(24),
              ),
              controller: passwordController,
              height: 56,
              hintText: isLogin == true ? "Password" : "Create a password",
              obscure: true,
            ),
            isLogin == true
                ? SizedBox.shrink()
                : Column(
                    children: [
                      SizedBox(height: 8),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Confirm password",
                          style: TextStyle(
                            color: Color(0xFFCBD5E1),
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ),
                      SizedBox(height: 8),
                      CustomTextField(
                        decoration: BoxDecoration(
                          color: Color(0xFF0F172A).withAlpha(80),
                          border: BoxBorder.all(
                            color: Color(0xFF1E293B),
                          ),
                          borderRadius: BorderRadius.circular(24),
                        ),
                        controller: confirmPasswordController,
                        height: 56,
                        hintText: "Repeat your password",
                        obscure: true,
                      ),
                    ],
                  ),
            SizedBox(height: 40),
            CustomButton(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TapBarScreen(),
                  ),
                );
              },
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: Color(0xFFFFFFFF),
              label: isLogin == true ? "Login" : "Create account",
            ),

            SizedBox(height: 47),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  isLogin == true ? "Don’t have an account?" : "Already have an account? ",
                  style: TextStyle(
                    color: Color(0xFF94A3B8),
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                  ),
                ),
                TextButton(
                  onPressed: changeScreen,
                  child: Text(
                    isLogin == true ? "Sign up" : "Log in",
                    style: TextStyle(
                      color: Color(0xFF4B91E2),
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
