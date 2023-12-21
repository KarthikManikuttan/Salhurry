import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:salhurry_source/screens/onboarding_page/onboarding.dart';
import 'package:salhurry_source/utils/size_config/size_config.dart';
import 'package:salhurry_source/utils/theme/theme_const.dart';

import '../../utils/widget/auth_textfield.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: SizeConfig.blockSizeH * 5),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: SizeConfig.blockSizeV * 5,
                ),
                child: IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType.leftToRightJoined,
                        child: const OnBoardingPage(),
                        childCurrent: this,
                        duration: const Duration(milliseconds: 150),
                      ),
                    );
                  },
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: themeConstant.primaryColor,
                    size: SizeConfig.constSize * 0.4,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: SizeConfig.blockSizeH * 5,
                  top: SizeConfig.blockSizeV * 2.6,
                ),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/images/salhurryviolet.png',
                      width: SizeConfig.screenWidth * 0.14,
                      height: SizeConfig.screenHeight * 0.14,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: SizeConfig.blockSizeV * 5,
                        left: SizeConfig.blockSizeH * 1,
                      ),
                      child: Text(
                        'Salhurry',
                        style: GoogleFonts.inter(
                          fontSize: SizeConfig.constSize * 0.53,
                          fontWeight: FontWeight.w500,
                          color: themeConstant.primaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: SizeConfig.blockSizeH * 5,
                  top: SizeConfig.blockSizeV * 3,
                  bottom: SizeConfig.blockSizeV,
                ),
                child: Text(
                  'Create an account',
                  style: GoogleFonts.lato(
                    fontSize: SizeConfig.constSize * 0.53,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ),
              const AuthTextField(
                hintText: 'Enter your full name',
                prefixIcon: Icon(
                  Icons.person_outlined,
                  color: Color(0xff939393),
                ),
                keyboardType: TextInputType.name,
                obscureText: false,
              ),
              AuthTextField(
                hintText: 'Enter your mobile number',
                prefixIcon: const Icon(
                  Icons.call_outlined,
                  color: Color(0xff939393),
                ),
                keyboardType: TextInputType.phone,
                obscureText: false,
                inputFormatters: [LengthLimitingTextInputFormatter(10)],
              ),
              const AuthTextField(
                hintText: 'Enter a new password',
                prefixIcon: Icon(
                  Icons.password_outlined,
                  color: Color(0xff939393),
                ),
                keyboardType: TextInputType.text,
                obscureText: true,
              ),
              const AuthTextField(
                hintText: 'Confirm password',
                prefixIcon: Icon(
                  Icons.password_outlined,
                  color: Color(0xff939393),
                ),
                keyboardType: TextInputType.text,
                obscureText: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
