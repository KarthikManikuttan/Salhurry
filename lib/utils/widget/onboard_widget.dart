import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../size_config/size_config.dart';

class OnboardContent extends StatelessWidget {
  const OnboardContent({
    Key? key,
    required this.image,
    required this.title,
    required this.title2,
  }) : super(key: key);

  final String image, title, title2;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          image,
          height: SizeConfig.screenHeight * 0.45,
          width: SizeConfig.screenWidth * 0.45,
        ),
        Padding(
          padding: EdgeInsets.only(top: SizeConfig.screenHeight * 0.035),
          child: Text(
            title,
            style: GoogleFonts.inter(
              fontSize: SizeConfig.screenWidth * 0.05,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: SizeConfig.screenHeight * 0.004),
          child: Text(
            title2,
            style: GoogleFonts.inter(
              fontSize: SizeConfig.screenWidth * 0.05,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
