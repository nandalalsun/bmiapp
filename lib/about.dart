import 'dart:ui';
import 'package:flutter/material.dart';
import 'image.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About this app"),
      ),
      body: Container(
            child: ListView(
              children: <Widget>[
                ListTile(
                  title: Text("Image taken from Google"),
                  leading: Icon(Icons.info),
                  onTap: () {},
                  subtitle: Text("on 24th April 2020"),
                ),
                ListTile(
                  title: 
                  BmiBaby(),
                ),
              ],
            ),
            decoration: BoxDecoration(
              gradient: linearGradient(),
              borderRadius: BorderRadiusDirectional.all(Radius.circular(30.0)),
            ),
          ),
    );
  }
}

LinearGradient linearGradient() {
  return LinearGradient(
    colors: [Colors.pink, Colors.blueAccent],
    begin: const FractionalOffset(0.0, 0.8),
    end: const FractionalOffset(0.9, 0.0),
    stops: [0.0, 0.5],
    tileMode: TileMode.mirror,
  );
}
