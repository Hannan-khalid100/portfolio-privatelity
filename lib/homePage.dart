import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:port2/ContactUs.dart';
import 'package:port2/End.dart';
import 'package:port2/Launchsectionmap.dart';
import 'package:port2/Why%20privately.dart';
import 'package:port2/number2300.dart';
import 'package:port2/tustedSection.dart';

import 'PricingCard.dart';
import 'TransparentPricingSection.dart';
import 'bouneses Section.dart';
import 'package:flutter/material.dart';

class PageWithCustomDrawer extends StatelessWidget {
  const PageWithCustomDrawer({super.key});

  Widget _buildDrawerItem({
    required BuildContext context,
    required IconData icon,
    required String text,
    required VoidCallback onTap,
   tileColor = const Color(0xFF003366),
    Color textColor = Colors.white,
    Color iconColor = const Color(0xFF003366),
  }) {
    return ListTile(
      tileColor: tileColor,
      leading: Icon(icon, color: iconColor, size: 24),
      title: Text(
        text,
        style: GoogleFonts.abhayaLibre(
          fontSize: 16,
          color: textColor,
          fontWeight: FontWeight.w900,
        ),
      ),
      onTap: () {
        Navigator.pop(context); // Close the drawer first
        onTap(); // Then execute the provided onTap action
      },
      contentPadding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 6.0),
      dense: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:  Text(
          'Click Agent Pro',style: GoogleFonts.abhayaLibre(
          fontWeight: FontWeight.w900,
          fontSize: 40,
        )// Or whatever title you prefer
          // style: GoogleFonts.poppins(fontWeight: FontWeight.bold, color: Colors.black), // Example style
        ),
        // backgroundColor: const Color(0xFF90EE90), // Example background color
        // elevation: 0,
        // iconTheme: const IconThemeData(color: Colors.black), // Drawer icon color
      ),
      drawer: Drawer(
        child: Container(
          color:  Color(0xFF003366), // Overall drawer background
          child: Column(
            children: <Widget>[
              // User Profile Section
              Container(
                width: double.infinity,
                padding:  EdgeInsets.only(top: 50.0, left: 20.0, right: 20.0, bottom: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: 78,
                      height: 78,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage('assets/images/pic15.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Click Agent Pro',
                      style: GoogleFonts.abhayaLibre(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
              ),
              Divider(height: 1, thickness: 1, color: Colors.grey.shade300),

              // Navigation Items
              _buildDrawerItem(
                context: context,
                icon: Icons.home_work,iconColor: Colors.white,
                text: 'Home',
                onTap: () {
                  // Action for Home
                  print('Home tapped');
                },
              ),
              _buildDrawerItem(
                context: context,
                icon: Icons.headset_mic,iconColor: Colors.white,
                text: 'Help',
                onTap: () {
                  // Action for Help
                  print('Help tapped');
                },
              ),
              _buildDrawerItem(
                context: context,
                icon: Icons.help_center,
                text: 'FeedBack',iconColor: Colors.white,
                tileColor:  Color(0xFFEDEFF2),
                onTap: () {
                  // Action for FeedBack
                  print('FeedBack tapped');
                },
              ),

              // Invite Friend Button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Material(
                    color: const Color(0xFFDCEEFF),
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context); // Close the drawer
                        // Action for Invite Friend
                        print('Invite Friend tapped');
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 12.0),
                        child: Row(
                          children: <Widget>[
                            const Icon(Icons.group_add, color: Color(0xFF0056b3), size: 24),
                            const SizedBox(width: 20),
                             Text(
                              'Invite Friend',
                              style: GoogleFonts.abhayaLibre(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Divider(height: 1, thickness: 1, color: Colors.grey.shade300),

              const Spacer(), // Pushes Sign Out to the bottom

              // Sign Out
              Divider(height: 1, thickness: 1, color: Colors.grey.shade300),
              ListTile(
                title:  Text(
                  'Sign Out',
                  style: GoogleFonts.abhayaLibre(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                trailing: const Icon(Icons.power_settings_new, color: Colors.redAccent),
                onTap: () {
                  Navigator.pop(context); // Close the drawer
                  // Action for Sign Out
                  print('Sign Out tapped');
                },
                contentPadding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
      body: HomePage()
    );

  }
}

// To use this page in your app's main.dart or router:
// MaterialApp(
//   home: PageWithCustomDrawer(),
// );

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isMobile = MediaQuery.of(context).size.width < 768;

    return Scaffold(
      backgroundColor: Color(0xFF90EE90),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeroSection(theme, isMobile),
            StatsSection(),
            WhyPrivatelySection(),
            _buildStatsSection(theme, isMobile),
            _buildWhyIncorporateSection(theme, isMobile),
            TransparentPricingSection(),
            BonusesSection(),
            TrustedSection(),
            MissionSection(),
            FAQSection(),
            LaunchYourCompanySection(),
            ContactUsSection(),
            FooterWithImageSection()
          ],
        ),
      ),
    );
  }

  // --- Hero Section (Top Section) ---

  Widget _buildHeroSection(ThemeData theme, bool isMobile) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 16 : 40,
        vertical: isMobile ? 40 : 60,
      ),
      width: double.infinity,
      color: Color(0xFF90EE90),
      child: Column(
        children: [
          Text(
            'Form your company\nfrom anywhere',
            textAlign: TextAlign.center,
            style: GoogleFonts.abhayaLibre(
                fontWeight: FontWeight.w900,
                color: Colors.black,
                height: 1.2,
                fontSize: isMobile ? 40 : 60,
            ),
          ),
          const Gap(20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: isMobile ? 10 : 40),
            child: Text(
              'Join thousands of entrepreneurs using our platform to incorporate\n'
                  'their companies and unlock premium payment & banking solutions.',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                color: Colors.grey.shade800,
                height: 1.5,
                fontSize: isMobile ? 16 : 20,
              ),
            ),
          ),
          const Gap(30),
          _buildRatingSection(theme),
          const Gap(40),
          _buildHeroImage(isMobile),
        ],
      ),
    );
  }

