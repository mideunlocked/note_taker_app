import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:note_taker/db/notes_db.dart';
import 'package:note_taker/demo_data.dart';

class AddNotePage extends StatefulWidget {
  static const routeName = 'AddNotePage';

  const AddNotePage({Key? key}) : super(key: key);

  @override
  _AddNotePageState createState() => _AddNotePageState();
}

class _AddNotePageState extends State<AddNotePage> {
  final _titleController = TextEditingController();
  final _bodyController = TextEditingController();
  // final _categoryController = TextEditingController();

  Future addNewNote() async {
    final note = Note(
      title: _titleController.text,
      body: _bodyController.text,
      timeAdded: DateTime.now(), id: DateTime.now().microsecond,
      // category: _categoryController.text,
    );

    await NotesDataBase.instance.create(note);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _bodyController.dispose();
    // _categoryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
            controller: _titleController,
            cursorColor: Colors.black,
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
            controller: _bodyController,
            maxLines: null,
            expands: true,
            cursorColor: Colors.black,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addNewNote;
          Navigator.of(context).pop();
        },
        child: const Icon(Icons.check_rounded),
      ),
    );
  }
}
