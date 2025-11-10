import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'note_model.dart';

class NotesScreen extends StatefulWidget {
  @override
  _NotesScreenState createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  final _noteBox = Hive.box<NoteModel>('notes');
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();

  void _addOrUpdateNote({NoteModel? note}) {
    if (note == null) {
      _noteBox.add(NoteModel(title: _titleController.text, content: _contentController.text));
    } else {
      note.title = _titleController.text;
      note.content = _contentController.text;
      note.save();
    }
    _titleController.clear();
    _contentController.clear();
    Navigator.pop(context);
  }

  void _deleteNote(NoteModel note) {
    note.delete();
    setState(() {});
  }

  void _showNoteDialog({NoteModel? note}) {
    if (note != null) {
      _titleController.text = note.title;
      _contentController.text = note.content;
    } else {
      _titleController.clear();
      _contentController.clear();
    }

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(note == null ? "New Note" : "Edit Note"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(controller: _titleController, decoration: InputDecoration(labelText: "Title")),
            TextField(controller: _contentController, decoration: InputDecoration(labelText: "Content")),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => _addOrUpdateNote(note: note),
            child: Text(note == null ? "Add" : "Update"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Notes")),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showNoteDialog(),
        child: Icon(Icons.add),
      ),
      body: ValueListenableBuilder(
        valueListenable: _noteBox.listenable(),
        builder: (context, Box<NoteModel> box, _) {
          if (box.isEmpty) return Center(child: Text("No notes available."));
          return ListView.builder(
            itemCount: box.length,
            itemBuilder: (context, index) {
              final note = box.getAt(index);
              return ListTile(
                title: Text(note!.title),
                subtitle: Text(note.content),
                onTap: () => _showNoteDialog(note: note),
                trailing: IconButton(
                  icon: Icon(Icons.delete, color: Colors.red),
                  onPressed: () => _deleteNote(note),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
