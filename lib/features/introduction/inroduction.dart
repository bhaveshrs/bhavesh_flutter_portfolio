import 'package:bhavesh_flutter_portfolio/features/introduction/skill_model.dart';
import 'package:bhavesh_flutter_portfolio/features/introduction/widgets/animated_image.dart';
import 'package:bhavesh_flutter_portfolio/features/introduction/widgets/description_text.dart';
import 'package:bhavesh_flutter_portfolio/features/introduction/widgets/intro_text.dart';
import 'package:bhavesh_flutter_portfolio/features/introduction/widgets/social_media_icon.dart';
import 'package:bhavesh_flutter_portfolio/features/introduction/widgets/subtitle_text.dart';
import 'package:bhavesh_flutter_portfolio/utils/define_width.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Introduction extends StatefulWidget {
  const Introduction({super.key});

  @override
  State<Introduction> createState() => _IntroductionState();
}

class _IntroductionState extends State<Introduction>
    with SingleTickerProviderStateMixin {
  late FlipCardController _flipcontroller;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _flipcontroller = FlipCardController();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..repeat(reverse: true);
  }

  GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();

  @override
  void dispose() {
    _controller.dispose();
    _flipcontroller.controller?.dispose();
    _flipcontroller.controller?.stop();

    super.dispose();
  }

  final List<SkillItems> listData = ProgressData.getSkillItems();
  int frontCurrentIndex = 0;
  int backCurrentIndex = 1;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Row(
        children: [
          SizedBox(
            width: size.width * 0.03,
          ),
          if (!Responsive.isLargeMobile(context))
            TweenAnimationBuilder(
              tween: Tween(begin: 0.0, end: 1.0),
              duration: const Duration(milliseconds: 200),
              builder: (context, value, child) {
                return Transform.scale(
                  scale: value,
                  child: Column(
                    children: [
                      const Spacer(),
                      RotatedBox(
                        quarterTurns: -3,
                        child: Text(
                          'Follow Me',
                          style:
                              Theme.of(context).textTheme.titleSmall!.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),

                      Container(
                        height: size.height * 0.06,
                        width: 3,
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)),
                      ),
                      SizedBox(
                        height: 30,
                        width: 30,
                        child: SocialMediaIcon(
                          icon: 'assets/whatsapp.svg',
                          onTap: () async {
                            final Uri whatsappMobile = Uri.parse(
                                "whatsapp://send?phone=+917069184266");
                            if (await canLaunchUrl(whatsappMobile)) {
                              await launchUrl(whatsappMobile,
                                  mode: LaunchMode.externalApplication);
                            } else {
                              await launchUrl(
                                  Uri.parse(
                                      "https://web.whatsapp.com/send?phone=917069184266"),
                                  mode: LaunchMode.externalApplication);
                            }
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),

                      SocialMediaIcon(
                          icon: 'assets/linkedin.svg',
                          onTap: () => launchUrl(Uri.parse(
                              'https://www.linkedin.com/in/bhavesh-rana-881b27212/'))),
                      const SizedBox(
                        height: 5,
                      ),
                      SocialMediaIcon(
                        icon: 'assets/github.svg',
                        onTap: () => launchUrl(
                            Uri.parse('https://github.com/bhaveshrs')),
                      ),
                      const SizedBox(
                        height: 5,
                      ),

                      SocialMediaIcon(
                        icon: 'assets/twitter.svg',
                        onTap: () {
                          launchUrl(
                              Uri.parse('https://twitter.com/Bhavesh_131'));
                          // https://twitter.com/Bhavesh_131
                        },
                      ),

                      //              final Uri whatsappMobile = Uri.parse("whatsapp://send?phone=$whatsapp");
                      // if (await canLaunchUrl(whatsappMobile)) {
                      //   await launchUrl(whatsappMobile, mode: LaunchMode.externalApplication);
                      // } else {
                      //   await launchUrl( Uri.parse("https://web.whatsapp.com/send?phone=$whatsapp"), mode: LaunchMode.externalApplication);
                      // }

                      const Spacer(),
                    ],
                  ),
                );
              },
            ),
          if (Responsive.isDesktop(context))
            SizedBox(
              width: size.width * 0.07,
            ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (!Responsive.isDesktop(context))
                        Center(
                          child: AnimatedBuilder(
                              animation: _controller,
                              builder: (context, child) {
                                final value = _controller.value;
                                return Transform.translate(
                                  offset: Offset(0,
                                      2 * value), // Move the container up and down

                                  child: FlipCard(
                                    controller: _flipcontroller,

                                    key: cardKey,
                                    autoFlipDuration:
                                        const Duration(seconds: 2),
                                    onFlip: () {
                                      if ((cardKey.currentState?.isFront ??
                                          false)) {
                                        // If the back side is flipped, change the content
                                        setState(() {
                                          backCurrentIndex =
                                              (frontCurrentIndex + 1) %
                                                  listData.length;
                                        });
                                      } else {
                                        setState(() {
                                          frontCurrentIndex =
                                              (backCurrentIndex + 1) %
                                                  listData.length;
                                        });
                                      }
                                    },
                                    onFlipDone: (value) async {
                                      Future.delayed(const Duration(seconds: 2),
                                          () async {
                                        // Call your function after 20 seconds
                                        await cardKey.currentState
                                            ?.toggleCard();
                                      });
                                    },
                                    flipOnTouch: false, speed: 300,
                                    fill: Fill
                                        .fillBack, // Fill the back side of the card to make in the same size as the front.
                                    direction:
                                        FlipDirection.HORIZONTAL, // default
                                    side: CardSide
                                        .FRONT, // The side to initially display.
                                    front: AnimatedImageContainer(
                                      skillItems: listData[frontCurrentIndex],
                                      width: size.width * 0.4,
                                      height:
                                          MediaQuery.of(context).size.width *
                                                      0.5 >
                                                  300
                                              ? 300
                                              : size.width * 0.5,
                                    ),
                                    back: AnimatedImageContainer(
                                      skillItems: listData[backCurrentIndex],
                                      width: 150,
                                      height: 200,
                                    ),
                                  ),
                                );
                              }),
                        ),

                      //   Row(
                      //     children: [
                      //       SizedBox(
                      //         width: size.width * 0.2,
                      //       ),
                      //  ],
                      //   ),
                      if (!Responsive.isDesktop(context))
                        SizedBox(
                          height: size.height * 0.1,
                        ),
                      const Responsive(
                          desktop: MyPortfolioText(start: 40, end: 50),
                          largeMobile: MyPortfolioText(start: 40, end: 35),
                          mobile: MyPortfolioText(start: 35, end: 30),
                          tablet: Row(
                            children: [
                              MyPortfolioText(start: 50, end: 40),
                            ],
                          )),
                      if (kIsWeb && Responsive.isLargeMobile(context))
                        Container(
                          height: 20,
                          color: Colors.transparent,
                        ),
                      const CombineSubtitleText(
                          firstText: "Flutter ", secondText: "Developer"),
                      const SizedBox(height: 10),
                      const Responsive(
                        desktop: AnimatedDescriptionText(start: 14, end: 15),
                        largeMobile:
                            AnimatedDescriptionText(start: 14, end: 12),
                        mobile: AnimatedDescriptionText(start: 14, end: 12),
                        tablet: AnimatedDescriptionText(start: 17, end: 14),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      // const DownloadButton(),
                    ],
                  ),
                ),
                if (Responsive.isDesktop(context)) ...[
                  const Spacer(),
                  AnimatedBuilder(
                      animation: _controller,
                      builder: (context, child) {
                        final value = _controller.value;
                        return Transform.translate(
                          offset: Offset(
                              0, 2 * value), // Move the container up and down

                          child: FlipCard(
                            controller: _flipcontroller,
                            key: cardKey,
                            autoFlipDuration: const Duration(seconds: 2),
                            onFlip: () {
                              if ((cardKey.currentState?.isFront ?? false)) {
                                // If the back side is flipped, change the content
                                setState(() {
                                  backCurrentIndex =
                                      (frontCurrentIndex + 1) % listData.length;
                                });
                              } else {
                                setState(() {
                                  frontCurrentIndex =
                                      (backCurrentIndex + 1) % listData.length;
                                });
                              }
                            },
                            onFlipDone: (value) async {
                              Future.delayed(const Duration(seconds: 2),
                                  () async {
                                // Call your function after 20 seconds
                                await cardKey.currentState?.toggleCard();
                              });
                            },
                            flipOnTouch: false, speed: 300,
                            fill: Fill
                                .fillBack, // Fill the back side of the card to make in the same size as the front.
                            direction: FlipDirection.HORIZONTAL, // default
                            side: CardSide
                                .FRONT, // The side to initially display.
                            front: AnimatedImageContainer(
                              skillItems: listData[frontCurrentIndex],
                              width: 300,
                              height: 400,
                            ),
                            back: AnimatedImageContainer(
                              skillItems: listData[backCurrentIndex],
                              width: 300,
                              height: 400,
                            ),
                          ),
                        );
                      }),
                  const Spacer()
                ]
              ],
            ),
          ),
        ],
      ),
    );
  }
}
