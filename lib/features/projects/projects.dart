// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bhavesh_flutter_portfolio/features/introduction/widgets/subtitle_text.dart';
import 'package:bhavesh_flutter_portfolio/features/projects/widgets/project_showcase.dart';
import 'package:bhavesh_flutter_portfolio/utils/define_width.dart';
import 'package:flutter/material.dart';

class ProjectsView extends StatelessWidget {
  final double scrollOffset;

  const ProjectsView({
    Key? key,
    required this.scrollOffset,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return SizedBox(
      height: height,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (Responsive.isLargeMobile(context))
              const SizedBox(
                height: 20,
              ),
            // const TitleText(prefix: 'Latest', title: 'Projects'),
            // const SizedBox(
            //   height: 20,
            // ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: const CombineSubtitleText(
                  firstText: "Some Things ", secondText: "I’ve Built"),
            ),

            // Text('Some Things I’ve Built',
            //     style: Theme.of(context).textTheme.headlineLarge!.copyWith(
            //         color: Colors.white,
            //         fontWeight: FontWeight.w900,
            //         height: 0,
            //         fontSize: 20)),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: IgnorePointer(
                ignoring: scrollOffset <= height ? true : false,
                child: ListView(
                  shrinkWrap: true,
                  children: const [
                    ProjectShowcase(
                      index: "1",
                      techStack:
                          "Bluetooth-Classic, BLE, TenserFlow, Python, Fast-api, FireBase",
                      title: 'Fifth-ventricle',
                      subTitle:
                          "Fifth-ventricle is app To control digital stethoscope and full with features of AI and ML",
                    ),
                    ProjectShowcase(
                      index: "2",
                      techStack:
                          "Hive DataBase, Firebase, DataEncryptions, Xcode, Client-communication",
                      title: 'Trust-blocks',
                      subTitle:
                          "Trust-blocks is app which use for prepare for your digital afterlife, making the transition easier for your loved ones.",
                    ),
                    ProjectShowcase(
                      index: "3",
                      techStack:
                          "Google-Map apis, Rest-apis, Stripe(payment-gateway)",
                      title: 'Watthub',
                      subTitle:
                          "Watthub is app for find nearby EV charging stations and it and availability also provide charging session reports, billing plans and transactions, and much more.",
                    ),
                    ProjectShowcase(
                      index: "4",
                      techStack:
                          "Progressive web-app, Google-Map apis, Rest-apis, Stripe(payment-gateway)",
                      title: 'EVI',
                      subTitle:
                          "EVI is progressive web app its an app for E.V charging process",
                    ),
                    ProjectShowcase(
                      index: "5",
                      techStack: "Rest-apis, sqflite, RazorPay",
                      title: 'Sorted - pos',
                      subTitle:
                          "create pos app which is used for franchise of sorted which is  vegetable and fruit selling store",
                    ),
                  ],
                ),
              ),
            ),

            // const
            // Expanded(
            //     child: Responsive(
            //         desktop: ProjectGrid(
            //           crossAxisCount: 3,
            //         ),
            //         extraLargeScreen: ProjectGrid(
            //           crossAxisCount: 4,
            //         ),
            //         largeMobile: ProjectGrid(crossAxisCount: 1, ratio: 1.8),
            //         mobile: ProjectGrid(crossAxisCount: 1, ratio: 1.5),
            //         tablet: ProjectGrid(
            //           ratio: 1.4,
            //           crossAxisCount: 2,
            //         )))
          ],
        ),
      ),
    );
  }
}
