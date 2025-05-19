import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ContactUsSection extends StatelessWidget {
  const ContactUsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;

    return Container(
      width: double.infinity,
      color: const Color(0xFF006400),
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 30),
      child: Column(
        children: [
          Text(
            "Reach Out, We're Here to Help!",
            textAlign: TextAlign.center,
            style:GoogleFonts.poppins(
              fontSize: 39,
              color: Colors.white,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            "Complete the form, and our team will promptly respond to your inquiry within our working hours!",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white70, fontSize: 16),
          ),
          const SizedBox(height: 60),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            padding: const EdgeInsets.all(30),
            child: isMobile ? _buildColumnLayout() : _buildRowLayout(),
          )
        ],
      ),
    );
  }

  Widget _buildRowLayout() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Expanded(child: _ContactForm()),
        const SizedBox(width: 40),
        const Expanded(child: _ImageWithTickets()),
      ],
    );
  }

  Widget _buildColumnLayout() {
    return Column(
      children: const [
        _ContactForm(),
        SizedBox(height: 30),
        _ImageWithTickets(),
      ],
    );
  }
}

class _ContactForm extends StatelessWidget {
  const _ContactForm();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          'Send us a message',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 20),
        _CustomTextField(hint: 'Name'),
        _CustomTextField(hint: 'Email'),
        _CustomTextField(hint: 'Subject'),
        _CustomTextField(hint: 'Message', maxLines: 5),

      ],
    );
  }
}

class _CustomTextField extends StatelessWidget {
  final String hint;
  final int maxLines;
  const _CustomTextField({required this.hint, this.maxLines = 1});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextField(
        maxLines: maxLines,
        decoration: InputDecoration(
          hintText: hint,
          fillColor: const Color(0xFFF2F2F2),
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}

class _ImageWithTickets extends StatelessWidget {
  const _ImageWithTickets();

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.asset('assets/images/pic32.jpg'), // Your team image

      ],
    );
  }
}

class _TicketBubble extends StatelessWidget {
  final String time;
  final String text;
  final Color color;
  final Color textColor;

  const _TicketBubble({
    required this.time,
    required this.text,
    required this.color,
    this.textColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          if (color != Colors.white)
            const BoxShadow(
              color: Colors.black26,
              blurRadius: 6,
              offset: Offset(2, 2),
            ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(time, style: TextStyle(color: textColor.withOpacity(0.7), fontSize: 12)),
          const SizedBox(height: 2),
          Text(text, style: TextStyle(color: textColor, fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          Align(
            alignment: Alignment.bottomRight,
            child: Text("View", style: TextStyle(color: textColor)),
          ),
        ],
      ),
    );
  }
}
