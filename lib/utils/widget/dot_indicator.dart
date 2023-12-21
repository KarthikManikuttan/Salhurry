import 'package:flutter/material.dart';

import '../size_config/size_config.dart';
import '../theme/theme_const.dart';

class DotIndicator extends StatelessWidget {
  const DotIndicator({
    Key? key,
    this.isActive = false,
  }) : super(key: key);

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: isActive
          ? SizeConfig.screenHeight * 0.03
          : SizeConfig.screenHeight * 0.006,
      width: isActive
          ? SizeConfig.screenWidth * 0.01
          : SizeConfig.screenWidth * 0.009,
      decoration: BoxDecoration(
        color: themeConstant.primaryColor,
        borderRadius: BorderRadius.all(
          Radius.circular(
            SizeConfig.constSize * 0.3,
          ),
        ),
      ),
    );
  }
}
