// ignore_for_file: deprecated_member_use

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:simbo_1/pages/signin.dart';
import 'package:simbo_1/utils/global.colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreen();
}

class _SplashScreen extends State<SplashScreen> {

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 5), (){
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => SignIn()));
    });
    return Scaffold(
      backgroundColor: GlobalColors.mainColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 50),
          Align(
            alignment: Alignment.center,
            child: Image.asset(
              'assets/homepage/logo_simbo_slim.png',
              height: 150,
              width: 150,
            ),
          ),

          const SizedBox(height: 300),

          Container(
            padding: EdgeInsets.all(32),
            child: new LinearPercentIndicator(
              width: MediaQuery.of(context).size.width - 100,
              animation: true,
              lineHeight: 10.0,
              animationDuration: 4000,
              percent: 1,
              linearStrokeCap: LinearStrokeCap.roundAll,
              progressColor: Colors.white,
            ),
          ),

          const SizedBox(height: 10),

          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Made in Ivory Coast',
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.white,
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

