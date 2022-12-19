import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news_api/news_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: news_api());
  }
}

class news_api extends StatefulWidget {
  const news_api({Key? key}) : super(key: key);

  @override
  State<news_api> createState() => _news_apiState();
}

class _news_apiState extends State<news_api> {
  int currentIndex = 0;
  var myUrl =
      "https://newsapi.org/v2/everything?q=tesla&from=2022-11-18&sortBy=publishedAt&apiKey=0adb0e144fad416e9fdfa09bfe85b924";
  var mykey = '0adb0e144fad416e9fdfa09bfe85b924';
  var searchController = TextEditingController();
  late Future<news_model> news;

  @override
  void initState() {
    super.initState();
    news = getNews('apple');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 68),
          Padding(
            padding: EdgeInsetsDirectional.only(start: 8, end: 8),
            child: TextField(
              decoration: InputDecoration(
                  suffixIcon: Icon(Icons.search),
                  hintText: 'Topic , media or journalist',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(21))),
            ),
          ),
          SizedBox(height: 13),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.only(start: 9),
                  child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        'Top hits',
                        style: TextStyle(fontSize: 18),
                      )),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.only(start: 9),
                  child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        'Yesterday',
                        style: TextStyle(fontSize: 18),
                      )),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.only(start: 9),
                  child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        'Last week',
                        style: TextStyle(fontSize: 18),
                      )),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.only(start: 9, end: 10),
                  child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        'Last month',
                        style: TextStyle(fontSize: 18),
                      )),
                ),
              ],
            ),
          ),
          FutureBuilder<news_model>(
            future: news,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: Column(children: [
                        Container(
                          child: Text('${snapshot.data!.articles![0].title}'),
                        )
                      ]),
                    );
                  },
                );
              } else if (snapshot.hasError) {
                print('${snapshot.hasError}');
              }
              return CircularProgressIndicator();
            },
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.grey.shade100,
        iconSize: 28,
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.purple,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.save_alt),
            label: 'save',
          ),
          BottomNavigationBarItem(
            icon: InkWell(
                onTap: () {
                  /*Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => category(),
                      ));*/
                },
                child: Icon(Icons.line_weight_sharp)),
            label: 'category',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              label: 'profile',
              backgroundColor: Colors.grey.shade200),
        ],
      ),
    );
  }

  Future<news_model> getNews(String mysearch) async {
    var response =
        await http.get(Uri.parse(myUrl), headers: {'Authorization': mykey});
    late news_model model = news_model();
    if (response.statusCode == 200) {
      var News = jsonDecode(response.body);
      return news_model.fromJson(News);
    } else {
      showDialog(
          context: context,
          builder: (BuildContext Context) {
            return AlertDialog(
              title: Text('Can`t fatch news'),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('OK'))
              ],
            );
          });
      return news_model();
    }
  }
}
