import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web/components/primary_button.dart';
import 'package:flutter_web/components/secondary_button.dart';
import 'package:flutter_web/constans.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: LayoutBuilder(builder: (context, cons) {
        bool isDekstopOrTablet = cons.maxWidth >= tabletWidthBreakpoint;
        return Stack(
          children: [
            Positioned(
              left: -30,
              top: 100,
              child: Container(
                constraints: BoxConstraints(
                    maxHeight: 300,
                    minHeight: 120,
                    maxWidth: 300,
                    minWidth: 120),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context).primaryColorDark.withOpacity(0.2),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                  left: isDekstopOrTablet ? 60 : 20,
                  right: isDekstopOrTablet ? 0 : 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Hallo, I am',
                    style: TextStyle(
                        color: fontColor,
                        fontSize: isDekstopOrTablet ? 36 : 24),
                  ),
                  Text(
                    'Luthfi\nKhoirul Anwar',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: isDekstopOrTablet ? 80 : 48,
                        fontWeight: FontWeight.w600),
                  ),
                  Wrap(
                    children: [
                      Text(
                        'Hanya seorang yang ingin tau tentang ',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: isDekstopOrTablet ? 26 : 18,
                            fontWeight: FontWeight.w500),
                      ),
                      RotateAnimatedTextKit(
                        transitionHeight: 60,
                        repeatForever: true,
                        pause: Duration(),
                        text: ["Android Developer", "Flutter Developer"],
                        textStyle: TextStyle(
                            fontSize: isDekstopOrTablet ? 26 : 18,
                            color: Theme.of(context).accentColor,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8),
                  ),
                  Text('Find Me on',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: isDekstopOrTablet ? 20 : 14,
                          fontWeight: FontWeight.w500)),
                  Row(
                    children: [
                      Tooltip(
                        message: 'LinkedIn',
                        child: InkWell(
                          onTap: () async {
                            await launch(linkedinLink);
                          },
                          child: Icon(FontAwesomeIcons.linkedinIn,
                              size: 28, color: Colors.white),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 8),
                      ),
                      Tooltip(
                        message: 'Github',
                        child: InkWell(
                          onTap: () async {
                            await launch(githubLink);
                          },
                          child: Icon(FontAwesomeIcons.github,
                              size: 28, color: Colors.white),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 8),
                      ),
                      Tooltip(
                        message: 'Instagram',
                        child: InkWell(
                          onTap: () async {
                            await launch(igLink);
                          },
                          child: Icon(FontAwesomeIcons.instagram,
                              size: 28, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 32),
                  ),
                  Row(
                    children: [
                      PrimaryButton(
                        buttonText: 'Hire Me',
                        onTap: () async {
                          await launch('mailto:$email');
                        },
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 8),
                      ),
                      SecondaryButton(
                        buttonText: 'Resume',
                        onTap: () async {
                          await launch(cvLink);
                        },
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}
