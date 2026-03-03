import 'package:flutter/material.dart';
import 'package:tianqi_forecast/core/ui/screens/login_screen.dart';
import 'package:tianqi_forecast/core/ui/widgets/custom_button.dart';
import 'package:tianqi_forecast/core/ui/widgets/custom_text_field.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final emailAddressController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF121820),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 40.0, bottom: 24),
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
            Padding(
              padding: const EdgeInsets.only(top: 15.0, bottom: 9),
              child: Text(
                "Join Tianqi Forecast",
                style: TextStyle(
                  color: Color(0xFFF1F5F9),
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 24.0),
              child: Text(
                "Get hyper-local forecasts and severe\nweather alerts.",
                style: TextStyle(
                  color: Color(0xFF94A3B8),
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              ),
            ),
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
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 16),
              child: CustomTextField(
                controller: emailAddressController,
                hintText: "name@example.com",
              ),
            ),
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
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 16),
              child: CustomTextField(
                controller: passwordController,
                hintText: "Create a password",
                isPassword: true,
              ),
            ),
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
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 16),
              child: CustomTextField(
                controller: confirmPasswordController,
                hintText: "Repeat your password",
                isPassword: true,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 24.0, bottom: 16),
              child: CustomButton(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Color(0xFFFFFFFF),
                label: "Create account",
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 31),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account? ",
                    style: TextStyle(
                      color: Color(0xFF94A3B8),
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>LoginScreen(),
                        ),
                      );
                    },
                    child: Text(
                      "Log in",
                      style: TextStyle(
                        color: Color(0xFF4B91E2),
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                      ),
                    ),
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
