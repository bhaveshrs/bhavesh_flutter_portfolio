import 'package:bhavesh_flutter_portfolio/features/introduction/widgets/animated_text.dart';
import 'package:bhavesh_flutter_portfolio/utils/define_width.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:bhavesh_flutter_portfolio/utils/app_colors.dart';


class CombineSubtitleText extends StatelessWidget {
  const CombineSubtitleText({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ShaderMask(  shaderCallback: (bounds) {
                  return const LinearGradient(colors: [
                    AppColors.darkPrimaryColor,
                    Colors.blue,
                  ]).createShader(bounds);
                },

          child: const Responsive(
            desktop: AnimatedSubtitleText(start: 30, end: 40, text: 'Flutter ' ,),
            largeMobile:
                AnimatedSubtitleText(start: 30, end: 25, text: 'Flutter ',gradient: true),
            mobile: AnimatedSubtitleText(start: 25, end: 20, text: 'Flutter ', gradient: true),
            tablet: AnimatedSubtitleText(start: 40, end: 30, text: 'Flutter ',),
          ),
        ),
        (kIsWeb && Responsive.isLargeMobile(context)
            ? const Responsive(
                desktop: AnimatedSubtitleText(
                    start: 30, end: 40, text: 'Developer ', gradient: true),
                largeMobile: AnimatedSubtitleText(
                    start: 30, end: 25, text: 'Developer ', gradient: true),
                mobile: AnimatedSubtitleText(
                    start: 25, end: 20, text: 'Developer ', gradient: true),
                tablet: AnimatedSubtitleText(
                    start: 40, end: 30, text: 'Developer ', gradient: true),
              )
            : ShaderMask(
                shaderCallback: (bounds) {
                  
                  return const LinearGradient(colors: [
                    AppColors.darkPrimaryColor,
                    Colors.blue,
                  ]).createShader(bounds);
                },
                child: const Responsive(
                  desktop: AnimatedSubtitleText(
                      start: 30, end: 40, text: 'Developer ', gradient: false),
                  largeMobile: AnimatedSubtitleText(
                      start: 30, end: 25, text: 'Developer ', gradient: false),
                  mobile: AnimatedSubtitleText(
                      start: 25, end: 20, text: 'Developer ', gradient: true),
                  tablet: AnimatedSubtitleText(
                      start: 40, end: 30, text: 'Developer ', gradient: false),
                ),
              ))
      ],
    );
  }
}
