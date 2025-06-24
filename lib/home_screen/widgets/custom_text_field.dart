import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:islamy/services/app_assets.dart';
import 'package:islamy/services/color.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.hintText,
      required this.controller,
      required this.onChanged, required this.suffix});
  final String hintText;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final Widget? suffix;
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      style: TextStyle(
          fontSize: 16, fontWeight: FontWeight.w600, color: Color(0xFFFEFFE8)),
      controller: controller,
      decoration: InputDecoration(
        suffix: suffix,
        hintText: hintText,
        hintStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Color(0xFFFEFFE8).withValues(alpha: 0.6)),
        prefixIcon: Padding(
          padding: const EdgeInsets.all(13),
          child: SvgPicture.asset(
            AppAssets.quranIcon,
            colorFilter:
                ColorFilter.mode(Color(ColorsApp.gold), BlendMode.srcIn),
          ),
        ),
        fillColor: Color(ColorsApp.black).withValues(alpha: 0.7),
        filled: true,
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(ColorsApp.gold)),
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            )),
        disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(ColorsApp.gold)),
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            )),
        border: OutlineInputBorder(
            borderSide: BorderSide(color: Color(ColorsApp.gold)),
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            )),
      ),
    );
  }
}
