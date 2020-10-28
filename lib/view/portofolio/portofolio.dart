import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_web/constans.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class PortofolioModel {
  final String image;
  final String title;
  final String desc;
  final Color color;
  final String link;
  bool isHover;

  PortofolioModel(
      {this.image,
      this.title,
      this.desc,
      this.color,
      this.link = '',
      this.isHover = false});
}

class Portofolio extends StatefulWidget {
  @override
  _PortofolioState createState() => _PortofolioState();
}

class _PortofolioState extends State<Portofolio> {
  int _pageIndex = 0, _pageCount = 1;
  PageController _pageController = PageController();

  final List<PortofolioModel> _portofolio = [
    PortofolioModel(
        image: 'assets/portofolio/dicoding.png',
        title: 'Belajar Membuat Aplikasi Android untuk Pemula',
        color: Colors.white,
        link: dicodingPemulaLink,
        desc: ''),
    PortofolioModel(
        image: 'assets/portofolio/dicoding.png',
        title: 'Belajar Fundamental Aplikasi Android',
        color: Colors.white,
        link: dicodingFundamentalLink,
        desc: ''),
    PortofolioModel(
        image: 'assets/portofolio/sentragro.png',
        title: 'Sentragro Kios',
        desc: 'Aplikasi PoS dalam bidang pertanian'),
    PortofolioModel(
        image: 'assets/portofolio/catering.png',
        title: 'Pramusaji Catering',
        desc: ''),
    PortofolioModel(
        image: 'assets/portofolio/sinoman.png',
        title: 'Pramusaji Sinoman',
        desc: '')
  ];

  // TODO: link portofolio yang belum
  List<Widget> _pages(double conSize, int maxLength) {
    if (_portofolio.length < maxLength) {
      for (var i = 0; i < maxLength; i++) {
        _portofolio.add(PortofolioModel(
            title: 'Mau Jadi Client Kami?', image: 'assets/images/logo.png'));
        if (_portofolio.length == maxLength) break;
      }
    }

    return List<Widget>.generate((_portofolio.length / maxLength).ceil(), (i) {
      var lastIndex = (maxLength * (i + 1));
      var list = _portofolio
          .getRange(maxLength * i,
              lastIndex > _portofolio.length ? _portofolio.length : lastIndex)
          .toList();

      return Wrap(
        alignment: WrapAlignment.spaceEvenly,
        crossAxisAlignment: WrapCrossAlignment.end,
        children: List<Widget>.generate(
            list.length,
            (index) => Container(
                  margin: EdgeInsets.fromLTRB(16, 0, 16, 16),
                  width: conSize,
                  height: conSize,
                  color: Theme.of(context).primaryColorLight,
                  child: InkWell(
                    onTap: () {},
                    mouseCursor: MouseCursor.uncontrolled,
                    onHover: (v) {
                      setState(() {
                        list[index].isHover = v;
                      });
                    },
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Container(
                          color: Theme.of(context).primaryColorLight,
                          padding: const EdgeInsets.all(32),
                          child: Image.asset(
                            list[index].image,
                            color: list[index].color,
                          ),
                        ),
                        AnimatedOpacity(
                          duration: Duration(milliseconds: 500),
                          curve: Curves.decelerate,
                          opacity: list[index].isHover ? 1 : 0,
                          child: Container(
                              padding: const EdgeInsets.all(28),
                              color: Theme.of(context)
                                  .primaryColor
                                  .withOpacity(0.9),
                              child: Center(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      list[index].title,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.white70,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20),
                                      child: InkWell(
                                        onTap: () async {
                                          if (list[index].link.isNotEmpty) {
                                            await launch(list[index].link);
                                          }
                                        },
                                        child: Container(
                                          width: 48,
                                          height: 48,
                                          margin: EdgeInsets.only(left: 8),
                                          decoration: BoxDecoration(
                                              color: Colors.white70,
                                              shape: BoxShape.circle),
                                          child: Icon(
                                            FontAwesomeIcons.link,
                                            color: Theme.of(context)
                                                .primaryColorDark,
                                            size: 20,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              )),
                        )
                      ],
                    ),
                  ),
                )),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, cons) {
      return Container(
        color: Theme.of(context).primaryColorDark,
        child: Row(
          children: [
            Container(
              width: 120,
              color: Colors.white.withOpacity(0.02),
              height: double.infinity,
              padding: EdgeInsets.only(bottom: 60),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: RotatedBox(
                  quarterTurns: -45,
                  child: Text(
                    'PORTOFOLIO',
                    style: TextStyle(
                        color: fontColor,
                        fontSize: 60,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 20, right: 20, bottom: 40),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          InkWell(
                            onTap: _pageIndex > 0
                                ? () {
                                    _pageController.animateToPage(
                                        _pageIndex - 1,
                                        curve: Curves.easeIn,
                                        duration: Duration(milliseconds: 800));
                                  }
                                : null,
                            child: Container(
                              width: 50,
                              height: 50,
                              margin: EdgeInsets.only(right: 8),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: _pageIndex > 0
                                      ? null
                                      : Border.all(color: Colors.white),
                                  color: _pageIndex > 0
                                      ? Theme.of(context).accentColor
                                      : null),
                              child: Center(
                                  child: Icon(
                                Icons.chevron_left_sharp,
                                color: Colors.white,
                                size: 38,
                              )),
                            ),
                          ),
                          InkWell(
                            onTap: _pageIndex + 1 < _pageCount
                                ? () {
                                    _pageController.animateToPage(
                                        _pageIndex + 1,
                                        curve: Curves.easeOutQuad,
                                        duration: Duration(milliseconds: 1200));
                                  }
                                : null,
                            child: Container(
                              width: 50,
                              height: 50,
                              margin: EdgeInsets.only(left: 8),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: _pageIndex + 1 < _pageCount
                                      ? null
                                      : Border.all(color: Colors.white),
                                  color: _pageIndex + 1 < _pageCount
                                      ? Theme.of(context).accentColor
                                      : null),
                              child: Center(
                                  child: Icon(
                                Icons.chevron_right_sharp,
                                color: Colors.white,
                                size: 38,
                              )),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Builder(builder: (context) {
                    double conSize =
                        (cons.maxWidth - 160) / ((cons.maxWidth - 160) / 300);
                    if (conSize > 300) {
                      conSize = 300;
                    }
                    if (conSize < 260) {
                      conSize = 260;
                    }

                    final maxLength = ((cons.maxWidth - 160) ~/ conSize) *
                        ((cons.maxHeight - 120) ~/ conSize);

                    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                      setState(() {
                        _pageCount = (_portofolio.length / maxLength).ceil();
                      });
                    });

                    return Expanded(
                      child: PageView.builder(
                        controller: _pageController,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: _pageCount,
                        onPageChanged: (i) {
                          setState(() {
                            _pageIndex = i;
                          });
                        },
                        itemBuilder: (context, index) {
                          return _pages(conSize, maxLength)[index];
                        },
                      ),
                    );
                  })
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
