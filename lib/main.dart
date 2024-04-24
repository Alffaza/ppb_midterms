import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:developer';
import 'pages/home_page.dart';
import 'pages/movie_list_page.dart';


void main() {
  runApp(MaterialApp(
    initialRoute: '/home',
    routes: {
      // '/': (context) => Loading(),
      '/home': (context) => HomePage(),
      '/movie_list': (context) => MovieListPage(),
    },
  ));
}
