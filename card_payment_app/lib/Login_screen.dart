import 'package:flutter/material.dart';
import 'package:card_payment_app/Home_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {

  final email = TextEditingController();
  final password = TextEditingController();

  bool hidePassword = true;
  bool isLoading = false;

  AnimationController? _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    _controller!.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller?.dispose();
    email.dispose();
    password.dispose();
    super.dispose();
  }

  // ✅ TOP SNACKBAR
  void showTopSnackBar(String message) {
    final overlay = Overlay.of(context);

    final overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: 55,
        left: 20,
        right: 20,
        child: Material(
          color: Colors.transparent,
          child: TweenAnimationBuilder(
            duration: Duration(milliseconds: 400),
            tween: Tween(begin: -100.0, end: 0.0),
            builder: (context, value, child) {
              return Transform.translate(
                offset: Offset(0, value),
                child: child,
              );
            },
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 18,
                vertical: 16,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                gradient: LinearGradient(
                  colors: [
                    Color(0xff00C9FF),
                    Color(0xff92FE9D),
                  ],
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black45,
                    blurRadius: 14,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.verified_user_rounded,
                    color: Colors.white,
                  ),

                  SizedBox(width: 12),

                  Expanded(
                    child: Text(
                      message,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );

    overlay.insert(overlayEntry);

    Future.delayed(Duration(seconds: 2), () {
      overlayEntry.remove();
    });
  }

  // ✅ LOGIN FUNCTION
  void login() async {

    setState(() {
      isLoading = true;
    });

    await Future.delayed(Duration(seconds: 2));

    setState(() {
      isLoading = false;
    });

    showTopSnackBar("Secure Login Successful");

    Future.delayed(Duration(seconds: 2), () {

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ProCardPaymentScreen(),
        ),
      );

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff060B16),

      body: Stack(
        children: [

          // 🌌 TOP GLOW
          Positioned(
            top: -120,
            left: -80,
            child: Container(
              height: 250,
              width: 250,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue.withOpacity(0.15),
              ),
            ),
          ),

          // 🌌 BOTTOM GLOW
          Positioned(
            bottom: -120,
            right: -80,
            child: Container(
              height: 250,
              width: 250,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.purple.withOpacity(0.15),
              ),
            ),
          ),

          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),

              child: SingleChildScrollView(
                child: Column(
                  children: [

                    SizedBox(height: 45),

                    // 🏦 BRAND
                    FadeTransition(
                      opacity: Tween(
                        begin: 0.7,
                        end: 1.0,
                      ).animate(_controller!),

                      child: Column(
                        children: [

                          // 🔵 LOGO
                          Container(
                            padding: EdgeInsets.all(18),

                            decoration: BoxDecoration(
                              shape: BoxShape.circle,

                              gradient: LinearGradient(
                                colors: [
                                  Color(0xff00D4FF),
                                  Color(0xff7F00FF),
                                ],
                              ),

                              boxShadow: [
                                BoxShadow(
                                  color: Colors.blue.withOpacity(0.4),
                                  blurRadius: 20,
                                  spreadRadius: 3,
                                ),
                              ],
                            ),

                            child: Icon(
                              Icons.account_balance_wallet_rounded,
                              color: Colors.white,
                              size: 42,
                            ),
                          ),

                          SizedBox(height: 22),

                          // 🏦 NAME
                          Text(
                            "VAULTIQ",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 32,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 4,
                            ),
                          ),

                          SizedBox(height: 8),

                          Text(
                            "Next Generation Fintech Banking",
                            style: TextStyle(
                              color: Colors.white60,
                              fontSize: 14,
                              letterSpacing: 1,
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 55),

                    // 📧 EMAIL FIELD
                    buildField(
                      controller: email,
                      hint: "Email Address",
                      icon: Icons.email_outlined,
                      obscure: false,
                    ),

                    SizedBox(height: 18),

                    // 🔒 PASSWORD FIELD
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),

                        border: Border.all(
                          color: Colors.white.withOpacity(0.12),
                        ),

                        boxShadow: [
                          BoxShadow(
                            color: Colors.cyan.withOpacity(0.05),
                            blurRadius: 12,
                            spreadRadius: 1,
                          ),
                        ],
                      ),

                      child: TextField(
                        controller: password,
                        obscureText: hidePassword,
                        style: TextStyle(color: Colors.white),

                        decoration: InputDecoration(
                          hintText: "Password",

                          hintStyle: TextStyle(
                            color: Colors.white38,
                          ),

                          prefixIcon: Icon(
                            Icons.lock_outline,
                            color: Colors.white70,
                          ),

                          suffixIcon: IconButton(
                            icon: Icon(
                              hidePassword
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off_outlined,
                              color: Colors.white70,
                            ),

                            onPressed: () {
                              setState(() {
                                hidePassword = !hidePassword;
                              });
                            },
                          ),

                          filled: true,
                          fillColor: Colors.white.withOpacity(0.04),

                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 12),

                    // 🔐 TRUST SIGNALS
                    Row(
                      mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,

                      children: [

                        Row(
                          children: [

                            Icon(
                              Icons.shield_outlined,
                              color: Colors.greenAccent,
                              size: 18,
                            ),

                            SizedBox(width: 6),

                            Text(
                              "Secure Login",
                              style: TextStyle(
                                color: Colors.white60,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),

                        Text(
                          "Protected by Encryption",
                          style: TextStyle(
                            color: Colors.white38,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 35),

                    // 🔥 LOGIN BUTTON
                    SizedBox(
                      width: double.infinity,
                      height: 58,

                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius:
                          BorderRadius.circular(18),

                          gradient: LinearGradient(
                            colors: [
                              Color(0xff00D4FF),
                              Color(0xff7F00FF),
                            ],
                          ),

                          boxShadow: [
                            BoxShadow(
                              color: Colors.blue.withOpacity(0.35),
                              blurRadius: 18,
                              spreadRadius: 2,
                            ),
                          ],
                        ),

                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            shadowColor: Colors.transparent,

                            shape: RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.circular(18),
                            ),
                          ),

                          onPressed: isLoading ? null : login,

                          child: isLoading
                              ? SizedBox(
                            height: 24,
                            width: 24,

                            child: CircularProgressIndicator(
                              color: Colors.white,
                              strokeWidth: 2.8,
                            ),
                          )
                              : Text(
                            "LOGIN",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2,

                              shadows: [
                                Shadow(
                                  blurRadius: 10,
                                  color: Colors.black45,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 28),

                    // 👆 BIOMETRIC
                    Column(
                      children: [

                        Container(
                          padding: EdgeInsets.all(14),

                          decoration: BoxDecoration(
                            shape: BoxShape.circle,

                            border: Border.all(
                              color: Colors.white24,
                            ),
                          ),

                          child: Icon(
                            Icons.fingerprint,
                            color: Colors.white70,
                            size: 34,
                          ),
                        ),

                        SizedBox(height: 10),

                        Text(
                          "Login with Biometrics",
                          style: TextStyle(
                            color: Colors.white60,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 35),

                    // 🆕 SIGNUP
                    Row(
                      mainAxisAlignment:
                      MainAxisAlignment.center,

                      children: [

                        Text(
                          "Don't have an account? ",
                          style: TextStyle(
                            color: Colors.white54,
                          ),
                        ),

                        GestureDetector(
                          onTap: () {},

                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                              color: Color(0xff00D4FF),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 40),

                    // 🛡️ FOOTER
                    Text(
                      "Your financial data is encrypted & securely protected.",
                      textAlign: TextAlign.center,

                      style: TextStyle(
                        color: Colors.white30,
                        fontSize: 12,
                        letterSpacing: 0.5,
                      ),
                    ),

                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ✅ INPUT FIELD
  Widget buildField({
    required TextEditingController controller,
    required String hint,
    required IconData icon,
    required bool obscure,
  }) {

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),

        border: Border.all(
          color: Colors.white.withOpacity(0.12),
        ),

        boxShadow: [
          BoxShadow(
            color: Colors.cyan.withOpacity(0.05),
            blurRadius: 12,
            spreadRadius: 1,
          ),
        ],
      ),

      child: TextField(
        controller: controller,
        obscureText: obscure,
        style: TextStyle(color: Colors.white),

        decoration: InputDecoration(
          hintText: hint,

          hintStyle: TextStyle(
            color: Colors.white38,
          ),

          prefixIcon: Icon(
            icon,
            color: Colors.white70,
          ),

          filled: true,
          fillColor: Colors.white.withOpacity(0.04),

          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}