import 'package:bhavesh_flutter_portfolio/utils/define_width.dart';
import 'package:flutter/material.dart';

class AnimatedDescriptionText extends StatefulWidget {
  const AnimatedDescriptionText(
      {super.key, required this.start, required this.end});
  final double start;
  final double end;

  @override
  State<AnimatedDescriptionText> createState() =>
      _AnimatedDescriptionTextState();
}

class _AnimatedDescriptionTextState extends State<AnimatedDescriptionText> {
  late String t;
  @override
  void initState() {
    // String text =
    //     "Flutter developer in software development with best practices. Skilled in designing and optimizing high-performance mobile applications. Dedicated to leveraging my expertise in Flutter and related technologies to create innovative and user-friendly experiences. Seeking a challenging role as a Flutter developer to contribute in projects and drive business growth.";

    // int wordCount = text.split(' ').length;

    //  t = text;
    // if (Responsive.isLargeMobile(context)) {
    //   // Add line breaks every time the word count reaches a multiple of 5
    //   for (int i = 1; i <= wordCount; i++) {
    //     if (i % 5 == 0) {
    //       t = t.replaceFirst(' ', '\n');
    //     }
    //   }
    // } else {
    //   // Add line breaks every time the word count reaches a multiple of 10
    //   for (int i = 1; i <= wordCount; i++) {
    //     if (i % 10 == 0) {
    //       t = t.replaceFirst(' ', '\n');
    //     }
    //   }
    // }
    // setState(() {

    // });
    // TODO: implement initState
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    String text =
        "Flutter developer in software development with best practices. Skilled in designing and optimizing high-performance mobile applications. Dedicated to leveraging my expertise in Flutter and related technologies to create innovative and user-friendly experiences. Seeking a challenging role as a Flutter developer to contribute in projects and drive business growth.";

    List<String> words = text.split(' ');
    int wordCount = words.length;

    // Define the threshold for line breaks based on the screen size
    int threshold = Responsive.isLargeMobile(context) ? 7 : 10;

    // Initialize the modified text
    t = '';

    // Track the number of words added to the current line
    int wordsInLine = 0;

    // Iterate over the words and add line breaks at the desired intervals
    for (int i = 0; i < wordCount; i++) {
      t += words[i];
      // If the current word is "Flutter", count it as one word and continue
      if (words[i] == "Flutter") {
        wordsInLine++;
        continue;
      }
      // Increment the word count for the current line
      wordsInLine++;
      // Add line break if the threshold is reached
      if (wordsInLine >= threshold) {
        t += ' \n ';
        wordsInLine = 0;
      } else {
        t += ' ';
      }
    }
    print(t);
  }

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween(begin: widget.start, end: widget.end),
      duration: const Duration(milliseconds: 200),
      builder: (context, value, child) {
        return Text(
          Responsive.isLargeMobile(context)
              ? "Flutter developer in software development with best practices.\nSkilled in designing and optimizing high-performance mobile applications.\nDedicated to leveraging my expertise in Flutter and related technologies\nto create innovative and user-friendly experiences.\nSeeking a challenging role as a Flutter developer to contribute in projects\nand drive business growth."
              : "Flutter developer in software development with best practices.Skilled in designing\nand optimizing high-performance mobile applications. Dedicated to leveraging my\nexpertise in Flutter and related technologies to create innovative and user-friendly\nexperiences. Seeking a challenging role as a Flutter developer to contribute in projects\nand drive business growth.",
          // "Flutter developer in software development with best practices. Skilled in designing and optimizing high-performance mobile applications. Dedicated to leveraging my expertise in Flutter and related technologies to create innovative and user-friendly experiences. Seeking a challenging role as a Flutter developer to contribute in projects and drive business growth.",
// 'I\'m capable of creating excellent mobile apps, handling${Responsive.isLargeMobile(context) ? '\n' : ''} every step from ${!Responsive.isLargeMobile(context) ? '\n' : ''}concept to deployment.',
          maxLines: 10,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(color: Colors.grey, wordSpacing: 2, fontSize: value),
        );
      },
    );
  }
}
