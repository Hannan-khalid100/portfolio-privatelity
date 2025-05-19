import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FooterWithImageSection extends StatelessWidget {
  const FooterWithImageSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 800;

    return Container(
      width: double.infinity,
      color: const Color(0xFF006400), // Purple background
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 60),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top content row
          Flex(
            direction: isMobile ? Axis.vertical : Axis.horizontal,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Left: Text + links
              Expanded(
                child: Wrap(
                  spacing: 60,
                  runSpacing: 20,
                  children: [
                    // Contact Section
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Powering entrepreneurs up!",
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        const SizedBox(height: 16),
                        contactRow(Icons.email, "Support@privatily.com"),
                        contactRow(Icons.phone, "+1 (507) 410-4666"),
                        contactRow(Icons.article, "Helpdesk articles"),
                        contactRow(Icons.info_outline, "FAQ"),
                        const SizedBox(height: 16),
                        Row(
                          children: const [
                            Icon(Icons.facebook, color: Colors.white, size: 22),
                            SizedBox(width: 16),
                            Icon(Icons.travel_explore, color: Colors.white, size: 22),
                            SizedBox(width: 16),
                            Icon(Icons.camera_alt, color: Colors.white, size: 22),
                          ],
                        ),
                      ],
                    ),

                    // Company Links
                    linkColumn("About us", [
                      "Contact me",
                      "Pricing",
                      "KYC & AML policy",
                      "Service accessibility",
                    ]),

                    // Policy Links
                    linkColumn("Privacy policy", [
                      "Refund policy",
                      "Terms and conditions",
                      "Legal disclaimer",
                      "Copyrights",
                    ]),
                  ],
                ),
              ),
              const SizedBox(width: 40),

              // Right Image
              if (!isMobile)
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    'assets/images/pic50.jpg',
                    height: 350,
                    width: 400,// Make sure to add this image to your assets folder
                  ),
                ),
            ],
          ),

          const SizedBox(height: 40),

          // Bottom copyright and note
          Text(
            "© 2019-2025 All rights reserved.",
            style: GoogleFonts.abhayaLibre(color: Colors.white.withOpacity(0.9),fontWeight: FontWeight.w900
            ),
          ),
          const SizedBox(height: 10),
          Text(
            "Privatily is not a law firm nor can provide legal advice. We specialize in providing tech-based business services and insightful guidance for general understanding. "
                "The information on our website, as well as that shared via emails, WhatsApp, Slack, SMS, Zoom, social media, and other communication platforms, is for informational purposes only and should not be taken as legal advice. "
                "By using our services and accessing our website, you agree to our Terms of Service, Privacy Policy, and Data Processing Addendum.",
            style: GoogleFonts.abhayaLibre(color: Colors.white, fontSize: 13,fontWeight: FontWeight.w800),
          )
        ],
      ),
    );
  }

  Widget contactRow(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Icon(icon, color: Colors.white, size: 20),
          const SizedBox(width: 8),
          Text(text, style:  GoogleFonts.abhayaLibre(color: Colors.white,fontWeight: FontWeight.w800)),
        ],
      ),
    );
  }

  Widget linkColumn(String title, List<String> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style:GoogleFonts.abhayaLibre(
            color: Colors.white,
            fontWeight: FontWeight.w800,
            fontSize: 18,
          ),
        ),
        const SizedBox(height: 8),
        for (var item in items)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 2),
            child: Text(item, style:  GoogleFonts.abhayaLibre(color: Colors.white,fontWeight: FontWeight.w900
            )),
          ),
      ],
    );
  }
}
