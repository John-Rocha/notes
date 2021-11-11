// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:notes/app/database/database_provider.dart';
import 'package:notes/app/model/note_model.dart';
import 'package:sqflite/sqflite.dart';

class AddNote extends StatefulWidget {
  const AddNote({Key? key}) : super(key: key);

  @override
  _AddNoteState createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  late String title;
  late String body;
  late DateTime date;
  final _titleController = TextEditingController();
  final _bodyController = TextEditingController();

  addNote(NoteModel note) {
    DatabaseProvider.db.addNewNote(note);
    debugPrint("Nota add com sucesso");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Note'),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                title = _titleController.text;
                body = _bodyController.text;
                date = DateTime.now();
              });
              NoteModel note =
                  NoteModel(title: title, body: body, creationDate: date);
              addNote(note);
              Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
            },
            icon: Icon(Icons.save),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
        child: ListView(
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Note Title',
              ),
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Expanded(
              child: TextField(
                controller: _bodyController,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Your Note',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
