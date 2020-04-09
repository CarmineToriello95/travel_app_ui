import 'package:flutter/material.dart';

class CustomDrawer extends StatefulWidget {
  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 24.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ContinentsItem(
                  text: 'Africa',
                ),
                SizedBox(
                  height: 16.0,
                ),
                ContinentsItem(
                  text: 'America',
                ),
                SizedBox(
                  height: 16.0,
                ),
                ContinentsItem(
                  text: 'Asia',
                ),
                SizedBox(
                  height: 16.0,
                ),
                ContinentsItem(
                  text: 'Europe',
                  color: Colors.orange[700],
                ),
                SizedBox(
                  height: 16.0,
                ),
                ContinentsItem(
                  text: 'Australia',
                ),
              ],
            ),
            SizedBox(
              height: 24.0,
            ),
            Divider(
              color: Colors.orange[700],
              indent: 130.0,
              endIndent: 70.0,
            ),
            SizedBox(
              height: 24.0,
            ),
            Column(
              children: <Widget>[
                InfoItem(
                  text: 'About',
                ),
                SizedBox(
                  height: 10.0,
                ),
                InfoItem(
                  text: 'Support',
                ),
                SizedBox(
                  height: 10.0,
                ),
                InfoItem(
                  text: 'Terms',
                ),
                SizedBox(
                  height: 10.0,
                ),
                InfoItem(
                  text: 'Faqs',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ContinentsItem extends StatelessWidget {
  final String text;
  final Color color;
  ContinentsItem({this.text, this.color = Colors.white70});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.left,
      style: TextStyle(
        color: color,
        fontWeight: FontWeight.bold,
        fontSize: 24.0,
      ),
    );
  }
}

class InfoItem extends StatelessWidget {
  final String text;

  InfoItem({this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.0,
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white70,
          fontWeight: FontWeight.bold,
          fontSize: 18.0,
        ),
      ),
    );
  }
}
