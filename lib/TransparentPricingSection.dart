
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:country_icons/country_icons.dart';
import 'package:google_fonts/google_fonts.dart';



import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TransparentPricingSection extends StatefulWidget {
  const TransparentPricingSection({super.key});

  @override
  _TransparentPricingSectionState createState() =>
      _TransparentPricingSectionState();
}

class _TransparentPricingSectionState extends State<TransparentPricingSection> {
  String selectedCountry = "US";  // Default country
  Map<String, Map<String, dynamic>> countryPricing = {
    "US": {
      "basicPrice": 229,
      "premiumPrice": 397,
      "basicDesc": "If you're operating with a low budget.",
      "premiumDesc": "Enhanced, fast, and premium service.",
      "basicFeatures": [
        "US Company Formation",
        "US Address with Mail forwarding",
        "Registered agent service",
        "US business Stripe account consultation",
        "EIN letter",
        "Incorporation documents",
        "Introduction to a professional accountant",
        "Email support only",
      ],
      "premiumFeatures": [
        "Everything in Basic, plus:",
        "Order priority",
        "FREE Tax consultation",
        "Chat and phone support",
        "FREE US Phone number",
        "Dedicated account manager",
        "FREE Business website",
        "FREE business email inbox",
        "FREE .com domain",
      ]
    },
    "UK": {
      "basicPrice": 199,
      "premiumPrice": 499,
      "basicDesc": "Affordable and simple for UK businesses.",
      "premiumDesc": "All premium services for faster registration.",
      "basicFeatures": [
        "Business registration",
        "UK business address",
        "Business consultation",
        "Certificate of Incorporation",
        "Company documents",
        "Email support",
      ],
      "premiumFeatures": [
        "Everything in Basic, plus:",
        "Priority support",
        "Registration as a UK Corporation",
        "Dedicated business consultant",
        "Phone and chat support",
        "UK bank account setup",
      ]
    },
    "Canada": {
      "basicPrice": 247,
      "premiumPrice": 599,
      "basicDesc": "Ideal for Canadian business setup.",
      "premiumDesc": "Full-service, high-priority registration.",
      "basicFeatures": [
        "Sole Proprietorship registration",
        "Canadian business address",
        "Business consultation",
        "Certificate of Incorporation",
        "Company documents",
        "Email support",
      ],
      "premiumFeatures": [
        "Everything in Basic, plus:",
        "Priority processing",
        "Registration as a Corporation",
        "Phone and chat support",
        "Canadian phone number",
        "Dedicated account manager",
        "Free business email inbox",
      ]
    }
  };

  @override
  Widget build(BuildContext context) {
    var pricing = countryPricing[selectedCountry];
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 40),
      color: const Color(0xFFF5F5F5),  // Lighter background for the section
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Transparent Pricing Title
          Center(
            child: Text(
              "Transparent Pricing",
              style: GoogleFonts.poppins(
                fontSize: 42,
                fontWeight: FontWeight.w700,
                color: const Color(0xFF2F2F2F),
                height: 1.2,
              ),
            ),
          ),
          const SizedBox(height: 20),
          // Country Selector
          Center(
            child: Text(
              "Where do you want to Incorporate?",
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.w400,
                color: Colors.grey.shade700,
              ),
            ),
          ),
          const SizedBox(height: 40),
          // Country Tabs
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CountryTab(
                country: "In the US",
                flagColor:  Color(0xFF006400),
                countryFlag: '🇺🇸',
                isSelected: selectedCountry == "US",
                onTap: () => setState(() => selectedCountry = "US"),
              ),
              const SizedBox(width: 20),
              CountryTab(
                country: "In the UK",
                flagColor: const Color(0xFF006400),
                countryFlag: '🇬🇧',
                isSelected: selectedCountry == "UK",
                onTap: () => setState(() => selectedCountry = "UK"),
              ),
              const SizedBox(width: 20),
              CountryTab(
                country: "In Canada",
                flagColor: const Color(0xFF006400),
                countryFlag: '🇨🇦',
                isSelected: selectedCountry == "Canada",
                onTap: () => setState(() => selectedCountry = "Canada"),
              ),
            ],
          ),
          SizedBox(height: 40),
          // Pricing Plans
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              PricingPlanCard(
                title: "Basic",
                price: pricing?["basicPrice"],
                description: pricing?["basicDesc"],
                features: pricing?["basicFeatures"],
                buttonColor:  Color(0xFF006400),
                buttonText: "Go Basic",
              ),
              PricingPlanCard(
                title: "Premium",
                price: pricing?["premiumPrice"],
                description: pricing?["premiumDesc"],
                features: pricing?["premiumFeatures"],
                buttonColor: const Color(0xFF004D40),
                buttonText: "Go Premium",
              ),
            ],
          )
        ],
      ),
    );
  }
}

class CountryTab extends StatelessWidget {
  final String country;
  final Color flagColor;
  final bool isSelected;
  final String countryFlag;
  final VoidCallback onTap;

