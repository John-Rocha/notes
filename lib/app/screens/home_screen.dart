import 'package:flutter/material.dart';
import 'package:notes/app/database/database_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //Pegando todas as notas
  getNotes() async {
    final notes = await DatabaseProvider.db.getNotes();
    return notes;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('YourNotes'),
      ),
      body: FutureBuilder(
        future: getNotes(),
        builder: (BuildContext context, AsyncSnapshot noteData) {
          switch (noteData.connectionState) {
            case ConnectionState.waiting:
              {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            case ConnectionState.done:
              {
                if (noteData.data != null) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView.builder(
                      itemCount: noteData.data.length,
                      itemBuilder: (context, index) {
                        String title = noteData.data[index]['title'];
                        String body = noteData.data[index]['body'];
                        String creationDate =
                            noteData.data[index]['creationDate'];
                        String id = noteData.data[index]['id'];
                        return Card(
                          child: ListTile(
                            title: Text(title),
                            subtitle: Text(body),
                          ),
                        );
                      },
                    ),
                  );
                } else {
                  return const Center(
                    child: Text("Você ainda não tem notas criadas, crie uma!"),
                  );
                }
              }
            default:
          }
          return Container();
        },
      ),
    );
  }
}
