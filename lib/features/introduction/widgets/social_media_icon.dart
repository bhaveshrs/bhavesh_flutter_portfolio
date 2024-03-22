// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SocialMediaIcon extends StatelessWidget {
  const SocialMediaIcon({
    Key? key,
    required this.icon,
     this.size,
    this.onTap,
  }) : super(key: key);
  final String icon;
  final VoidCallback? onTap;
  final double? size;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: SvgPicture.asset(
          icon,
          color: Colors.white,
          height: size,
          width: size,
        ),
      ),
    );
  }
}
