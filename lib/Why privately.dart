import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WhyPrivatelySection extends StatelessWidget {
  const WhyPrivatelySection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 800;

    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 60),
      child: Flex(
        direction: isMobile ? Axis.vertical : Axis.horizontal,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ✅ Left Side - Text
          Expanded(
            flex: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Why Privatily?',
                  style:GoogleFonts.poppins(
                      fontSize: 36,
                      fontWeight: FontWeight.w900,
                      color: Color(0xFF1C1C1C),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  "We know how to take the complexity out of forming your company because we’ve been in your shoes. Privatily was born because we struggled ourselves—facing a complicated, lengthy process when trying to set up our own company in a supported country. Since 2019, we’ve been committed to providing unmatched expertise, affordable prices, and the fastest turnaround time to help entrepreneurs like you start your business journey smoothly and confidently.",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black87,
                    height: 1.6,
                  ),
                ),
                const SizedBox(height: 30),
                const FeaturePoint(
                  icon: Icons.emoji_events,
                  text: 'Expert guidance since 2019',
                ),
                const FeaturePoint(
                  icon: Icons.attach_money,
                  text: 'Affordable, no hidden fees',
                ),
                const FeaturePoint(
                  icon: Icons.flash_on,
                  text: 'Fast, hassle-free setup',
                ),
              ],
            ),
          ),

          const SizedBox(width: 40, height: 40),

          // ✅ Right Side - Image & StatusChips
          Expanded(
            flex: 4,
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Background purple card
                Padding(
                  padding: const EdgeInsets.only(right: 30),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        'assets/images/pic35.jpg',

                        fit: BoxFit.cover,
                      ),
                    ),
                ),

                // ✅ Image + Status stacked vertically
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class FeaturePoint extends StatelessWidget {
  final IconData icon;
  final String text;
  const FeaturePoint({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Icon(icon, color: Colors.blueAccent, size: 30),
          const SizedBox(width: 14),
          Text(
            text,
            style:  GoogleFonts.poppins(fontSize: 20),
          ),
        ],
      ),
    );
  }
}

class StatusChip extends StatelessWidget {
  final String text;
  final bool isDone;
  const StatusChip({super.key, required this.text, required this.isDone});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: isDone ? Colors.white : Colors.grey.shade300,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          if (isDone)
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              offset: Offset(0, 2),
            )
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            isDone ? Icons.check_circle : Icons.radio_button_unchecked,
            color: isDone ? Colors.green : Colors.grey,
            size: 18,
          ),
          const SizedBox(width: 8),
          Text(
            text,
            style: TextStyle(
              color: isDone ? Colors.black87 : Colors.grey.shade600,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
