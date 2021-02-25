
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:animated_rail/index.dart';
import 'package:flutter/services.dart';
import 'package:flutter_news_app/views/Category.dart';
import 'package:flutter_news_app/views/Search.dart';
import 'package:flutter_news_app/views/home.dart';


class Rail extends StatefulWidget {

  @override
  _RailState createState() => _RailState();
}

class _RailState extends State<Rail> {


  @override
  Widget build(BuildContext context) {

    return WillPopScope(
      onWillPop: () {
        return AwesomeDialog(
          context: context,
          headerAnimationLoop: false,
          dialogType: DialogType.ERROR,
          animType: AnimType.BOTTOMSLIDE,
          body: ListTile(
            title: Padding(
              padding: const EdgeInsets.only(bottom: 15.0),
              child: Text(
                "Close the app",
                textAlign: TextAlign.center,
              ),
            ),
            subtitle: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FlatButton(
                  color: Colors.green,
                  child: Text("yes"),
                  onPressed: () {
                    SystemNavigator.pop();
                  },
                ),
                FlatButton(
                  color: Colors.red,
                  child: Text("No"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            ),
          ),
        ).show();
      },
      child: Center(
            child: AnimatedRail(
              activeColor: Colors.white,
              background: Colors.grey[900],
              maxWidth: 275,
              width: 90,
              iconBackground: Colors.transparent,
              items: [
                RailItem(
                    icon: Icon(Icons.home),
                    screen: Container(
                      child: Home(),
                    ),
                    label: "Home"),
                RailItem(
                    icon: Icon(Icons.category),
                    label: 'Category',
                    screen: Container(
                      child: Category(),
                    ),),
                RailItem(
                    icon: Icon(Icons.search),
                    label: "Search",
                    screen: Container(
                    child: Search(),
                    ),),

              ],
            )),
    );
  }
}