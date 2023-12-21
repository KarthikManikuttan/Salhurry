import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../size_config/size_config.dart';
import '../theme/theme_const.dart';

class AuthTextField extends StatefulWidget {
  const AuthTextField({
    Key? key,
    required this.hintText,
    required this.keyboardType,
    this.prefixIcon,
    required this.obscureText,
    this.inputFormatters,
    this.suffixIconBuilder,
  }) : super(key: key);

  final String hintText;
  final TextInputType keyboardType;
  final Icon? prefixIcon;
  final bool obscureText;
  final List<TextInputFormatter>? inputFormatters;
  final Function()? suffixIconBuilder;

  @override
  AuthTextFieldState createState() => AuthTextFieldState();
}

class AuthTextFieldState extends State<AuthTextField> {
  late bool _isObscure;

  @override
  void initState() {
    super.initState();
    _isObscure = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: SizeConfig.screenHeight * 0.028,
        left: SizeConfig.screenWidth * 0.05,
        right: SizeConfig.screenWidth * 0.05,
      ),
      child: Container(
        width: SizeConfig.screenWidth,
        height: SizeConfig.screenHeight * 0.07,
        decoration: BoxDecoration(
          color: const Color(0xffF6F6F6),
          border: Border.all(
            width: SizeConfig.constSize * 0.015,
            color: const Color(0xffF0F0F0),
          ),
          borderRadius: BorderRadius.circular(SizeConfig.constSize * 0.3),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: SizeConfig.blockSizeH * 3),
          child: Center(
            child: TextFormField(
              style: TextStyle(color: themeConstant.primaryColor),
              autocorrect: false,
              obscureText: _isObscure,
              keyboardType: widget.keyboardType,
              cursorColor: themeConstant.primaryColor,
              inputFormatters: widget.inputFormatters,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                  vertical: SizeConfig.blockSizeV * 1.8,
                ),
                border: InputBorder.none,
                hintText: widget.hintText,
                hintStyle: GoogleFonts.lato(
                  fontSize: SizeConfig.constSize * 0.25,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xff898989),
                ),
                prefixIcon: widget.prefixIcon,
                suffixIcon: widget.obscureText
                    ? InkWell(
                        onTap: widget.suffixIconBuilder ?? _toggleObscure,
                        child: Icon(
                          _isObscure ? Icons.visibility : Icons.visibility_off,
                          color: const Color(0xff939393),
                        ),
                      )
                    : null,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _toggleObscure() {
    setState(() {
      _isObscure = !_isObscure;
    });
  }
}
