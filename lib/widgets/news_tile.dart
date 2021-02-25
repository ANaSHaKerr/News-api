import 'package:flutter/material.dart';
import 'package:flutter_news_app/views/article_view.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class NewsTile extends StatelessWidget {
  final String title;
  final String description;
  final String imageUrl;
  final String newsUrl;
  final DateTime time;

  NewsTile(
      {@required this.title,
      @required this.description,
      @required this.imageUrl,
      @required this.newsUrl,
      @required this.time});

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting();
    final hours = DateTime.now().difference(time).inHours;
    String hoursStr;
    if (hours == 1)
      hoursStr = 'منذ ساعة';
    else if (hours == 2)
      hoursStr = 'منذ ساعتين';
    else
      hoursStr = hours < 11 ? 'منذ $hours ساعات' : 'منذ $hours ساعة';
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (ctx) => ArticleView(newsUrl)));
        },
        child: Card(
          elevation: 10,
          child: Container(
            margin: EdgeInsets.all(16),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom:4.0),
                  child: Container(
                    alignment: Alignment.topRight,
                    child: Text(
                      hoursStr,
                      style: TextStyle(color: Colors.white70, fontSize: 16),
                    ),
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    title,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    textAlign: TextAlign.end,
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  description,
                  textAlign: TextAlign.end,
                  style: TextStyle(color: Colors.grey),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
