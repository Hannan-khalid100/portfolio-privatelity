import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'homePage.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      builder: (context, child) => ResponsiveBreakpoints.builder(
        child: child!,
        breakpoints: [
          const Breakpoint(start: 0, end: 450, name: MOBILE),
          const Breakpoint(start: 451, end: 800, name: TABLET),
          const Breakpoint(start: 801, end: 1920, name: DESKTOP),
          const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
        ],
      ),
      initialRoute: "/",
      theme: ThemeData(
          textTheme: GoogleFonts.robotoTextTheme(), // or poppinsTextTheme()
          cardColor: Colors.white,
        hintColor: Colors.black

      ),
      title: 'portfolio1',
      home: port(),
    );
  }
}
class port extends StatefulWidget {
  const port({super.key});

  @override
  State<port> createState() => _portState();
}

class _portState extends State<port> {
  @override
  Widget build(BuildContext context) {
    return HomePage();
  }
}
