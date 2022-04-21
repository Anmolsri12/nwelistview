import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map _countries =  Map();

  void _getData() async {
    var url = 'http://country.io/names.json';
    

          var response = await http.get(Uri.parse('http://country.io/names.json'));



    if(response.statusCode == 200) {
      setState(() => _countries = json.decode(response.body));
      print('Loaded ${_countries.length} countries');
    } else {
      print("Status code: ${response.statusCode}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("listView", style: TextStyle(color: Colors.red),)
      ),
      body: Card( 
              child: Center(
        child:Column(
          children: [Text('Countries', style: new TextStyle(fontWeight: FontWeight.bold),),
          Expanded(child: ListView.builder(
                itemCount: _countries.length,
                itemBuilder: (BuildContext context, int index){
                  String key = _countries.keys.elementAt(index);
                  return  Row(
                    children: <Widget>[
                      Text('${key} : '),
                      Text(_countries[key]),
          ],
        );
         },
          ))
          ]

        ),
        )
        ),
    );
                }
  
    @override
  void initState() {
    _getData();
  }
}