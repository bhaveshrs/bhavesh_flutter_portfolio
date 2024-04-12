import 'package:bhavesh_flutter_portfolio/features/introduction/widgets/animated_text.dart';
import 'package:bhavesh_flutter_portfolio/utils/app_colors.dart';
import 'package:bhavesh_flutter_portfolio/utils/define_width.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';

class CombineSubtitleText extends StatelessWidget {
  final String firstText;
  final String? secondText;
  const CombineSubtitleText(
      {super.key, required this.firstText, this.secondText});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ShaderMask(
          shaderCallback: (bounds) {
            return const LinearGradient(colors: [
              AppColors.darkPrimaryColor,
              Colors.blue,
            ]).createShader(bounds);
          },
          child: Responsive(
            desktop: AnimatedSubtitleText(
              start: 30,
              end: 40,
              text: firstText,
            ),
            largeMobile: AnimatedSubtitleText(
                start: 30, end: 25, text: firstText, gradient: true),
            mobile: AnimatedSubtitleText(
                start: 25, end: 20, text: firstText, gradient: true),
            tablet: AnimatedSubtitleText(
              start: 40,
              end: 30,
              text: firstText,
            ),
          ),
        ),
        (kIsWeb && Responsive.isLargeMobile(context)
            ? ShaderMask(
              shaderCallback: (bounds) {
                  return const LinearGradient(colors: [
                    AppColors.darkPrimaryColor,
                    Colors.blue,
                  ]).createShader(bounds);
                },
              child: Responsive(
                  desktop: AnimatedSubtitleText(
                      start: 30, end: 40, text: secondText ?? "", gradient: true),
                  largeMobile: AnimatedSubtitleText(
                      start: 30, end: 25, text: secondText ?? "", gradient: true),
                  mobile: AnimatedSubtitleText(
                      start: 25, end: 20, text: secondText ?? "", gradient: true),
                  tablet: AnimatedSubtitleText(
                      start: 40, end: 30, text: secondText ?? "", gradient: true),
                ),
            )
            : ShaderMask(
                shaderCallback: (bounds) {
                  return const LinearGradient(colors: [
                    AppColors.darkPrimaryColor,
                    Colors.blue,
                  ]).createShader(bounds);
                },
                child: Responsive(
                  desktop: AnimatedSubtitleText(
                      start: 30,
                      end: 40,
                      text: secondText ?? "",
                      gradient: true),
                  largeMobile: AnimatedSubtitleText(
                      start: 30,
                      end: 25,
                      text: secondText ?? "",
                      gradient: true),
                  mobile: AnimatedSubtitleText(
                      start: 25,
                      end: 20,
                      text: secondText ?? "",
                      gradient: true),
                  tablet: AnimatedSubtitleText(
                      start: 40,
                      end: 30,
                      text: secondText ?? "",
                      gradient: true),
                ),
              ))
      ],
    );
  }
}
