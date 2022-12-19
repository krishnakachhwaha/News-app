import 'package:flutter/material.dart';

class category extends StatefulWidget {
  const category({Key? key}) : super(key: key);

  @override
  State<category> createState() => _categoryState();
}

class _categoryState extends State<category> {
  var arrNames = [
    "India",
    "Business",
    "Startups",
    "Technology",
    "Politics",
    "Entertainment",
    "Sports",
    "International",
    "Health",
    "Automobile",
    "Travel",
    "Fashion",
    "Education"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 62),
          Container(
            width: 400,
            height: 60,
            color: Colors.purple.shade100,
            child: Row(
              children: [
                BackButton(),
                SizedBox(width: 87),
                Text(
                  'Categories',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ),
          /*Expanded(
            flex: 1,
            child: GridView.builder(
              itemCount: arrNames.length,
              itemBuilder: (context, index) => Column(
                children: [
                  Container(
                    color: Colors.black,
                    width: 200,
                    height: 500,
                    child: Text("${arrNames[index]}"),
                  ),
                ],
              ),
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 20),
            ),
          )*/

          Expanded(
            flex: 2,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: arrNames.length,
                itemBuilder: (context, index) => Column(
                      children: [
                        Card(
                          shadowColor: Colors.purple.shade700,
                          elevation: 7,
                          child: Container(
                            width: 90,
                            height: 90,
                            child: Text("${arrNames[index]}"),
                          ),
                        )
                      ],
                    )),
          ),
        ],
      ),
    );
  }
}
