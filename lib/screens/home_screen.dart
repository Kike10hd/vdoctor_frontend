import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vdoctor_frontend/utils/const.dart';
import 'package:vdoctor_frontend/widgets/card_items.dart';
import 'package:vdoctor_frontend/widgets/card_main.dart';
import 'package:vdoctor_frontend/widgets/card_section.dart';
import 'package:vdoctor_frontend/widgets/custom_clipper.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;

    return Scaffold(
      backgroundColor: Constants.backgroundColor,
      body: Stack(
        children: <Widget>[
          ClipPath(
            clipper: MyCustomClipper(clipType: ClipType.bottom),
            child: Container(
              color: Theme.of(context).accentColor,
              height: Constants.headerHeight + statusBarHeight,
            ),
          ),
          Positioned(
            right: -45,
            top: -30,
            child: ClipOval(
              child: Container(
                color: Colors.black.withOpacity(0.05),
                height: 220,
                width: 220,
              ),
            ),
          ),

          // BODY
          Padding(
            padding: EdgeInsets.all(Constants.paddingSide),
            child: ListView(
              children: <Widget>[
                // Header - Greetings and Avatar
                Row(
                  children: const <Widget>[
                    Expanded(
                      child: Text(
                        "Good Morning,\nPatient",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.w900, color: Colors.white),
                      ),
                    ),
                    CircleAvatar(radius: 26.0, backgroundImage: AssetImage('assets/img/user.png'))
                  ],
                ),

                const SizedBox(height: 50),

                // Main Cards - Heartbeat and Blood Pressure
                Container(
                  height: 140,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      CardMain(
                        image: AssetImage('assets/img/cardiogram.png'),
                        title: "Diagnostic",
                        value: "Med",
                        unit: "",
                        color: Constants.lightGreen,
                      ),
                      CardMain(
                          image: AssetImage('assets/img/blood.png'),
                          title: "Blood Pressure",
                          value: "66/123",
                          unit: "mmHg",
                          color: Constants.lightYellow)
                    ],
                  ),
                ),

                // Section Cards - Daily Medication
                SizedBox(height: 50),

                Text(
                  "YOUR DAILY MEDICATIONS",
                  style: TextStyle(
                    color: Constants.textPrimary,
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 20),

                Container(
                    height: 125,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        CardSection(
                          image: AssetImage('assets/img/pills.png'),
                          title: "Metforminv",
                          value: "2",
                          unit: "pills",
                          time: "6-7AM",
                          isDone: false,
                        ),
                        CardSection(
                          image: AssetImage('assets/img/injection.png'),
                          title: "Trulicity",
                          value: "1",
                          unit: "shot",
                          time: "8-9AM",
                          isDone: true,
                        )
                      ],
                    )),

                SizedBox(height: 50),

                // Scheduled Activities
                Text(
                  "SCHEDULED ACTIVITIES",
                  style: TextStyle(
                      color: Constants.textPrimary, fontSize: 13, fontWeight: FontWeight.bold),
                ),

                SizedBox(height: 20),

                Container(
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: <Widget>[
                      CardItems(
                        image: Image.asset(
                          'assets/img/walking.png',
                        ),
                        title: "Walking",
                        value: "750",
                        unit: "steps",
                        color: Constants.lightYellow,
                        progress: 30,
                      ),
                      CardItems(
                        image: Image.asset(
                          'assets/img/bike.png',
                        ),
                        title: "Biking",
                        value: "30",
                        unit: "mins",
                        color: Constants.lightBlue,
                        progress: 0,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
