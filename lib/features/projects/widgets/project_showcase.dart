import 'package:bhavesh_flutter_portfolio/utils/app_colors.dart';
import 'package:bhavesh_flutter_portfolio/utils/define_width.dart';
import 'package:flutter/material.dart';

class ProjectShowcase extends StatefulWidget {
  final String title;
  final String? subTitle;
  final String? index;
  final String? techStack;
  final String? githubUrl;
  final String? playStoreUrl;

  const ProjectShowcase({
    super.key,
    required this.title,
    this.subTitle,
    this.githubUrl,
    this.playStoreUrl,
    this.techStack,
    this.index,
  });

  @override
  _ProjectShowcaseState createState() => _ProjectShowcaseState();
}

class _ProjectShowcaseState extends State<ProjectShowcase> {
  late List<Widget> _showcaseList;
  late String _playStore;

  @override
  void initState() {
    /// todo generic
    _playStore = 'playstore_dark';
    if (widget.title == 'Fifth-ventricle') {
      _showcaseList = [
        _placeholder('fith_ventricle_1', "fifth_ventricle"),
        _placeholder('fith_ventricle_2', "fifth_ventricle"),
        _placeholder('fith_ventricle_3', "fifth_ventricle"),
        _placeholder('fith_ventricle_4', "fifth_ventricle"),
        _placeholder('fith_ventricle_5', "fifth_ventricle"),
        _placeholder('fith_ventricle_6', "fifth_ventricle"),
        _placeholder('fith_ventricle_7', "fifth_ventricle"),
        _placeholder('fith_ventricle_8', "fifth_ventricle"),
        _placeholder('fith_ventricle_9', "fifth_ventricle"),
        _placeholder('fith_ventricle_10', "fifth_ventricle"),
        _placeholder('fith_ventricle_11', "fifth_ventricle"),
      ];
    } else if (widget.title == 'Trust-blocks') {
      _showcaseList = [
        _placeholder('trust_blocks-1', "trust_block"),
        _placeholder('trust_blocks-2', "trust_block"),
        _placeholder('trust_blocks-3', "trust_block"),
        _placeholder('trust_blocks-4', "trust_block"),
        _placeholder('trust_blocks-5', "trust_block"),
        _placeholder('trust_blocks-6', "trust_block"),
        _placeholder('trust_blocks-7', "trust_block"),
        _placeholder('trust_blocks-8', "trust_block"),
        _placeholder('trust_blocks-9', "trust_block"),
      ];
    } else if (widget.title == 'EVI') {
      _showcaseList = [
        _placeholder('evi-1', "evi"),
        _placeholder('evi-2', "evi"),
        _placeholder('evi-3', "evi"),
        _placeholder('evi-4', "evi"),
        _placeholder('evi-5', "evi"),
        _placeholder('evi-6', "evi"),
        _placeholder('evi-7', "evi"),
      ];
    } else if (widget.title == 'Watthub') {
      _showcaseList = [
        _placeholder('whatthub1', "whatthub"),
        _placeholder('whatthub7', "whatthub"),
        _placeholder('whatthub2', "whatthub"),
        _placeholder('whatthub3', "whatthub"),
        _placeholder('whatthub9', "whatthub"),
        _placeholder('whatthub5', "whatthub"),
        _placeholder('whatthub6', "whatthub"),
        _placeholder('whatthub4', "whatthub"),
      ];
    } else if (widget.title == 'Sorted - pos') {
      _showcaseList = [
        _placeholder('pos1', "pos_sorted"),
        _placeholder('pos3', "pos_sorted"),
        _placeholder('pos4', "pos_sorted"),
        _placeholder('pos5', "pos_sorted"),
        _placeholder('pos6', "pos_sorted"),
        _placeholder('pos7', "pos_sorted"),
        _placeholder('pos8', "pos_sorted"),
        _placeholder('pos2', "pos_sorted"),
      ];
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 550,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Text("${widget.index}. " ?? "",
                    style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                        height: 0,
                        fontSize: 24)),
                Text(widget.title.toUpperCase(),
                    style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                        height: 0,
                        fontSize: 24)),
                SizedBox(
                  width:
                      (widget.playStoreUrl != null && widget.playStoreUrl != "")
                          ? 16
                          : 0,
                ),
                (widget.playStoreUrl != null && widget.playStoreUrl != "")
                    ? InkWell(
                        onTap: () {
                          // CommonFunction.openFromUrl(widget.playStoreUrl ?? "");
                        },
                        child: Container(
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(colors: [
                              Colors.pinkAccent,
                              Colors.blue,
                            ]),
                          ),
                          // elevation: 5,
                          child: Image.asset(
                            'asset/google_play.png',
                            fit: BoxFit.fill,
                            width: 130,
                            height: 36,
                          ),
                        ),
                      )
                    : Container(),
                widget.githubUrl != null && widget.githubUrl != ""
                    ? Padding(
                        padding: const EdgeInsets.only(left: 16),
                        child: InkWell(
                          onTap: () {
                            // CommonFunction.openFromUrl(widget.githubUrl ?? "");
                          },
                          onHover: (value) {
                            if (value) {
                              setState(() {
                                _playStore = 'github_light';
                              });
                            } else {
                              setState(() {
                                _playStore = 'github_dark';
                              });
                            }
                          },
                          child: Image.asset(
                            'asset/$_playStore.png',
                            width: 16,
                            height: 16,
                          ),
                        ),
                      )
                    : Container(),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            RichText(
                text: TextSpan(
                    style: TextStyle(
                        fontSize: Responsive.isDesktop(context) ? 18 : 16,
                        fontWeight: FontWeight.w400,
                        color: AppColors.iconTextColor),
                    children: [
                  TextSpan(
                    text: 'Used techStack : ',
                    style: TextStyle(
                        fontSize: Responsive.isDesktop(context) ? 18 : 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                  ),
                  TextSpan(
                    text: widget.techStack ?? "",
                    style: TextStyle(
                      fontSize: Responsive.isDesktop(context) ? 18 : 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ])),
            const SizedBox(
              height: 6,
            ),
            RichText(
                text: TextSpan(
                    style: TextStyle(
                        fontSize: Responsive.isDesktop(context) ? 18 : 16,
                        fontWeight: FontWeight.w400,
                        color: AppColors.iconTextColor),
                    children: [
                  TextSpan(
                    text: 'Quick description : ',
                    style: TextStyle(
                        fontSize: Responsive.isDesktop(context) ? 18 : 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                  ),
                  TextSpan(
                    text: widget.subTitle ?? "",
                    style: TextStyle(
                      fontSize: Responsive.isDesktop(context) ? 18 : 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ])),
            const SizedBox(
              height: 7,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 32),
              child: SizedBox(
                height: 320,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  children: _showcaseList,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _placeholder(String image, String folder) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: widget.title == 'Sorted - pos'
            ? 16
            : ['Watthub', 'EVI'].contains(widget.title)
                ? 0
                : 20,
      ),
      child: Image.asset(
        'assets/$folder/$image.png',
      ),
    );
  }
}
