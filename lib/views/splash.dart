
import 'package:flutter/material.dart';
import 'package:flutter_news_app/widgets/Rail.dart';

import 'home.dart';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  Animation<double> opacity;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: Duration(milliseconds: 2500), vsync: this);
    opacity = Tween<double>(begin: 1.0, end: 0.0).animate(controller)
      ..addListener(() {
        setState(() {});
      });
    controller.forward().then((_) {
      navigationPage();
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void navigationPage() async {
    // 5s over, navigate to a new page
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Rail()));
  }

  Widget build(BuildContext context) {
    return  Scaffold(
        backgroundColor: Color(0xffF2FBF9),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Opacity(
                  opacity: opacity.value,
                  child: new Image.asset(
                    'assets/logo.png',
                    height: 100,
                    width: 100,
                  ),
                ),
              ),
            ),
            Opacity(
              opacity: opacity.value,
              child: Text("MyNews",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),),
            )
          ],
        ),
      );
  }
}