import 'package:flutter/material.dart';

class TrustedSection extends StatelessWidget {
  const TrustedSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 1000;

    return Container(
      
      width: 1000,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30), // Reduced height
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF90EE90), Color(0xFF90EE90),Colors.black,Colors.white],
          begin: Alignment.topLeft,
          end:Alignment.topRight,


        ),
        borderRadius: BorderRadius.circular(10)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // ✅ Title
          const Text(
            "Trusted by entrepreneurs\nfrom 150+ countries",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w800,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 30),

          // ✅ Testimonials
          Wrap(
            spacing: 20,
            runSpacing: 20,
            alignment: WrapAlignment.center,
            children: const [
              TestimonialCard(
                message:
                "Their speed and prices are unmatched! Starting my business in the U.S. with Privatily was very easy. Their team took care of everything, and I really can’t thank them enough.",
                name: "Yusuf",
                country: "From Pakistan 🇵🇰",
              ),
              TestimonialCard(
                message:
                "Privatily provides excellent customer service. They are always responsive to concerns and keep you updated throughout the process. I was recommended to them by a friend and I highly recommend them to others.",
                name: "Chinedu",
                country: "From Nigeria 🇳🇬",
              ),
              TestimonialCard(
                message:
                "I got an outstanding service for my US LLC formation. Their team was not only professional but also highly responsive throughout the entire process, making everything seamless and efficient.",
                name: "Jamal",
                country: "From Morocco 🇲🇦",
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class TestimonialCard extends StatelessWidget {
  final String message;
  final String name;
  final String country;

  const TestimonialCard({
    super.key,
    required this.message,
    required this.name,
    required this.country,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            blurRadius: 10,
            color: Colors.black12,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            message,
            style: const TextStyle(
              fontSize: 15,
              color: Colors.black87,
              height: 1.6,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            name,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
          Text(
            country,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }
}
