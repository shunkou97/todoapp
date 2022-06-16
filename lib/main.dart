import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'data_model.dart';

// Future<Album> fetchAlbum() async {
//   var headers = {
//     'Authorization':
//         'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI1ZGRjY2JlYzZiNTVkYTAwMTc1OTcyMmMiLCJpYXQiOjE1NzQ3NTE2ODh9.GPbsl9FLX4VrsGVErodiXypjuz1us4tfD0jwg2_UrzY',
//     'Content-Type': 'application/json'
//   };

// response.headers.addAll(headers);

// if (response.statusCode == 200) {
//   // If the server did return a 200 OK response,
//   // then parse the JSON.
//   return Album.fromJson(jsonDecode(response.body));
// } else {
//   // If the server did not return a 200 OK response,
//   // then throw an exception.
//   throw Exception('Failed to load album');
// }

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

login() async {
  var response = await http.post(
      Uri.parse("https://api-nodejs-todolist.herokuapp.com/user/login"),
      headers: <String, String>{
        'Content-type': 'application/json; charset=UTF-8'
      },
      body: jsonEncode(<String, String>{
        'email': 'muh.nurali43@gmail.com',
        'password': '12345678'
      }));

  print(response.body);
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    login();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Fetch Data Example'),
        ),
        body: Center(),
      ),
    );
  }
}
