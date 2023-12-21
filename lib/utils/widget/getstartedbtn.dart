import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:salhurry_source/screens/authenticationpage/signup_page.dart';
import '../../models/onboard_model.dart';
import '../size_config/size_config.dart';
import '../theme/theme_const.dart';

class GetStartedBtn extends StatelessWidget {
  const GetStartedBtn({
    Key? key,
    required PageController pageController,
    required int pageIndex,
  })  : _pageController = pageController,
        _pageIndex = pageIndex,
        super(key: key);

  final PageController _pageController;
  final int _pageIndex;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: _pageIndex == demoData.length - 1
          ? SizeConfig.screenWidth * 0.5
          : SizeConfig.screenWidth * 0.15,
      height: SizeConfig.screenHeight * 0.07,
      child: _pageIndex == demoData.length - 1
          ? SizedBox(
              height: SizeConfig.screenHeight * 0.07,
              width: SizeConfig.screenWidth * 0.5,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(SizeConfig.constSize * 0.5),
                    ),
                    side: BorderSide(
                      color: themeConstant.primaryColor,
                      width: SizeConfig.blockSizeH * 0.4,
                    ),
                    elevation: 0,
                    backgroundColor: Colors.white),
                onPressed: () {
                  Navigator.push(
                    context,
                    PageTransition(
                      type: PageTransitionType.rightToLeft,
                      child: SignUpPage(),
                      duration: const Duration(milliseconds: 150),
                    ),
                  );
                },
                child: Center(
                  child: Text(
                    "Get Started !",
                    style: GoogleFonts.inter(
                      fontSize: SizeConfig.constSize * 0.25,
                      fontWeight: FontWeight.w500,
                      color: themeConstant.primaryColor,
                    ),
                  ),
                ),
              ),
            )
          : ElevatedButton(
              onPressed: () {
                _pageController.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.ease,
                );
              },
              style: ElevatedButton.styleFrom(
                elevation: 0,
                shape: const CircleBorder(),
                backgroundColor: themeConstant.primaryColor,
              ),
              child: const Icon(
                Icons.keyboard_arrow_right,
              ),
            ),
    );
  }
}
