import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:islamy/services/app_assets.dart';
import 'package:islamy/services/color.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, required this.hintText,  this.controller});
  final String hintText;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText:hintText,
        hintStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: Color(0xFFFEFFE8)),
        prefixIcon: Padding(
          padding: const EdgeInsets.all(13),
          child: SvgPicture.asset(
            AppAssets.quranIcon,
            colorFilter: ColorFilter.mode(Color(ColorsApp.gold), BlendMode.srcIn),
          ),
        ),
        fillColor: Color(ColorsApp.black).withValues(alpha: 0.7),
        filled: true,
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(ColorsApp.gold)),
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            )
            
            ),

            disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(ColorsApp.gold)),
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            )
            
            ),

            border: OutlineInputBorder(
            borderSide: BorderSide(color: Color(ColorsApp.gold)),
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            )
            
            ),
      ),
    );
  }
}
