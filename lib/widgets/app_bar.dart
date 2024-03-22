import 'package:bhavesh_flutter_portfolio/utils/app_colors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class MobileAppBar extends StatefulWidget {
  final Function(bool, int) appBarClick;

  const MobileAppBar({
    super.key,
    required this.appBarClick,
  });

  @override
  _MobileAppBarState createState() => _MobileAppBarState();
}

class _MobileAppBarState extends State<MobileAppBar> {
  bool _toggle = false;

  @override
  void initState() {
    super.initState();
    _toggle = false;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              onTap: () => widget.appBarClick(_toggle, 0),
              child: const Text(
                'Bhavesh',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                  color: AppColors.darkPopupTextColor,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  _toggle = !_toggle;
                });
                widget.appBarClick(_toggle, -1);
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(
                    color: AppColors.darkPrimaryColor,
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(2.0),
                  child: Icon(
                    Icons.view_headline_outlined,
                    color: AppColors.iconTextColor,
                    size: 24,
                  ),
                ),
              ),
            ),
          ],
        ),
        _toggle
            ? Padding(
                padding: const EdgeInsets.only(
                  top: 8,
                  left: 4,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _appBarItem(
                      'About',
                      1,
                      Icons.info_outline,
                    ),
                    _appBarItem(
                      'Experience',
                      2,
                      Icons.work_outline,
                    ),
                    _appBarItem(
                      'Work',
                      3,
                      Icons.handyman_outlined,
                    ),
                  ],
                ),
              )
            : Container()
      ],
    );
  }

  Widget _appBarItem(String title, int item, IconData icon) {
    return InkWell(
      onTap: () {
        setState(() {
          _toggle = !_toggle;
        });
        widget.appBarClick(false, item);
      },
      child: Padding(
        padding: const EdgeInsets.only(
          bottom: 12,
        ),
        child: Row(
          children: [
            Icon(
              icon,
              size: kIsWeb ? 20 : 24,
              color: AppColors.darkPrimaryColor.withOpacity(0.8),
            ),
            const SizedBox(
              width: 16,
            ),
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: kIsWeb ? 16 : 20,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
