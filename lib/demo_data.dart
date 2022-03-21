const String tableNotes = 'notesApp';

class NoteFields {
  static const List<String> values = [
    id,
    title,
    body,
    timeAdded,
    category,
  ];

  static const String id = '_id';
  static const String title = 'title';
  static const String body = 'body';
  static const String timeAdded = 'timeAdded';
  static const String category = 'category';
}

class Note {
  final int id;
  final String title;
  final String body;
  final DateTime timeAdded;
  // final String category;

  const Note({
    required this.id,
    required this.title,
    required this.body,
    required this.timeAdded,
    // required this.category,
  });

  static Note fromJson(Map<String, Object?> json) => Note(
        title: json[NoteFields.title] as String,
        body: json[NoteFields.body] as String,
        timeAdded: json[NoteFields.title] as DateTime,
        id: json[NoteFields.id] as int,
      );

  Map<String, Object?> toJson() => {
        NoteFields.id: id,
        NoteFields.title: title,
        NoteFields.body: body,
        NoteFields.timeAdded: timeAdded,
      };

  Note copy({
    int? id,
    String? title,
    String? body,
    DateTime? timeAdded,
  }) =>
      Note(
          title: title ?? this.title,
          body: body ?? this.body,
          timeAdded: timeAdded ?? this.timeAdded,
          id: id ?? this.id);
}

List<Note> noteDemo = [
  Note(
    id: 1,
    title: 'Chemistry',
    body: 'Chemistry is the study of matter',
    timeAdded: DateTime.now(),
    // category: 'School',
  ),
  Note(
    id: 2,
    title: 'Pyhsics',
    body: 'Physics is everything we do and see around us',
    timeAdded: DateTime.now(),
    // category: 'Work',
  ),
  Note(
    id: 3,
    title: 'Biology',
    body: 'Biology is the study of living organisms',
    timeAdded: DateTime.now(),
    // category: 'General',
  ),
];
