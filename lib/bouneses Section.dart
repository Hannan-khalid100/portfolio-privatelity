import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BonusesSection extends StatelessWidget {
  const BonusesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 800;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 60),
      color: Colors.white,
      child: Flex(
        direction: isMobile ? Axis.vertical : Axis.horizontal,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // ✅ Left Side Text
          Expanded(
            flex: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text.rich(
                  TextSpan(
                    children: [
                       TextSpan(
                        text: 'Bonuses ',
                        style: GoogleFonts.poppins(
                          color: Color(0xFF4D5AFE),
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: 'for Premium clients only',
                        style:GoogleFonts.abhayaLibre(
                          color: Colors.black,
                          fontSize: 36,

                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'As a Premium client, we’ll assist you in setting up all the financial services available to you. '
                      'You’ll have a dedicated account manager and our exceptional support team, ready to assist you via chat, email, and phone.',
                  style: GoogleFonts.abel(fontSize: 19, color: Colors.black87, height: 2),
                ),
              ],
            ),
          ),

          const SizedBox(width: 40),

          // ✅ Right Side Image from Network
          Expanded(
            flex: 4,
            child: Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset('assets/images/pic48.jpg',
                  width: 500,
                  fit: BoxFit.contain,),
              ),

              ),
            ),
      ]
          ),
    );
  }
}
