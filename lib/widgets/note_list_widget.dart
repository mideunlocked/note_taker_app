import 'package:flutter/material.dart';
import 'package:note_taker/db/notes_db.dart';

import '../demo_data.dart';
import 'note_tile_widget.dart';

class NoteListWidget extends StatefulWidget {
  const NoteListWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<NoteListWidget> createState() => _NoteListWidgetState();
}

class _NoteListWidgetState extends State<NoteListWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Note>>(
        future: NotesDataBase.instance.readAllNotes(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final List<Note>? notes = snapshot.data;
            return ListView.builder(
                itemCount: notes!.length,
                itemBuilder: (ctx, index) {
                  return NoteTileWidget(
                    body: notes[index].body,
                    title: notes[index].title,
                    timeAdded:
                        ('${notes[index].timeAdded.day}/${notes[index].timeAdded.month}/${notes[index].timeAdded.year}'),
                    id: notes[index].id,
                  );
                });
          } else {
            return const Center(
              child: Text('No notes yet'),
            );
          }
        });
  }
}
