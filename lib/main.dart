import 'package:flutter/material.dart';

import 'home_page.dart';
import 'pages/add_note_page.dart';
import 'pages/note_page.dart';

Future<void> main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Note',
      theme: ThemeData(
        primarySwatch: Colors.red,
        appBarTheme: const AppBarTheme(
          elevation: 2,
        ),
      ),
      home: const HomePage(title: ''),
      routes: {
        AddNotePage.routeName: (ctx) => const AddNotePage(),
        NotePage.routeName: (ctx) => const NotePage(),
      },
    );
  }
}
