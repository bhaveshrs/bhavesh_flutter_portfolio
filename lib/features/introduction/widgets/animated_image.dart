import 'package:bhavesh_flutter_portfolio/features/introduction/skill_model.dart';
import 'package:bhavesh_flutter_portfolio/utils/app_colors.dart';
import 'package:bhavesh_flutter_portfolio/utils/define_width.dart';
import 'package:flutter/material.dart';

class AnimatedImageContainer extends StatefulWidget {
  const 
  AnimatedImageContainer(
      {super.key, this.width, this.height, required this.skillItems});
  final double? width;
  final double? height;
  final SkillItems skillItems;

  @override
  State<AnimatedImageContainer> createState() => _AnimatedImageContainerState();
}

class _AnimatedImageContainerState extends State<AnimatedImageContainer>  with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height!,
      width: widget.width!,
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        gradient: const LinearGradient(colors: [
          AppColors.darkPrimaryColor,
          Colors.blue,
        ]),
        boxShadow: const [
          BoxShadow(
            color: AppColors.darkPrimaryColor,
            offset: Offset(-2, 0),
            blurRadius: 20,
          ),
          BoxShadow(
            color: Colors.blue,
            offset: Offset(2, 0),
            blurRadius: 20,
          ),
        ],
      ),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(30),
        ),
        child: SizedBox(
          width: 100,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: TweenAnimationBuilder(
              tween: Tween(begin: 0.0, end: widget.skillItems.percentage),
              duration: const Duration(seconds: 1),
              builder: (context, value, child) {
                return Column(
                      mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                       Expanded(
                         child: Padding(
                           padding: const EdgeInsets.all(10.0),
                           child: Image.asset(
                              widget.skillItems.image,
                              // height: ((widget.height ?? 100) / 3),
                              // width: ((widget.width ?? 100) / 3),
                              fit: BoxFit.contain,
                            ),
                         ),
                       ),
                        const SizedBox(
                          width: 8,
                        ),
                        Responsive(
                          mobile: Text(
                            widget.skillItems.title,
                            style: const TextStyle(color: Colors.white, fontSize: 30),
                          ),
                          largeMobile: Text(
                            widget.skillItems.title,
                            style: const TextStyle(color: Colors.white, fontSize: 16),
                          ),
                          desktop: Text(
                            widget.skillItems.title,
                            style: const TextStyle(color: Colors.white,fontSize: 30),
                          ),  

                          tablet: Text(
                            widget.skillItems.title,
                            style: const TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                     Text('${(value * 100).toInt().toString()}%'),
                    const SizedBox(
                      height: 10,
                    ),
                    LinearProgressIndicator(
                      value: value,
                      backgroundColor: Colors.black,
                      color: Colors.amberAccent,
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
