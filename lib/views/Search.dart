import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news_app/helpers/news_api.dart';
import 'package:flutter_news_app/models/article_model.dart';
import 'package:flutter_news_app/widgets/news_tile.dart';


class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  Future<List<ArticleModel>> futureAuthors;
  List<ArticleModel> listAuthors;
  List<ArticleModel> searchResult;
  Future loadData() async {
    futureAuthors = NewsApi.getNews().then((value) {
      setState(() {
        listAuthors = value;
        //print(listAuthors);
      });
      return listAuthors;
    });
  }

  @override
  void initState() {
    super.initState();
    loadData();
  }
 bool search = false;
  void _filterAuthors(value) {
    List<ArticleModel> result = searchResult
        .where((element) =>
        element.title.toLowerCase().contains(value.toString().toLowerCase()))
        .toList();
    //print(result.where((i) => i.name.startsWith(value)).toList());
    setState(() {
      listAuthors = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('My'),
            Text(
              'Search',
              style: TextStyle(color: Colors.blue),
            )
          ],
        ),
        elevation: 0,
      ),

      body: Container(
        color: Theme.of(context).primaryColor,
        child: FutureBuilder<List<ArticleModel>>(
            future: futureAuthors,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                //listAuthors = snapshot.data;
                searchResult = snapshot.data;
                //print(searchResult);
                return Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: TextField(
                        //style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.search,color: Colors.white,),
                          hintText: 'Search',
                          hintStyle:  TextStyle(
                              fontSize: 20.0, color: Colors.grey),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white, width:0.0),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white, width:0.0),
                          ),
                          border: OutlineInputBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(25))),),
                        onChanged: (value) {
                          search = true;
                          _filterAuthors(value);
                        },
                      ),
                    ),
                   if (search == true)
                     Expanded(
                       child: ListView.builder(
                           scrollDirection: Axis.vertical,
                           itemCount: listAuthors.length,
                           itemBuilder: (context, index) {
                             return NewsTile(
                               title: listAuthors[index].title,
                               description: listAuthors[index].description,
                               imageUrl:listAuthors[index].imageUrl,
                               newsUrl: listAuthors[index].url,
                               time: listAuthors[index].publishedAt,
                             );
                           }),
                     ),
                  ],
                );
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            }),
      ),
    );
  }
}
