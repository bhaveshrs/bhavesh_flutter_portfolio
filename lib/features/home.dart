import 'package:bhavesh_flutter_portfolio/features/introduction/inroduction.dart';
import 'package:bhavesh_flutter_portfolio/features/introduction/widgets/social_media_icon.dart';
import 'package:bhavesh_flutter_portfolio/features/projects/projects.dart';
import 'package:bhavesh_flutter_portfolio/utils/app_colors.dart';
import 'package:bhavesh_flutter_portfolio/utils/define_width.dart';
import 'package:bhavesh_flutter_portfolio/widgets/app_bar.dart';
import 'package:bhavesh_flutter_portfolio/widgets/web_app_bar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late AnimationController _webAppBarController;
  late Animation<double> __webAppBaranimation;
  late AnimationController _slideController;
  late Animation<Offset> _slideAnimation;
  // final PageController controller = PageController();
  final PageController _pageController = PageController();
  double? _appBarHeight;
  List<Widget> pages = [
    const Introduction(),
    const ProjectsView(),
    // Certifications(),
  ];
  int? _currentPage = 0;
  // final List<Widget> pages;

  @override
  void initState() {
    super.initState();

    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page?.toInt();
      });
    });
    _webAppBarController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    __webAppBaranimation =
        CurvedAnimation(parent: _webAppBarController, curve: Curves.easeInOut);
    _webAppBarController.forward();

    _slideController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _slideAnimation = TweenSequence([
      TweenSequenceItem(
        tween: Tween<Offset>(
          begin: const Offset(-0.5, 0.0),
          end: const Offset(0.0, 0.0),
        ),
        weight: 0.5,
      ),
    ]).animate(
      CurvedAnimation(
        parent: _slideController,
        curve: Curves.easeInCubic,
      ),
    );
    _slideController.forward();
// _pageController.animateTo()
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _webAppBarController.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      bottomNavigationBar: Responsive.isLargeMobile(context) &&
              _currentPage == 0
          ? Row(
              children: [
                Expanded(
                  child: SocialMediaIcon(
                      icon: 'assets/linkedin.svg',
                      // size: ,
                      onTap: () => launchUrl(Uri.parse(
                          'https://www.linkedin.com/in/bhavesh-rana-881b27212/'))),
                ),
                Expanded(
                  child: SocialMediaIcon(
                    icon: 'assets/github.svg',
                    onTap: () =>
                        launchUrl(Uri.parse('https://github.com/bhaveshrs')),
                  ),
                ),
                const Expanded(
                    child: SocialMediaIcon(icon: 'assets/twitter.svg')),
                const Expanded(
                    child: SocialMediaIcon(icon: 'assets/linkedin.svg')),
              ],
            )
          : null,
      appBar: AppBar(
        backgroundColor: AppColors.darkScaffoldColor,
        shadowColor: Colors.green.withOpacity(0.5),
        elevation: 0,
        toolbarHeight: _appBarHeight,
        title: Responsive.isLargeMobile(context)
            ? MobileAppBar(
                appBarClick: (isToggled, item) {
                  setState(() {
                    if (isToggled) {
                      _appBarHeight = 160;
                    } else {
                      _appBarHeight = null;
                    }
                  });
                  if (item != -1) {
                    _pageController.animateToPage(
                      item,
                      curve: Curves.easeIn,
                      duration: const Duration(milliseconds: 800),
                    );
                  }
                },
              )
            : WebAppBar(
                webAppBarSlideAnimation: _slideAnimation,
                webAppBarAnimation: __webAppBaranimation,
                pageCallback: (pageNumber) {
                  _pageController.animateToPage(
                    pageNumber,
                    curve: Curves.easeIn,
                    duration: const Duration(milliseconds: 800),
                  );
                },
              ),
      ),
      body: Center(
        child: Column(
          children: [
            kIsWeb && !Responsive.isLargeMobile(context)
                ? const SizedBox(
                    height: 20 * 2,
                  )
                : const SizedBox(
                    height: 20 / 2,
                  ),
        
            Expanded(
              flex: 9,
              child: PageView(
                scrollDirection: Axis.vertical,
                controller: _pageController,
                children: pages,
              ),
            )
          ],
        ),
      ),
    );
  }
}
