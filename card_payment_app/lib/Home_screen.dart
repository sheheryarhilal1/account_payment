import 'dart:ui';
import 'package:flutter/material.dart';

class ProCardPaymentScreen extends StatefulWidget {
  @override
  State<ProCardPaymentScreen> createState() =>
      _ProCardPaymentScreenState();
}

class _ProCardPaymentScreenState
    extends State<ProCardPaymentScreen>
    with SingleTickerProviderStateMixin {

  final cardNumber =
  TextEditingController(text: "4242 4242 4242 4242");

  final name =
  TextEditingController(text: "SHER HILAL");

  final expiry =
  TextEditingController(text: "12/28");

  final cvv =
  TextEditingController(text: "456");

  bool isLoading = false;

  AnimationController? _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1400),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller?.dispose();

    cardNumber.dispose();
    name.dispose();
    expiry.dispose();
    cvv.dispose();

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
            duration: Duration(milliseconds: 450),
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
                    blurRadius: 15,
                    spreadRadius: 2,
                  ),
                ],
              ),

              child: Row(
                children: [

                  Icon(
                    Icons.verified_rounded,
                    color: Colors.white,
                  ),

                  SizedBox(width: 12),

                  Expanded(
                    child: Text(
                      message,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
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

  // ✅ PAYMENT FUNCTION
  void makePayment() async {

    setState(() {
      isLoading = true;
    });

    await Future.delayed(Duration(seconds: 2));

    setState(() {
      isLoading = false;
    });

    showTopSnackBar("Payment Successful");

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff060B16),

      body: Stack(
        children: [

          // 🌌 TOP GLOW
          Positioned(
            top: -100,
            left: -80,
            child: glowCircle(
              Colors.blue,
            ),
          ),

          // 🌌 BOTTOM GLOW
          Positioned(
            bottom: -100,
            right: -80,
            child: glowCircle(
              Colors.purple,
            ),
          ),

          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
              ),

              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,

                  children: [

                    SizedBox(height: 20),

                    // 🔥 HEADER
                    FadeTransition(
                      opacity: Tween(
                        begin: 0.7,
                        end: 1.0,
                      ).animate(_controller!),

                      child: Column(
                        crossAxisAlignment:
                        CrossAxisAlignment.start,

                        children: [

                          Text(
                            "Payment Details",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1,
                            ),
                          ),

                          SizedBox(height: 8),

                          Text(
                            "Secure fintech payment experience",
                            style: TextStyle(
                              color: Colors.white60,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 28),

                    // 💳 PREMIUM CARD
                    premiumCard(),

                    SizedBox(height: 35),

                    // 📧 CARD NUMBER
                    buildField(
                      "Card Number",
                      cardNumber,
                      Icons.credit_card,
                    ),

                    SizedBox(height: 18),

                    // 👤 NAME
                    buildField(
                      "Card Holder Name",
                      name,
                      Icons.person_outline,
                    ),

                    SizedBox(height: 18),

                    Row(
                      children: [

                        Expanded(
                          child: buildField(
                            "Expiry",
                            expiry,
                            Icons.calendar_month_outlined,
                          ),
                        ),

                        SizedBox(width: 15),

                        Expanded(
                          child: buildField(
                            "CVV",
                            cvv,
                            Icons.lock_outline,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 18),

                    // 🔐 TRUST SIGNAL
                    Row(
                      children: [

                        Icon(
                          Icons.shield_outlined,
                          color: Colors.greenAccent,
                          size: 18,
                        ),

                        SizedBox(width: 8),

                        Text(
                          "256-bit SSL Secure Payment",
                          style: TextStyle(
                            color: Colors.white60,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 40),

                    // 🔥 PAYMENT BUTTON
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
                            backgroundColor:
                            Colors.transparent,

                            shadowColor:
                            Colors.transparent,

                            shape: RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.circular(18),
                            ),
                          ),

                          onPressed:
                          isLoading ? null : makePayment,

                          child: isLoading
                              ? SizedBox(
                            height: 24,
                            width: 24,

                            child:
                            CircularProgressIndicator(
                              color: Colors.white,
                              strokeWidth: 2.8,
                            ),
                          )
                              : Text(
                            "CONFIRM PAYMENT",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight:
                              FontWeight.bold,
                              letterSpacing: 1.5,
                            ),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 30),

                    // 🔒 FOOTER
                    Center(
                      child: Text(
                        "Your transaction is encrypted & protected.",
                        textAlign: TextAlign.center,

                        style: TextStyle(
                          color: Colors.white30,
                          fontSize: 12,
                          letterSpacing: 0.5,
                        ),
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

  // 💳 PREMIUM CARD
  Widget premiumCard() {

    return Container(
      height: 230,
      width: double.infinity,

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),

        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,

          colors: [
            Color(0xff1B1F32),
            Color(0xff101522),
          ],
        ),

        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            blurRadius: 25,
            offset: Offset(0, 12),
          ),
        ],
      ),

      child: Stack(
        children: [

          // 🌌 GLASS EFFECT
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(28),

              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 15,
                  sigmaY: 15,
                ),

                child: Container(
                  color: Colors.white.withOpacity(0.03),
                ),
              ),
            ),
          ),

          // 🔵 DECORATION
          Positioned(
            top: -40,
            right: -30,

            child: Container(
              height: 140,
              width: 140,

              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue.withOpacity(0.18),
              ),
            ),
          ),

          Positioned(
            bottom: -50,
            left: -30,

            child: Container(
              height: 130,
              width: 130,

              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.purple.withOpacity(0.18),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(24),

            child: Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,

              children: [

                Row(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,

                  children: [

                    Text(
                      "VAULTIQ",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2,
                      ),
                    ),

                    Icon(
                      Icons.wifi,
                      color: Colors.white70,
                    ),
                  ],
                ),

                Spacer(),

                Text(
                  cardNumber.text,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 23,
                    letterSpacing: 2,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                SizedBox(height: 18),

                Row(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,

                  children: [

                    Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,

                      children: [

                        Text(
                          "CARD HOLDER",
                          style: TextStyle(
                            color: Colors.white38,
                            fontSize: 10,
                          ),
                        ),

                        SizedBox(height: 4),

                        Text(
                          name.text,
                          style: TextStyle(
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),

                    Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,

                      children: [

                        Text(
                          "EXPIRES",
                          style: TextStyle(
                            color: Colors.white38,
                            fontSize: 10,
                          ),
                        ),

                        SizedBox(height: 4),

                        Text(
                          expiry.text,
                          style: TextStyle(
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ✍️ FIELD
  Widget buildField(
      String hint,
      TextEditingController controller,
      IconData icon,
      ) {

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

        style: TextStyle(
          color: Colors.white,
        ),

        onChanged: (_) {
          setState(() {});
        },

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

  // 🌌 GLOW
  Widget glowCircle(Color color) {

    return Container(
      height: 220,
      width: 220,

      decoration: BoxDecoration(
        shape: BoxShape.circle,

        gradient: RadialGradient(
          colors: [
            color.withOpacity(0.5),
            Colors.transparent,
          ],
        ),
      ),
    );
  }
}