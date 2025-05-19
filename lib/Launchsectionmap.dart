import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LaunchYourCompanySection extends StatefulWidget {
  @override
  _LaunchYourCompanySectionState createState() =>
      _LaunchYourCompanySectionState();
}

class _LaunchYourCompanySectionState extends State<LaunchYourCompanySection> {
  // Variable to toggle the glowing effect
  bool _isGlowing = false;

  @override
  void initState() {
    super.initState();
    _startGlowing();
  }

  // Function to start the glowing effect
  void _startGlowing() {
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        _isGlowing = !_isGlowing;
      });
      _startGlowing(); // Repeat the glowing effect
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Left side: Text
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Improve your company ",
                  style: GoogleFonts.abhayaLibre(
                    fontSize: 45,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Text(
                  " anywhere in world",
                  style: GoogleFonts.abhayaLibre(
                    fontSize: 45,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF5B3DF5),
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  "Act now! Gain exclusive access to top-tier financial solutions, reserved solely for US-based companies, and significantly boost your business’s potential for success.",
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 18, color: Colors.grey[800]),
                ),
              ],
            ),
          ),

          // Right side: Map and Profile Images Section
          Expanded(
            flex: 1,
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Background Map Image with Blue Shade
                ColorFiltered(
                  colorFilter: ColorFilter.mode(
                    Colors.white.withOpacity(0.2), // Applying the opacity here
                    BlendMode.color,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      'assets/images/pic34.jpg',
                      width: 500,
                      height: 460,

                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                // Profile images on the map with glowing effect

              ],
            ),
          ),
        ],
      ),
    );
  }

  // Widget to build the profile image with glowing effect
  Widget _buildGlowingProfileImage(String imagePath) {
    return AnimatedContainer(
      duration: Duration(seconds: 1), // Duration of the animation
      curve: Curves.easeInOut, // Smooth curve for the glow effect
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
        boxShadow: _isGlowing
            ? [
          BoxShadow(
            color: Colors.white.withOpacity(0.7), // Glowing effect color
            blurRadius: 20,
            spreadRadius: 15,
          ),
        ]
            : [], // No shadow when not glowing
      ),
      child: CircleAvatar(
        radius: 40,
        backgroundImage: AssetImage(imagePath),
      ),
    );
  }
}