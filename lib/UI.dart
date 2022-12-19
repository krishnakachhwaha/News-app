import 'package:flutter/material.dart';
import 'package:news_api/category.dart';

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
        primarySwatch: Colors.purple,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentIndex = 0;
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
          FutureBuilder(builder: (context, snapshot) => ,)
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
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => category(),
                      ));
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
}
