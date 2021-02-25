import 'package:flutter/material.dart';
import 'package:flutter_news_app/views/home.dart';

import 'views/splash.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter News App',
      theme: ThemeData.dark(),
      home: SplashScreen(),
    );
  }
}
