import 'package:flutter/material.dart';

import 'db/notes_db.dart';
import 'widgets/note_list_widget.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, required this.title}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: HexColor('#F3E3C3'),
      appBar: AppBar(
        title: const Text('Note taker'),
      ),
      body: const NoteListWidget(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed('AddNotePage');
        },
        child: const Icon(
          Icons.add_rounded,
        ),
      ),
    );
  }
}
