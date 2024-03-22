// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bhavesh_flutter_portfolio/utils/app_colors.dart';
import 'package:flutter/material.dart';

class RainbowButton extends StatelessWidget {
  Function? onTap;
  String name;
  Widget icon;
  RainbowButton({
    Key? key,
    this.onTap,
    required this.name,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: InkWell(
        onTap: onTap?.call(),
        // () {
        //   launchUrl(Uri.parse('https://wa.me/03054200605'));
        // },
        borderRadius: BorderRadius.circular(30),
        child: Container(
            height: 60,
            width: 150,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(colors: [
                  AppColors.darkPrimaryColor,
                  Colors.blue.shade900,
                ]),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.blue,
                      offset: Offset(0, -1),
                      blurRadius: 20 / 4),
                  BoxShadow(
                      color: Colors.red,
                      offset: Offset(0, 1),
                      blurRadius: 20 / 4),
                ]),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                icon,
                const SizedBox(width: 20 / 4),
                Text(
                  name,
                  style: Theme.of(context).textTheme.labelSmall!.copyWith(
                      color: Colors.white,
                      letterSpacing: 1.2,
                      fontWeight: FontWeight.bold),
                ),
              ],
            )),
      ),
    );
  }
}
