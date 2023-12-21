import 'package:flutter/material.dart';
import '../../models/onboard_model.dart';
import '../../utils/size_config/size_config.dart';
import '../../utils/theme/theme_const.dart';
import '../../utils/widget/dot_indicator.dart';
import '../../utils/widget/getstartedbtn.dart';
import '../../utils/widget/onboard_widget.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  late PageController _pageController;

  int _pageIndex = 0;
  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Stack(
            children: [
              Stack(
                children: [
                  Container(
                    width: SizeConfig.screenWidth,
                    height: SizeConfig.screenHeight * 0.5,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    width: SizeConfig.screenWidth,
                    height: SizeConfig.screenHeight * 0.63,
                    decoration: BoxDecoration(
                      color: themeConstant.primaryColor,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(SizeConfig.constSize * 2),
                        bottomRight: Radius.circular(SizeConfig.constSize * 2),
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: SizeConfig.screenHeight * 0.09,
                        width: SizeConfig.screenWidth,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: SizeConfig.screenWidth * 0.1,
                        ),
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/images/vect.png',
                              height: SizeConfig.screenHeight * 0.08,
                              width: SizeConfig.screenWidth * 0.08,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: SizeConfig.screenHeight * 0.035),
                              child: Text(
                                "  Salhurry",
                                style: TextStyle(
                                  fontSize: SizeConfig.constSize * 0.25,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.only(
                top: SizeConfig.screenHeight * 0.19,
              ),
              child: Column(
                children: [
                  Expanded(
                    child: PageView.builder(
                      itemCount: demoData.length,
                      controller: _pageController,
                      onPageChanged: (index) {
                        setState(() {
                          _pageIndex = index;
                        });
                      },
                      itemBuilder: (context, index) => OnboardContent(
                        image: demoData[index].image,
                        title: demoData[index].title,
                        title2: demoData[index].title2,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.blockSizeH * 6),
                    child: Row(
                      children: [
                        ...List.generate(
                          demoData.length,
                          (index) => Padding(
                            padding: EdgeInsets.only(
                                right: SizeConfig.blockSizeH * 2),
                            child: DotIndicator(
                              isActive: index == _pageIndex,
                            ),
                          ),
                        ),
                        const Spacer(),
                        GetStartedBtn(
                          pageController: _pageController,
                          pageIndex: _pageIndex,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.screenHeight * 0.04,
                    width: SizeConfig.screenWidth,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
