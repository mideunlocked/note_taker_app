import 'package:flutter/material.dart';

class NoteTileWidget extends StatelessWidget {
  final int? id;
  final String title;
  final String body;
  final String timeAdded;

  const NoteTileWidget({
    Key? key,
    required this.title,
    required this.body,
    required this.timeAdded,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w900,
          ),
        ),
        subtitle: Text(
          timeAdded.toString(),
        ),
        trailing: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.more_vert_rounded,
          ),
        ),
        onTap: () {
          Navigator.of(context).pushNamed('NotePage', arguments: {
            'title': title,
            'body': body,
            'id': id,
          });
        },
      ),
    );
  }
}
