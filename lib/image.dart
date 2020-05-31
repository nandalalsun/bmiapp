import 'package:bmi_app/about.dart';
import 'package:flutter/material.dart';
import 'about.dart';

class ImagesBmi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // AssetImage bmi = AssetImage("images/bmi.jpg");
    // Image image = Image(image: bmi, width: 100.0,);
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Center(
            child: CircleAvatar( 
          radius: 50.0,
          backgroundImage: ExactAssetImage("images/bmi.jpg", scale: 50.0),
          
          ),
      ),
    );
  }
}
class BmiBaby extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image(image: AssetImage("images/bmi_newbaby.jpeg")),
      decoration: BoxDecoration(
        gradient: linearGradient(),
        borderRadius: BorderRadius.all(Radius.circular(30.0)),
      ),
    );
  }
}

