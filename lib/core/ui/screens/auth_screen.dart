import 'package:flutter/material.dart';
import 'package:tianqi_forecast/core/ui/screens/home_screen.dart';
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
  void dispose() {
    emailAddressController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const _AuthBackground(),
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
            child: SafeArea(
              child: Center(
                child: SingleChildScrollView(
                  keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 440),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 76,
                          height: 76,
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Color(0xFF60A5FA),
                                Color(0xFF2563EB),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(26),
                            boxShadow: [
                              BoxShadow(
                                color: const Color(0xFF2563EB).withAlpha(89),
                                blurRadius: 28,
                                offset: const Offset(0, 12),
                              ),
                            ],
                          ),
                          child: const Icon(
                            Icons.cloud_outlined,
                            size: 42,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 22),
                        Text(
                          isLogin ? "Vítejte zpět" : "Vytvořte si účet",
                          style: const TextStyle(
                            color: Color(0xFFF1F5F9),
                            fontSize: 30,
                            fontWeight: FontWeight.w800,
                            letterSpacing: -0.4,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          "Získejte hyperlokální předpovědi a\nupozornění na nepříznivé počasí.",
                          style: TextStyle(
                            color: Color(0xFF94A3B8),
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            height: 1.35,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 22),
                        Container(
                          padding: const EdgeInsets.all(18),
                          decoration: BoxDecoration(
                            color: const Color(0xFF0B1220).withAlpha(173),
                            borderRadius: BorderRadius.circular(28),
                            border: Border.all(
                              color: Colors.white.withAlpha(20),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withAlpha(89),
                                blurRadius: 30,
                                offset: const Offset(0, 16),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              const Text(
                                "E-mail",
                                style: TextStyle(
                                  color: Color(0xFFCBD5E1),
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 8),
                              CustomTextField(
                                decoration: BoxDecoration(
                                  color: const Color(0xFF0F172A).withAlpha(140),
                                  border: Border.all(
                                    color: Colors.white.withAlpha(20),
                                  ),
                                  borderRadius: BorderRadius.circular(18),
                                ),
                                controller: emailAddressController,
                                height: 56,
                                hintText: "jmeno@gmail.com",
                                prefixIcon: const Icon(
                                  Icons.mail_outline_rounded,
                                  color: Color(0xFF94A3B8),
                                  size: 20,
                                ),
                              ),
                              const SizedBox(height: 14),
                              const Text(
                                "Heslo",
                                style: TextStyle(
                                  color: Color(0xFFCBD5E1),
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 8),
                              CustomTextField(
                                decoration: BoxDecoration(
                                  color: const Color(0xFF0F172A).withAlpha(140),
                                  border: Border.all(
                                    color: Colors.white.withAlpha(20),
                                  ),
                                  borderRadius: BorderRadius.circular(18),
                                ),
                                controller: passwordController,
                                height: 56,
                                hintText: isLogin ? "Vaše heslo" : "Vytvořte heslo",
                                obscure: true,
                                prefixIcon: const Icon(
                                  Icons.lock_outline_rounded,
                                  color: Color(0xFF94A3B8),
                                  size: 20,
                                ),
                              ),
                              if (!isLogin) ...[
                                const SizedBox(height: 14),
                                const Text(
                                  "Potvrdit heslo",
                                  style: TextStyle(
                                    color: Color(0xFFCBD5E1),
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                CustomTextField(
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF0F172A).withAlpha(140),
                                    border: Border.all(
                                      color: Colors.white.withAlpha(20),
                                    ),
                                    borderRadius: BorderRadius.circular(18),
                                  ),
                                  controller: confirmPasswordController,
                                  height: 56,
                                  hintText: "Zopakujte heslo",
                                  obscure: true,
                                  prefixIcon: const Icon(
                                    Icons.lock_outline_rounded,
                                    color: Color(0xFF94A3B8),
                                    size: 20,
                                  ),
                                ),
                              ],
                              const SizedBox(height: 22),
                              CustomButton(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => HomeScreen(),
                                    ),
                                  );
                                },
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: const Color(0xFFFFFFFF),
                                label: isLogin ? "Přihlásit se" : "Vytvořit účet",
                              ),
                              const SizedBox(height: 16),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    isLogin ? "Nemáte účet?" : "Už máte účet?",
                                    style: const TextStyle(
                                      color: Color(0xFF94A3B8),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: changeScreen,
                                    child: Text(
                                      isLogin ? " Registrovat se" : " Přihlásit se",
                                      style: const TextStyle(
                                        color: Color(0xFF60A5FA),
                                        fontWeight: FontWeight.w800,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _AuthBackground extends StatelessWidget {
  const _AuthBackground();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF0B1220),
            Color(0xFF0A1A33),
            Color(0xFF050B14),
          ],
          stops: [0.0, 0.55, 1.0],
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            left: -120,
            top: -140,
            child: _GlowBlob(
              size: 320,
              color: const Color(0xFF2563EB),
              opacity: 0.35,
            ),
          ),
          Positioned(
            right: -140,
            bottom: -160,
            child: _GlowBlob(
              size: 360,
              color: const Color(0xFF60A5FA),
              opacity: 0.22,
            ),
          ),
          Positioned(
            right: 40,
            top: 120,
            child: _GlowBlob(
              size: 160,
              color: const Color(0xFF22D3EE),
              opacity: 0.12,
            ),
          ),
        ],
      ),
    );
  }
}

class _GlowBlob extends StatelessWidget {
  final double size;
  final Color color;
  final double opacity;

  const _GlowBlob({
    required this.size,
    required this.color,
    required this.opacity,
  });

  @override
  Widget build(BuildContext context) {
    final alpha = (opacity * 255).round().clamp(0, 255);
    final blobColor = color.withAlpha(alpha);

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: blobColor,
        boxShadow: [
          BoxShadow(
            color: blobColor,
            blurRadius: 90,
            spreadRadius: 18,
          ),
        ],
      ),
    );
  }
}