  const CountryTab({
    super.key,
    required this.country,
    required this.flagColor,
    required this.isSelected,
    required this.countryFlag,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 30),
        decoration: BoxDecoration(
          color: isSelected
              ? const Color(0xFFE4E4E4)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? flagColor : Colors.grey.shade400,
            width: 4,
          ),
        ),
        child: Row(
          children: [
            Text(
              countryFlag,
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(width: 10),
            Text(
              country,
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: isSelected ? flagColor : Colors.black
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PricingPlanCard extends StatelessWidget {
  final String title;
  final int price;
  final String description;
  final List<String> features;
  final Color buttonColor;
  final String buttonText;

  const PricingPlanCard({
    super.key,
    required this.title,
    required this.price,
    required this.description,
    required this.features,
    required this.buttonColor,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      width: 550,
      height: 450, // Equal height for both cards
      decoration: BoxDecoration(
        color: title == "Basic" ? Colors.white : const Color(0xFF006400),  // Different color for Premium
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 28,
              fontWeight: FontWeight.w700,
              color: title == "Basic" ? const Color(0xFF2F2F2F) : Colors.white,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            "\$$price/yr",
            style: GoogleFonts.poppins(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: title == "Basic" ? const Color(0xFF5C6BC0) : Colors.white,
            ),
          ),
          const SizedBox(height: 15),
          Text(
            description,
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: title == "Basic" ? Colors.grey.shade600 : Colors.white,
            ),
          ),
          const SizedBox(height: 15),
          Column(
            children: features.map((feature) {
              return Row(
                children: [
                  Icon(Icons.check_circle, size: 18, color: title == "Basic" ? Colors.green : Colors.white),
                  const SizedBox(width: 10),
                  Text(
                    feature,
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: title == "Basic" ? Colors.grey.shade600 : Colors.white,
                    ),
                  ),
                ],
              );
            }).toList(),
          ),
          const SizedBox(height: 20),
          Center( // Center the button
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: title == "Basic" ? Colors.deepPurple.shade700 : Colors.orange.shade700,  // Set background color
                foregroundColor: Colors.white,  // Set text color
                minimumSize: Size(200, 60),  // Increase the size of the button (width: 200, height: 60)
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                buttonText,
                style: GoogleFonts.poppins(
                  fontSize: 18, // Increase font size for better visibility
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
class MissionSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Left side - Image
        ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Image.asset(
            'assets/images/pic33.jpg', // Path to your image
            height: 400, // Adjust height as needed
          ),
        ),

        // Right side - Text & Boxes
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title of the section
                SizedBox(height: 50),
                Row(
                  children: [
                    Text(
                      'Our Mission at',
                      style: GoogleFonts.poppins(
                          fontSize: 47,
                          fontWeight: FontWeight.bold,
                          color: Colors.black

                      ),
                    ),
                    Text(
                      ' Privately',
                      style:GoogleFonts.poppins(
                          fontSize: 46,
                          fontWeight: FontWeight.w900,
                          color: Colors.deepPurple
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Text(
                  'Privatly’s mission is to be the global partner for aspiring business owners, '
                      'streamlining the path to company formation in the USA, UK, and Canada. We deliver '
                      'a comprehensive suite of services from LLC and LTD registrations to full business '
                      'incorporation, designed for modern entrepreneurial needs. Our goal is to empower clients '
                      'to quickly and confidently establish and grow their businesses worldwide.',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 20),
                // Boxes below the text
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBox(String text, Color color) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color, width: 2),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}



class FAQSection extends StatelessWidget {
  const FAQSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue.shade50, // Background color of the FAQ section (light blue)
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          Center(
            child: Text(
              "Frequently asked questions",
              style: GoogleFonts.poppins(
                fontSize: 46,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(height: 40),

          // FAQ List
          _buildFAQItem(
            'How much time you are going to take to finish my order?',
            'The completion time depends on the complexity of the order, but typically, it takes 3-5 business days.',
          ),
          _buildDivider(),
          _buildFAQItem(
            'What documents do I need to provide?',
            'We need two things from you:\n\n1. Either your ID card or passport.\n2. Your bank statement or a utility bill that includes your name, address, and is dated within the last 3 months.',
          ),
          _buildDivider(),
          _buildFAQItem(
            'What about taxes?',
            'Taxes are applicable based on your location and business type. We will assist you with tax-related guidance.',
          ),
          _buildDivider(),
          _buildFAQItem(
            'Do you support my country?',
            'We support businesses from various countries, including the USA, UK, Canada, and many others. Please check the full list on our website.',
          ),
        ],
      ),
    );
  }

  // Method to build each FAQ question with the answer hidden initially
  Widget _buildFAQItem(String question, String answer) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 4,
      child: ExpansionTile(
        title: Text(
          question,
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
        trailing: Icon(
          Icons.add,
          color: Colors.purple.shade500, // Purple color for the button
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              answer,
              style: GoogleFonts.poppins(
                fontSize: 16,
                color: Colors.grey.shade600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Divider between the questions
  Widget _buildDivider() {
    return Divider(
      height: 1,
      thickness: 1,
      color: Colors.grey.shade200,
    );
  }
}




