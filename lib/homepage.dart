import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';
import 'image.dart';
import 'about.dart';
//import 'package:gender_selector/gender_selector.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final genderT = new TextEditingController();
  TextEditingController heightT = new TextEditingController();
  TextEditingController weightT = TextEditingController();
  final formValidate = GlobalKey<FormState>();

  var bmi = 0.0;
  int age, weight, height;
  double idleWeight = 0.0;
  String msg, gender, suggest;
  Color sug;

  void bmia() {
    setState(() {
      weight = int.parse(weightT.text);
      height = int.parse(heightT.text);
      gender = genderT.text;

      if (80 <= height) {
        double heightCm = height / 100;
        bmi = weight / (heightCm * heightCm);

        message(bmi);
        idleweight(heightCm, gender);
      } else {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("Illegal Value !"),
                content: Text("Please input weight in KG and height in 'cm' "),
                actions: <Widget>[
                  FlatButton(
                      child: Text("Close"),
                      onPressed: () {
                        Navigator.pop(context);
                      }),
                ],
              );
            });
      }
    });
  }

  void message(double bmi) {
    if (bmi < 15) {
      msg = "Hello, You are very severly underweight";
    } else if (15 < bmi && bmi < 16) {
      msg = "Hello, You are severly underweight";
    } else if (16 < bmi && bmi < 18.5) {
      msg = "Hello, You are underweight";
    } else if (18.5 < bmi && 25 > bmi) {
      msg = "Good, Your health is perfect";
    } else if (25 < bmi && 30 > bmi) {
      msg = "Hello, please do regular excercise, your weight is slight over";
    } else if (30 < bmi && 35 > bmi) {
      msg = "You are moderately obese";
    } else if (35 < bmi && 40 > bmi) {
      msg = "You are Severely obese!";
    } else {
      msg = "Hey! You are very severely obese";
    }
  }

  void idleweight(double height, String gender) {
    if (gender == "M" || gender == "m") {
      idleWeight = 52 + 1.9 * (height * 39.3701 - 60);
    } else if (gender == "F" || gender == "f") {
      idleWeight = 49 + 1.7 * (height * 39.3701 - 60);
    } else {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Check gender correctly"),
              content: Text("It would result incorrect idle weight.."),
              actions: <Widget>[
                FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("Retry"),
                )
              ],
            );
          });
    }

    if (idleWeight < weight) {
      suggest =
          "Better to decrease weight by ${weight - idleWeight.round()} KG";
      sug = Colors.red;
    } else {
      suggest =
          "Better to increase weight by ${idleWeight.round() - weight} KG";
      sug = Colors.green;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Calculator"),
      ),
      body: Form(
        key: formValidate,
        child: ListView(
          children: <Widget>[
            ImagesBmi(),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: genderT,
                keyboardType: TextInputType.text,
                maxLength: 1,
                textCapitalization: TextCapitalization.words,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                  ),
                  hintText: "F",
                  labelStyle: TextStyle(
                    fontSize: 18.0,
                  ),
                  helperText: "Type F or M",
                  helperStyle: TextStyle(color: Colors.redAccent),
                  suffixIcon: Icon(Icons.person),
                  labelText: "Gender",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: weightT,
                keyboardType: TextInputType.number,
                autofocus: false,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                  ),
                  //hintText: "Enter Age",
                  helperText: "Weight in KG",
                  helperStyle: TextStyle(color: Colors.redAccent),
                  suffixIcon: Icon(Icons.person),
                  labelText: "Weignt",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: heightT,
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                  ),
                  //hintText: "Enter Age",
                  helperText: "Height in centimeter",
                  helperStyle: TextStyle(
                    color: Colors.redAccent,
                  ),
                  suffixIcon: Icon(Icons.arrow_upward),
                  labelText: "Height",
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: RaisedButton(
                child: Text(
                  "Calculate",
                  style: TextStyle(color: Colors.white),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                onPressed: () {
                  setState(() {
                    bmia();
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Card(
                elevation: 20.0,
                color: Colors.black12,
                child: Container(
                  padding: EdgeInsets.all(8.0),
                  height: 250.0,
                  child: ListView(
                    children: <Widget>[
                      Text(
                        "Gender: $gender  Weight:$weight Kg, Height: $height cm",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Divider(),
                      Text(
                        "BMI: ${bmi.roundToDouble()}\n$msg\nYour Idle weight is: ${idleWeight.roundToDouble()}",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                        ),
                      ),
                      Text(
                        "$suggest",
                        style: TextStyle(
                          color: sug,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      drawer: Drawer(
        elevation: 12.0,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Image(
                image: AssetImage("images/lady_run.png"),
              ),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text("About BMI"),
              //subtitle: Text("Here is subtitle"),
              leading: Icon(Icons.info_outline),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return AboutPage();
                    },
                  ),
                );
              },
            ),
            ListTile(
              title: Text("Share"),
              leading: Icon(Icons.share),
              onTap: () {
                Share.share('To friends..');
              },
            ),
            ListTile(
              title: Text("Rate"),
              leading: Icon(Icons.star_border),
              onTap: () async {
                  const tel = 'https://play.google.com/store/apps/details?id=np.suniltimilsina.bmicalc';
                  if (await canLaunch(tel)) {
                    await launch(tel);
                  } else {
                    showDialog(
                    context: context,
                    builder: (BuildContext context){
                      return AlertDialog(
                        title: Text("Error!!"),
                        content: Text("Something Unexpected Happens"),
                        actions: <Widget>[
                          FlatButton(
                            child: Text("Close"),
                            onPressed: (){
                              Navigator.of(context).pop();
                          },
                          ), 
                        ],
                      );
                    }
                    );
                  }
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.delete),
        onPressed: () {
          genderT.clear();
          weightT.clear();
          heightT.clear();
          setState(() {
            bmi = 0.0;
            msg = "";
            idleWeight = 0.0;
            suggest = "";
          });
        },
      ),
    );
  }
}
