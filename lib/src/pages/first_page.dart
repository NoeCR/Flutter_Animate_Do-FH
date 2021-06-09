import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'navigation_page.dart';
import 'twitter_page.dart';

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: FadeIn(
          duration: Duration(milliseconds: 500),
          child: Text('Animate Do'),
        ),
        actions: [
          SlideInRight(
            delay: Duration(milliseconds: 500),
            from: 50,
            child: IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => TwitterPage()));
              },
              icon: FaIcon(
                FontAwesomeIcons.twitter,
              ),
            ),
          ),
          SlideInLeft(
            delay: Duration(milliseconds: 500),
            from: 50,
            child: IconButton(
              onPressed: () {
                Navigator.push(context, CupertinoPageRoute(builder: (context) => FirstPage()));
              },
              icon: Icon(
                Icons.navigation,
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: ElasticInRight(
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => NavigationPage()));
          },
          child: FaIcon(
            FontAwesomeIcons.play,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElasticIn(
              delay: Duration(milliseconds: 1500),
              child: Icon(
                Icons.new_releases,
                color: Colors.blue,
                size: 40,
              ),
            ),
            FadeInDown(
              delay: Duration(milliseconds: 200),
              child: Text(
                'Title',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            FadeInDown(
              delay: Duration(milliseconds: 800),
              child: Text(
                'Subtitle APP',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            FadeInLeft(
              delay: Duration(milliseconds: 1100),
              child: Container(
                width: 220,
                height: 2,
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
