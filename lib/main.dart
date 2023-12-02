import 'dart:convert';

import 'package:api4/exe1/Like.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MaterialApp(
    home: appio(),debugShowCheckedModeBanner: false,
  ));
}

class appio extends StatefulWidget {
  const appio({super.key});

  @override
  State<appio> createState() => _appioState();
}

List<Like> kite = [];

class _appioState extends State<appio> {
  Future<List<Like>> peo() async {
    final window =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
    final relate = jsonDecode(window.body);
    if (window.statusCode == 200) {
      for (Map i in relate) {
        kite.add(Like.fromJson(i));
      }
      return kite;
    } else {
      return kite;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: peo(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          return ListView.builder(itemCount: kite.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 200,
                  width: 100,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.red,),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(children: [
                      Align(
                          alignment: Alignment.topLeft,
                          child: Text("ID:" + kite[index].id.toString())),
                      Align(
                          alignment: Alignment.topLeft,
                          child: Text("Name:" + kite[index].name.toString())),
                      Align(
                          alignment: Alignment.topLeft,
                          child: Text("Address - ")),
                      Align(
                          alignment: Alignment.topLeft,
                          child: Text("Street:" + kite[index].address!.street.toString())),
                      Align(
                          alignment: Alignment.topLeft,
                          child: Text("Zipcode:" + kite[index].address!.zipcode.toString())),
                      Align(
                          alignment: Alignment.topLeft,
                          child: Text("Suite:" + kite[index].address!.suite.toString())),
                      Align(
                          alignment: Alignment.topLeft,
                          child: Text("City:" + kite[index].address!.city.toString())),
                      Align(
                          alignment: Alignment.topLeft,
                          child: Text("Lat:" + kite[index].address!.geo!.lat.toString())),
                      Align(
                          alignment: Alignment.topLeft,
                          child: Text("Lng:" + kite[index].address!.geo!.lng.toString())),
                    ]),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
