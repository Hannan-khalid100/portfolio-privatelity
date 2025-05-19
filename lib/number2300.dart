
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class StatsSection extends StatelessWidget {
  final List<StatData> stats = [
    StatData(label: 'Clients', count: 2300),
    StatData(label: 'Companies formed', count: 2800),
    StatData(label: 'Countries served', count: 150),
    StatData(label: 'Years of experience', count: 6),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 40),
      child: Wrap(
        alignment: WrapAlignment.center,
        spacing: 100,
        runSpacing: 40,
        children: stats
            .map((stat) => StatItem(stat: stat))
            .toList(),
      ),
    );
  }
}

class StatData {
  final String label;
  final int count;

  StatData({required this.label, required this.count});
}

class StatItem extends StatefulWidget {
  final StatData stat;

  const StatItem({Key? key, required this.stat}) : super(key: key);

  @override
  _StatItemState createState() => _StatItemState();
}

class _StatItemState extends State<StatItem>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<int> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    );

    _animation = IntTween(begin: 101, end: widget.stat.count).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    )..addListener(() {
      setState(() {});
    });

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    final formatted = NumberFormat.compact().format(_animation.value);

    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Text(
          "$formatted+",
          style: GoogleFonts.poppins(
            fontSize: 30,
            fontWeight: FontWeight.w900,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 10),
        Text(
          widget.stat.label,
          style: GoogleFonts.poppins(
            fontSize: 23,
              fontWeight: FontWeight.w900,
              color: Colors.black87

          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}