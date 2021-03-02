import 'package:flutter/material.dart';
import 'package:flutter_web/constans.dart';

class ProfileModel {
  final String title;
  final String content;

  ProfileModel({this.title, this.content});
}

class Profile extends StatelessWidget {
  final profile = [
    ProfileModel(title: 'Name', content: 'Luthfi Khoirul Anwar'),
    ProfileModel(title: 'Birth', content: 'Sukoharjo, 29 Juli 1998'),
    ProfileModel(title: 'Address', content: 'Sukoharjo Jawa Tengah'),
    ProfileModel(title: 'Wa', content: nomorTelp),
    ProfileModel(title: 'Email', content: email)
  ];

  Widget _imageContainer(BuildContext context, BoxConstraints cons) {
    return Container(
      color: Theme.of(context).primaryColor,
      constraints: BoxConstraints(
          maxWidth: cons.maxWidth * 0.35, maxHeight: cons.maxWidth * 0.35),
      height: 600,
      width: 600,
      padding: EdgeInsets.all(48),
      child: Image.asset(profileImg),
    );
  }

  Widget _profileContainer(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Personal Info',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w500, fontSize: 60),
        ),
        Container(
          margin: EdgeInsets.only(bottom: 46),
          width: 320,
          height: 4,
          decoration: BoxDecoration(
            color: Theme.of(context).accentColor,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        Column(
          children: List<Widget>.generate(
              profile.length,
              (index) => Container(
                    padding: EdgeInsets.only(bottom: 16),
                    width: 600,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 120,
                          child: Text(
                            "${profile[index].title}",
                            style: TextStyle(color: fontColor, fontSize: 24),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            ": ${profile[index].content}",
                            maxLines: 2,
                            style: TextStyle(color: fontColor, fontSize: 24),
                          ),
                        ),
                      ],
                    ),
                  )),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, cons) {
      return Container(
        color: Theme.of(context).primaryColorDark,
        child: Center(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                      'ABOUT ME',
                      style: TextStyle(
                          color: fontColor,
                          fontSize: 60,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Center(child: _imageContainer(context, cons)),
              ),
              Expanded(
                child: Center(child: _profileContainer(context)),
              )
            ],
          ),
        ),
      );
    });
  }
}
