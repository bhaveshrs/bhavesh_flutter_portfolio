import 'package:bhavesh_flutter_portfolio/features/projects/widgets/project_model.dart';
import 'package:bhavesh_flutter_portfolio/utils/define_width.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectGrid extends StatefulWidget {
  final int crossAxisCount;
  final double ratio;
  const ProjectGrid({super.key, this.crossAxisCount = 3, this.ratio = 1.3});

  @override
  State<ProjectGrid> createState() => _ProjectGridState();
}

class _ProjectGridState extends State<ProjectGrid> {
  List<bool> hovers = [false, false];
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);

    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      itemCount: projectList.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: widget.crossAxisCount,
          childAspectRatio: widget.ratio),
      itemBuilder: (context, index) {
        return AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                gradient: const LinearGradient(colors: [
                  Colors.pinkAccent,
                  Colors.blue,
                ]),
                boxShadow: [
                  BoxShadow(
                    color: Colors.pink,
                    offset: const Offset(-2, 0),
                    blurRadius: hovers[index] ? 20 : 10,
                  ),
                  BoxShadow(
                    color: Colors.blue,
                    offset: const Offset(2, 0),
                    blurRadius: hovers[index] ? 20 : 10,
                  ),
                ]),
            child: InkWell(
              onHover: (value) {
                hovers[index] = value;
                setState(() {});
              },
              onTap: () {},
              borderRadius: BorderRadius.circular(30),
              child: AnimatedContainer(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.black),
                duration: const Duration(milliseconds: 500),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Text(
                        projectList[index].name,
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Responsive.isMobile(context)
                        ? const SizedBox(
                            height: 20 / 2,
                          )
                        : const SizedBox(
                            height: 20,
                          ),
                    Text(
                      projectList[index].description,
                      style: const TextStyle(color: Colors.grey, height: 1.5),
                      maxLines: size.width > 700 && size.width < 750
                          ? 3
                          : size.width < 470
                              ? 2
                              : size.width > 600 && size.width < 700
                                  ? 6
                                  : size.width > 900 && size.width < 1060
                                      ? 6
                                      : 4,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        const Row(
                          children: [
                            Text('Check Details',
                                style: TextStyle(color: Colors.white),
                                overflow: TextOverflow.ellipsis),
                          ],
                        ),
                        const Spacer(),
                        TextButton(
                            onPressed: () {
                              // launchUrl(Uri.parse(projectList[index].link));
                            },
                            child: const Text(
                              'See>>',
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: Colors.amber,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10),
                            ))
                      ],
                    ),
                    const SizedBox(
                      height: 20 / 2,
                    ),
                  ],
                ),
              ),
            ));
      },
    );
  }
}
