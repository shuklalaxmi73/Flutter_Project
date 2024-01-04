import 'package:aeroplane/screens/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FlightAnimationHomePage(),
    );
  }
}

class FlightAnimationHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        backgroundColor: Color(0xFF87CEEB),// Set the background color to sky blue
      body: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => BottomBar())
            );
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset(
                'assets/images/flight_animation3.json', // Replace with your Lottie animation file
                width:200,
                height: 200,
                repeat: true, // Set to true for looped animation
                reverse: false, // Set to true for reverse animation
              ),
              SizedBox(height: 20),
              Text(
                "Let's Dive in !",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color(0xD91130CE), // Set the text color to royal blue
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

