import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:note_taker/db/notes_db.dart';
import 'package:note_taker/demo_data.dart';

class NotePage extends StatefulWidget {
  static const routeName = 'NotePage';

  const NotePage({Key? key}) : super(key: key);

  @override
  State<NotePage> createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  @override
  Widget build(BuildContext context) {
    var isChanged = false;

    final noteData =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final titleData = noteData['title'];
    final bodyData = noteData['body'];
    final id = noteData['id'];

    final _titleTextController = TextEditingController(text: titleData);
    final _noteTextController = TextEditingController(text: bodyData);
    // final _categoryController = TextEditingController();

    Future updateNote() async {
      final note = Note(
        id: id,
        title: _titleTextController.text,
        body: _noteTextController.text,
        timeAdded: DateTime.now(),
        // category: _categoryController.text,
      );

      await NotesDataBase.instance.update(note);
      Navigator.of(context).pop();
    }

    @override
    // ignore: unused_element
    void dispose() {
      _titleTextController.dispose();
      _noteTextController.dispose();
      super.dispose();
    }

    return Scaffold(
      backgroundColor: HexColor('#F3E3C3'),
      appBar: AppBar(
        title: Container(
          height: 40,
          width: double.infinity,
          padding: const EdgeInsets.only(top: 5, left: 10),
          decoration: BoxDecoration(
            color: HexColor('#F3E3C3'),
            borderRadius: BorderRadius.circular(20),
          ),
          child: TextField(
            controller: _titleTextController,
            cursorColor: Colors.black,
            onChanged: (value) async {
              if (value != _titleTextController.text) {
                isChanged = true;
              }
            },
            decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: 'Title',
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: TextField(
            controller: _noteTextController,
            maxLines: null,
            expands: true,
            cursorColor: Colors.black,
            onChanged: (value) async {
              if (value != _noteTextController.text) {
                isChanged = true;
              }
            },
          ),
        ),
      ),
      floatingActionButton: isChanged
          ? FloatingActionButton(
              onPressed: () {
                updateNote();
              },
              child: const Icon(Icons.mode_edit_outline_rounded),
            )
          : null,
    );
  }
}