  Widget _buildRatingSection(ThemeData theme) {
    return Column(
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.star_half, color: Colors.amber, size: 35),
            Icon(Icons.star_half, color: Colors.amber, size: 35),
            Icon(Icons.star_half, color: Colors.amber, size: 35),
            Icon(Icons.star_half, color: Colors.amber, size: 35),
            Icon(Icons.star_half, color: Colors.amber, size: 35),
          ],
        ),
        const Gap(8),
        Text(
          'Rated 4.8/5 by entrepreneurs worldwide',
          style: GoogleFonts.poppins(
            fontSize: 17,
            fontWeight: FontWeight.bold,
            color: Colors.grey.shade600,

          ),
        ),
      ],
    );
  }

  Widget _buildHeroImage(bool isMobile) {
    Widget imageWidget;
    try {
      imageWidget = Image.asset(
        'assets/images/pic51.jpg',
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return Container(
            color: Colors.grey.shade300,
            child: Center(
              child: Icon(Icons.image_not_supported,
                  size: 50, color: Colors.grey.shade600),
            ),
          );
        },
      );
    } catch (e) {
      imageWidget = Container(
        color: Colors.grey.shade300,
        child: Center(
          child: Icon(Icons.image_not_supported,
              size: 50, color: Colors.grey.shade600),
        ),
      );
    }

    return Container(
      height: isMobile ? 350 : 600,
      margin: EdgeInsets.symmetric(horizontal: isMobile ? 16 : 30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(isMobile ? 20 : 30),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(isMobile ? 20 : 30),
        child: imageWidget,
      ),
    );
  }

  // --- Stats Section ---

  Widget _buildStatsSection(ThemeData theme, bool isMobile) {
    const Color backgroundColor = Color(0xFF90EE90);
    const Color cardColor = Color(0xFF5F51F5);

    return Container(
      width: double.infinity,
      color: backgroundColor,
      padding: EdgeInsets.symmetric(
        vertical: 60,
        horizontal: isMobile ? 20 : 80,
      ),
      child: isMobile
          ? _buildMobileStatsContent(theme, cardColor)
          : _buildDesktopStatsContent(theme, cardColor),
    );
  }

  Widget _buildDesktopStatsContent(ThemeData theme, Color cardColor) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(flex: 3, child: _buildStatsText(theme)),
          const Gap(80),
          Expanded(flex: 2, child: _buildStatsCards(theme, cardColor)),
        ],
      ),
    );
  }

  Widget _buildMobileStatsContent(ThemeData theme, Color cardColor) {
    return Column(
      children: [
        _buildStatsText(theme),
        const Gap(40),
        _buildStatsCards(theme, cardColor),
      ],
    );
  }

  Widget _buildStatsText(ThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'How much time to get your LLC?',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w900,
            color: Colors.white,
            fontSize: 37,

          ),
        ),
        const Gap(20),
        Text(
          'At Privatily we count delivery time by business hours, not by days or weeks like others do.\n\n'
              'However, please be aware that these timelines are applicable only if you opt for LLC registration in one of our recommended US states.',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w900,
            color: Colors.black.withOpacity(0.85),
            height: 1.6,
            fontSize: 16,
          ),
        ),
        Container(
          height: 600,
          width: 600,
          child: Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                'assets/images/pic43.jpg',
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) =>
                const SizedBox.shrink(),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildStatsCards(ThemeData theme, Color cardColor) {
    return Column(
      children: [
        _buildStatCard(theme, cardColor, '24h', 'LLC formation'),
        const Gap(20),
        _buildStatCard(theme, cardColor, '24h', 'Company docs delivery'),
        const Gap(20),
        _buildStatCard(theme, cardColor, '120h', 'EIN acquisition'),
        const Gap(20),
        _buildStatCard(theme, cardColor, '165h', 'Avg. order delivery time'),
      ],
    );
  }

  Widget _buildStatCard(
      ThemeData theme, Color cardColor, String time, String description) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            time,
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w900,
              fontSize: 50,
              color: Colors.white,
            ),
          ),
          const Gap(8),
          Text(
            description,
            textAlign: TextAlign.center,
            style:GoogleFonts.poppins(
            fontWeight: FontWeight.w900,
              fontSize: 15,
              color: Colors.white.withOpacity(0.9),
            ),
          ),
        ],
      ),
    );
  }

  // --- Why Incorporate In The US Section ---

  Widget _buildWhyIncorporateSection(ThemeData theme, bool isMobile) {
    return Container(
      width: double.infinity,
      color: Colors.grey.shade50,
      padding: EdgeInsets.symmetric(
        vertical: 60,
        horizontal: isMobile ? 20 : 80,
      ),
      child: Column(
        children: [
          Text(
            'Why Incorporate In The US',
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w800,
              color: Colors.black,
              fontSize: isMobile ? 36 : 48,

            ),
          ),
          const Gap(40),
          isMobile
              ? _buildMobileWhyIncorporateContent(theme)
              : _buildDesktopWhyIncorporateContent(theme),
        ],
      ),
    );
  }

  Widget _buildDesktopWhyIncorporateContent(ThemeData theme) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildWhyIncorporateCard(
            theme: theme,
            icon: Icons.verified_rounded,
            title: 'Trust',
            description:
            'Forming a company in the US is viewed as more trustworthy by financial service providers like Stripe, PayPal and banks due to the nation\'s established business infrastructure and stringent regulatory environment.',
          ),
          _buildWhyIncorporateCard(
            theme: theme,
            icon: Icons.security_update_good,
            title: 'Protection',
            description:
            'A US-based company provides a legal separation between a business and its owners, known as limited liability protection. This means that in the event of lawsuits or debts, personal assets of the owners are generally protected.',
          ),
          _buildWhyIncorporateCard(
            theme: theme,
            icon: Icons.shield_moon_sharp,
            title: 'Prestige',
            description:
            'A US company can lend prestige and credibility to a business. The US is often seen as a leader in innovation and entrepreneurship, and having a US-based company can enhance the reputation of a business both domestically and internationally.',
          ),
        ],
      ),
    );
  }

  Widget _buildMobileWhyIncorporateContent(ThemeData theme) {
    return Column(
      children: [
        _buildWhyIncorporateCard(
          theme: theme,
          icon: Icons.verified_outlined,
          title: 'Trust',
          description:
          'Forming a company in the US is viewed as more trustworthy by financial service providers like Stripe, PayPal and banks due to the nation\'s established business infrastructure and stringent regulatory environment.',
        ),
        const Gap(20),
        _buildWhyIncorporateCard(
          theme: theme,
          icon: Icons.security_outlined,
          title: 'Protection',
          description:
          'A US-based company provides a legal separation between a business and its owners, known as limited liability protection. This means that in the event of lawsuits or debts, personal assets of the owners are generally protected.',
        ),
        const Gap(20),
        _buildWhyIncorporateCard(
          theme: theme,
          icon: Icons.shield_outlined,
          title: 'Prestige',
          description:
          'A US company can lend prestige and credibility to a business. The US is often seen as a leader in innovation and entrepreneurship, and having a US-based company can enhance the reputation of a business both domestically and internationally.',
        ),
      ],
    );
  }

  Widget _buildWhyIncorporateCard({
    required ThemeData theme,
    required IconData icon,
    required String title,
    required String description,
  }) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.green[0xFF90EE90],
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      width: 300,
      height: 360,
      child: Column(
        children: [
          Icon(icon, size: 48, color: theme.primaryColorDark),
          const Gap(16),
          Text(
            title,
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const Gap(8),
          Text(
            description,
            style:GoogleFonts.poppins(
              color: Colors.black87,
              fontWeight: FontWeight.w700,
              height: 1.7,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
