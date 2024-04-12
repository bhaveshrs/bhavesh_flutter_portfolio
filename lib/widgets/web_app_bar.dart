// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class WebAppBar extends StatelessWidget {
  final Function(int) pageCallback;
  final Animation<double> webAppBarAnimation;
  final Animation<Offset> webAppBarSlideAnimation;

  const WebAppBar({
    Key? key,
    required this.pageCallback,
    required this.webAppBarAnimation,
    required this.webAppBarSlideAnimation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              pageCallback(0);
            },
            child: AnimatedBuilder(
              animation: webAppBarAnimation,
              builder: (context, child) {
                return Transform.scale(
                  scale: webAppBarAnimation.value,
                  child: Opacity(
                      opacity: webAppBarAnimation.value,
                      child: Row(
                        children: [
                          Image.asset(
                            "assets/bash2.png",
                            height: 70,
                            width: 70,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          SlideTransition(
                            position: webAppBarSlideAnimation,
                            child: const Text(
                              'Bhavesh',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                              ),
                            ),
                          ),
                        ],
                      )),
                );
              },
            ),
          ),
          Row(
            children: [
              InkWell(
                onTap: () {
                  pageCallback(0);
                },
                child: _appBarItem(
                  '1',
                  'About',
                  Icons.info_outline,
                ),
              ),
              const SizedBox(
                width: 32,
              ),
              InkWell(
                onTap: () {
                  pageCallback(height.toInt());
                },
                child: _appBarItem(
                  '2',
                  'Experience',
                  Icons.work_outline,
                ),
              ),
              const SizedBox(
                width: 32,
              ),
              // InkWell(
              //   onTap: () {
              //     pageCallback(3);
              //   },
              //   child: _appBarItem(
              //     '3',
              //     'Work',
              //     Icons.handyman_outlined,
              //   ),
              // ),
              // const SizedBox(
              //   width: 32,
              // ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _appBarItem(String number, String item, IconData iconData) {
    return Row(
      children: [
        // Icon(
        //   iconData,
        //   size: 18,
        //   color: Colors.green,
        // ),
        // const SizedBox(
        //   width: 8,
        // ),
        Text(
          item,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.white,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
