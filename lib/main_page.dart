import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tridimensional_drawer/tridimensional_drawer.dart';
import 'dart:math';

import 'presentation/my_flutter_app_icons.dart';

class MainPage extends StatefulWidget {
  final TridimensionalDrawerController controller;
  MainPage(this.controller);
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  static const options = ['Experiences', 'Places', 'Housings'];
  int optionSelectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        child: Transform.rotate(
          angle: pi / 4,
          child: Icon(
            Icons.navigation,
            color: Colors.orange[700],
          ),
        ),
        onPressed: () {},
      ),
      bottomNavigationBar: _buildBottomAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              _buildHeader(),
              SizedBox(
                height: 18.0,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Discover',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
                ),
              ),
              SizedBox(
                height: 18.0,
              ),
              _buildOptionsList(),
              SizedBox(
                height: 18.0,
              ),
              Container(
                height: 240.0,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    ExperienceItem(
                      imagePath: 'assets/images/kayaking.jpg',
                      description: 'Kayaking at the village Gudvangen',
                      location: 'Norway',
                    ),
                    ExperienceItem(
                      imagePath: 'assets/images/canyon.jpg',
                      description: 'Breathtaking Antelope Canyon Tour',
                      location: 'Arizona, USA',
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 18.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Adventurous Mood ?',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Show all',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 8.0,
              ),
              Container(
                height: 90.0,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    AdventureItem(
                      label: 'KAYAKING',
                      icon: MyFlutterApp.kayak,
                    ),
                    AdventureItem(
                      label: 'HIKING',
                      icon: MyFlutterApp.hiking,
                    ),
                    AdventureItem(
                      label: 'BALLOONING',
                      icon: MyFlutterApp.hot_air_balloon,
                    ),
                    AdventureItem(
                      label: 'SNORKELING',
                      icon: MyFlutterApp.snorkel,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 18.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Useful Information',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.only(right: 10.0),
                        height: 5,
                        width: 20,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0),
                          color: Colors.orange[700],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(right: 10.0),
                        height: 5,
                        width: 5,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.orange[700],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(right: 10.0),
                        height: 5,
                        width: 5,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.orange[700],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 18.0,
              ),
              Container(
                height: 240.0,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    InformationItem(
                      description: 'Preparation',
                      imagePath: 'assets/images/preparation.jpg',
                    ),
                    InformationItem(
                      description: 'Documents',
                      imagePath: 'assets/images/documents.jpg',
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Container _buildOptionsList() {
    return Container(
      height: 40.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: options.length,
        itemBuilder: (_, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                optionSelectedIndex = index;
              });
            },
            child: OptionItem(
              text: options[index],
              isSelected: index == optionSelectedIndex,
            ),
          );
        },
      ),
    );
  }

  Row _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        GestureDetector(
          child: Icon(Icons.menu),
          onTap: () {
            widget.controller.open();
          },
        ),
        Container(
          height: 30.0,
          width: 30.0,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(7.0),
            child: Image.asset(
              'assets/images/avatar.png',
            ),
          ),
        ),
      ],
    );
  }

  Container _buildBottomAppBar() {
    return Container(
      height: 50.0,
      child: BottomAppBar(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              iconSize: 32.0,
              onPressed: () {},
              icon: Icon(Icons.home, color: Colors.orange[700]),
            ),
            NotificationBadge(),
            IconButton(
              padding: EdgeInsets.only(left: 40.0),
              onPressed: () {},
              icon: Icon(FontAwesomeIcons.solidBookmark, color: Colors.grey),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(FontAwesomeIcons.userAlt, color: Colors.grey),
            ),
          ],
        ),
        color: Colors.white,
      ),
    );
  }
}

class OptionItem extends StatelessWidget {
  final String text;
  final bool isSelected;

  OptionItem({this.text, this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      height: 35.0,
      margin: const EdgeInsets.only(right: 32.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            text,
            style: TextStyle(
                color: isSelected ? Colors.orange[700] : Colors.grey,
                fontSize: 16.0,
                fontWeight: FontWeight.bold),
          ),
          Container(
            height: 5,
            width: 5,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isSelected ? Colors.orange[700] : Colors.transparent,
            ),
          ),
        ],
      ),
    );
  }
}

class ExperienceItem extends StatelessWidget {
  final String imagePath;
  final String description;
  final String location;

  ExperienceItem({this.description, this.location, this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 16.0),
      width: 170.0,
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: <Widget>[
          Container(
            height: 240.0,
            width: 170.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  description,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14.0,
                  ),
                ),
                SizedBox(
                  height: 8.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Icon(
                      Icons.location_on,
                      size: 14.0,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 4.0,
                    ),
                    Text(
                      location,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 12.0,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AdventureItem extends StatelessWidget {
  final IconData icon;
  final String label;

  AdventureItem({this.icon, this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 26.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Icon(
            icon,
            color: Colors.orange[700],
            size: 40.0,
          ),
          Text(
            label,
            style: TextStyle(color: Colors.grey, fontSize: 12.0),
          )
        ],
      ),
    );
  }
}

class NotificationBadge extends StatelessWidget {
  final int feedsCounter;

  NotificationBadge({this.feedsCounter});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.topEnd,
      children: <Widget>[
        Icon(
          FontAwesomeIcons.solidBell,
          color: Colors.grey,
        ),
        Container(
          height: 11.0,
          width: 11.0,
          decoration:
              BoxDecoration(shape: BoxShape.circle, color: Colors.white),
          child: Container(
            margin: const EdgeInsets.all(2.5),
            height: 5.0,
            width: 5.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.orange[700],
            ),
          ),
        )
      ],
    );
  }
}

class InformationItem extends StatelessWidget {
  final String imagePath;
  final String description;

  InformationItem({this.description, this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 16.0),
      width: 170.0,
      child: Stack(
        alignment: AlignmentDirectional.topEnd,
        children: <Widget>[
          Container(
            height: 240.0,
            width: 170.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(
              right: 8.0,
              top: 8.0,
            ),
            height: 30.0,
            width: 80.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.0),
              color: Colors.orange[700],
            ),
            child: Center(
              child: Text(
                description,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10.0,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
