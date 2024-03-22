import 'package:bhavesh_flutter_portfolio/features/projects/widgets/project_grid.dart';
import 'package:bhavesh_flutter_portfolio/utils/define_width.dart';
import 'package:flutter/material.dart';

class ProjectsView extends StatelessWidget {
  const ProjectsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
          const Expanded(
              child: Responsive(
                  desktop: ProjectGrid(
                    crossAxisCount: 3,
                  ),
                  extraLargeScreen: ProjectGrid(
                    crossAxisCount: 4,
                  ),
                  largeMobile: ProjectGrid(crossAxisCount: 1, ratio: 1.8),
                  mobile: ProjectGrid(crossAxisCount: 1, ratio: 1.5),
                  tablet: ProjectGrid(
                    ratio: 1.4,
                    crossAxisCount: 2,
                  )))
        ],
      ),
    );
  }
}
