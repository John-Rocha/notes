import 'package:flutter/material.dart';
import 'package:notes/app/model/note_model.dart';

class DisplayNote extends StatelessWidget {
  const DisplayNote({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final NoteModel note =
        ModalRoute.of(context)!.settings.arguments as NoteModel;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Show Notes'),
      ),
      body: Column(
        children: [
          Text(
            note.title,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            note.body,
            style: TextStyle(
              fontSize: 18,
            ),
          )
        ],
      ),
    );
  }
}
