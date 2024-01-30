import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/style.dart';

class DateHeading extends StatelessWidget {
  final String headng;
  const DateHeading({
    required this.headng,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(small),
      child: Text(
        headng,
        style: GoogleFonts.openSans(
          fontSize: 14.0,
          color: text
        ),
      ),
    );
  }
}
