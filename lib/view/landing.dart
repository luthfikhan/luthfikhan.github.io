// ignore: avoid_web_libraries_in_flutter
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_web/components/custom_transition.dart';
import 'package:flutter_web/constans.dart';
import 'package:flutter_web/model/drawer_property_model.dart';
import 'package:flutter_web/view/home/home.dart';
import 'package:flutter_web/view/portofolio/portofolio.dart';
import 'package:flutter_web/view/profile/profile.dart';
import 'package:timeline_tile/timeline_tile.dart';

class Landing extends StatefulWidget {
  @override
  _LandingState createState() => _LandingState();
}

class _LandingState extends State<Landing> with TickerProviderStateMixin {
  bool _drawerVisibility = false;
  int _pageIndex = 0;
  AnimationController _iconAnimationCon;
  PageController _pageViewCon = PageController();

  List<DrawerPropertyModel> _drawerProperties = [
    DrawerPropertyModel(title: 'HOME', isHover: true),
    DrawerPropertyModel(title: 'ABOUT ME', isHover: false),
    DrawerPropertyModel(title: 'PORTOFOLIO', isHover: false)
  ];

  Widget _drawer() {
    return Center(
      child: CustomTransition(
        sizeFactor: CurvedAnimation(
            curve: _drawerVisibility ? Curves.bounceOut : Curves.bounceIn,
            parent: _iconAnimationCon),
        child: Container(
          width: 300,
          color: Theme.of(context).primaryColorLight,
          child: Container(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 36),
                ),
                Image.asset(
                  logoImg,
                  width: 200,
                  color: Colors.orange,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 12),
                ),
                Text('Luthfikhan',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.w500)),
                Text(
                  'Mobile Developer',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16, top: 32),
                  child: Column(
                    children:
                        List<Widget>.generate(_drawerProperties.length, (i) {
                      return InkWell(
                        onFocusChange: (value) {},
                        onTap: () {
                          setState(() {
                            for (var item in _drawerProperties) {
                              if (item == _drawerProperties[i]) {
                                item.isHover = true;
                              } else {
                                item.isHover = false;
                              }
                            }
                            _pageIndex = i;
                          });
                          _pageViewCon.animateToPage(i,
                              curve: Curves.easeOutQuad,
                              duration: Duration(milliseconds: 1200));
                        },
                        onHover: (value) {
                          if (_drawerProperties[i].isHover && _pageIndex == i)
                            return;
                          setState(() {
                            _drawerProperties[i].isHover = value;
                          });
                        },
                        child: TimelineTile(
                          endChild: Padding(
                            padding: EdgeInsets.fromLTRB(16, 16, 0, 16),
                            child: Text(
                              _drawerProperties[i].title,
                              style: TextStyle(
                                  fontSize: 16,
                                  color: _drawerProperties[i].isHover
                                      ? Colors.orange
                                      : fontColor),
                            ),
                          ),
                          afterLineStyle:
                              LineStyle(thickness: 2, color: fontColor),
                          beforeLineStyle:
                              LineStyle(thickness: 2, color: fontColor),
                          indicatorStyle: IndicatorStyle(
                              width: 12,
                              color: _drawerProperties[i].isHover
                                  ? Colors.orange
                                  : fontColor),
                        ),
                      );
                    }),
                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    children: [
                      Icon(
                        Icons.copyright_outlined,
                        color: fontColor,
                        size: 18,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 8),
                      ),
                      Text(
                        'Luthfikhan - All Rights Reserved',
                        style: TextStyle(color: fontColor, fontSize: 14),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _drawerButton() {
    return Container(
      color: Theme.of(context).accentColor,
      child: InkWell(
        onTap: () {
          if (_drawerVisibility) {
            _iconAnimationCon.reverse();
          } else {
            _iconAnimationCon.forward();
          }
          setState(() {
            _drawerVisibility = !_drawerVisibility;
          });
        },
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: AnimatedIcon(
            progress: _iconAnimationCon,
            size: 32,
            icon: AnimatedIcons.menu_close,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  List<Widget> _pages() {
    return [Home(), Profile(), Portofolio()];
  }

  Widget _body() {
    return PageView.builder(
      controller: _pageViewCon,
      onPageChanged: (i) {
        setState(() {
          _pageIndex = i;
          for (var item in _drawerProperties) {
            item.isHover = false;
          }

          _drawerProperties[i].isHover = true;
        });
      },
      scrollDirection: Axis.vertical,
      itemCount: _drawerProperties.length,
      itemBuilder: (context, index) {
        return _pages()[index];
      },
    );
  }

  @override
  void initState() {
    _iconAnimationCon =
        AnimationController(vsync: this, duration: Duration(milliseconds: 800));

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final loader = document.getElementsByClassName('loading');
      if (loader.isNotEmpty) {
        loader.first.remove();
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    _iconAnimationCon.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).primaryColorDark,
      child: SafeArea(
        child: LayoutBuilder(builder: (context, cons) {
          // if (cons.maxWidth >= _dekstopWidthBreakpoint) {
          return Container(
            child: Row(
              children: [
                /**
                   *  Drawer
                   */
                _drawer(),
                Expanded(
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      AnimatedContainer(
                        duration: Duration(seconds: 3),
                        child: _body(),
                      ),
                      Positioned(
                        top: 0,
                        left: 0,
                        child: _drawerButton(),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
          // }

          // return Container(
          //   color: Theme.of(context).primaryColorLight,
          //   child: Row(
          //     children: [
          //       /**
          //          *  Drawer
          //          */
          //       _drawer(),
          //       Expanded(
          //         child: Stack(
          //           children: [
          //             Positioned(
          //               top: 0,
          //               left: 0,
          //               child: _drawerButton(),
          //             ),
          //             AnimatedContainer(
          //               duration: Duration(seconds: 3),
          //             ),
          //           ],
          //         ),
          //       )
          //     ],
          //   ),
          // );

          // return Scaffold(
          //   backgroundColor: Theme.of(context).primaryColorLight,
          // body: PageView.builder(
          //   onPageChanged: (i) {
          //     setState(() {
          //       _pageIndex = i;
          //     });
          //   },
          //   scrollDirection: Axis.vertical,
          //   itemCount: 3,
          //   itemBuilder: (context, index) {
          //     return Container(
          //       child: Text(
          //         'Page ke $index',
          //         style: TextStyle(color: Colors.white),
          //       ),
          //     );
          //   },
          // ),
          // );
        }),
      ),
    );
  }
}
