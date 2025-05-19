// pricing_section_widget.dart
import 'package:flutter/material.dart';

class PricingCard extends StatelessWidget {
  final String title;
  final String price;
  final String billingCycle;
  final String description;
  final List<String> features;
  final String buttonText;
  final Color backgroundColor;
  final Color buttonColor;
  final Color textColor;
  final Color featureTextColor;
  final Color priceTextColor;
  final Color billingCycleTextColor;
  final String? badgeText;
  final Color? badgeColor;
  final Color? badgeTextColor;

  const PricingCard({
    super.key,
    required this.title,
    required this.price,
    required this.billingCycle,
    required this.description,
    required this.features,
    required this.buttonText,
    this.backgroundColor = Colors.white,
    this.buttonColor = Colors.black,
    this.textColor = Colors.black87,
    this.featureTextColor = Colors.black54,
    this.priceTextColor = Colors.black,
    this.billingCycleTextColor = Colors.grey,
    this.badgeText,
    this.badgeColor,
    this.badgeTextColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (badgeText != null && badgeColor != null && badgeTextColor != null)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
              decoration: BoxDecoration(
                color: badgeColor,
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Text(
                badgeText!,
                style: TextStyle(
                  color: badgeTextColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 12.0,
                ),
              ),
            ),
          const SizedBox(height: 10.0),
          Text(
            title,
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
          const SizedBox(height: 10.0),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: price,
                  style: TextStyle(
                    fontSize: 32.0,
                    fontWeight: FontWeight.w900,
                    color: priceTextColor,
                  ),
                ),
                TextSpan(
                  text: billingCycle,
                  style: TextStyle(
                    fontSize: 16.0,
                    color: billingCycleTextColor,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10.0),
          Text(
            description,
            style: TextStyle(
              color: textColor,
            ),
          ),
          const SizedBox(height: 20.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: features.map((feature) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Row(
                children: [
                  const Icon(Icons.check, color: Colors.green),
                  const SizedBox(width: 8.0),
                  Text(
                    feature,
                    style: TextStyle(color: featureTextColor),
                  ),
                ],
              ),
            )).toList(),
          ),
          const SizedBox(height: 20.0),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                // Handle button press
                print('Clicked on $title');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: buttonColor,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
              child: Text(
                buttonText,
                style: const TextStyle(fontSize: 18.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PricingSectionWidget extends StatelessWidget {
  const PricingSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          Expanded(
            child: PricingCard(
              title: 'Basic',
              price: '\$247',
              billingCycle: ' and then 99\$/yr',
              description: 'If you\'re operating with a low budget.',
              features: const [
                'Registration as a Sole Proprietorship',
                'Business address',
                'Business Stripe account consultation',
                'Certificate of Incorporation',
                'Company documents',
                'Email support only',
              ],
              buttonText: 'Go Basic',
              backgroundColor: Colors.white,
              buttonColor: Colors.black,
              textColor: Colors.black87,
              priceTextColor: Colors.black,
            ),
          ),
          const SizedBox(width: 16.0),
          Expanded(
            child: PricingCard(
              title: 'Premium',
              price: '\$557',
              billingCycle: ' and then 99\$/yr',
              description: 'Enhanced, fast, and exclusive service.',
              features: const [
                'Everything in Basic, plus:',
                'Order priority',
                'Registration as a Corporation',
                'Chat and phone support',
                'Canadian phone number',
                'Dedicated account manager',
              ],
              buttonText: 'Go Premium',
              backgroundColor: const Color(0xFF3D2DE4),
              buttonColor: const Color(0xFFE9446D),
              textColor: Colors.white,
              featureTextColor: Colors.white70,
              priceTextColor: Colors.white,
              billingCycleTextColor: Colors.white70,
              badgeText: 'Priority Processing',
              badgeColor: const Color(0xFFFFC107),
              badgeTextColor: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}