import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:salhurry_source/utils/size_config/size_config.dart';
import 'package:salhurry_source/utils/theme/theme_const.dart';
import 'screens/onboarding_page/onboarding.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    SizeConfig().init(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Salhurry',
      theme: themeConstant,
      home: const OnBoardingPage(),
    );
  }
}
