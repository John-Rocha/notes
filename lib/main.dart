import 'package:flutter/material.dart';
import 'package:notes/app/screens/add_note.dart';
import 'package:notes/app/screens/display_note.dart';
import 'package:notes/app/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/addNote': (context) => const AddNote(),
        '/showNotes': (context) => const DisplayNote(),
      },
    );
  }
}
