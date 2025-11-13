import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

// --- GLOBAL DATABASE HELPER ---
class DatabaseHelper {
  static Database? _database;
  static const String dbName = 'productivity_hub.db';

  // Table and column names for To-Do List
  static const String todoTable = 'tasks';
  static const String todoId = 'id';
  static const String todoTitle = 'title';
  static const String todoIsDone = 'isDone';

  // Table and column names for Notes
  static const String noteTable = 'notes';
  static const String noteId = 'id';
  static const String noteContent = 'content';
  static const String noteTimestamp = 'timestamp';

  // Get the database instance
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  // Initialize and open the database
  Future<Database> _initDatabase() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, dbName);

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        // Create Tasks table
        await db.execute('''
          CREATE TABLE $todoTable(
            $todoId INTEGER PRIMARY KEY AUTOINCREMENT,
            $todoTitle TEXT,
            $todoIsDone INTEGER
          )
        ''');
        // Create Notes table
        await db.execute('''
          CREATE TABLE $noteTable(
            $noteId INTEGER PRIMARY KEY AUTOINCREMENT,
            $noteContent TEXT,
            $noteTimestamp TEXT
          )
        ''');
      },
    );
  }
}

// Instantiate the helper globally
final dbHelper = DatabaseHelper();

// --- MAIN FUNCTION AND APP SETUP ---
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize the database on startup
  await dbHelper.database;

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.system;
  bool _isDark = false;

  @override
  void initState() {
    super.initState();
    _loadThemePreference();
  }

  // --- 1. SHARED PREFERENCES: Theme Management ---
  void _loadThemePreference() async {
    final prefs = await SharedPreferences.getInstance();
    _isDark = prefs.getBool('isDarkMode') ?? false;
    setState(() {
      _themeMode = _isDark ? ThemeMode.dark : ThemeMode.light;
    });
  }

  void _setThemePreference(bool isDark) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDarkMode', isDark);
    setState(() {
      _isDark = isDark;
      _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Productivity Hub',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
      darkTheme: ThemeData.dark(useMaterial3: true),
      themeMode: _themeMode,
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Productivity Hub'),
            bottom: const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.settings), text: 'Settings'),
                Tab(icon: Icon(Icons.check_box), text: 'To-Do'),
                Tab(icon: Icon(Icons.note), text: 'Notes'),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              _SettingsTab(
                isDark: _isDark,
                onThemeChanged: _setThemePreference,
              ),
              const _TodoTab(),
              const _NotesTab(),
            ],
          ),
        ),
      ),
    );
  }
}

// --- 1. SETTINGS TAB (shared_preferences) ---
class _SettingsTab extends StatelessWidget {
  final bool isDark;
  final Function(bool) onThemeChanged;

  const _SettingsTab({required this.isDark, required this.onThemeChanged});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SwitchListTile(
          title: const Text('Dark Mode'),
          value: isDark,
          onChanged: onThemeChanged,
          secondary: const Icon(Icons.brightness_6),
        ),
        const Divider(),
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
              'Preferences stored using shared_preferences.',
              style: TextStyle(fontStyle: FontStyle.italic)),
        )
      ],
    );
  }
}

// --- 2. TO-DO LIST TAB (Sqflite) ---
class _TodoTab extends StatefulWidget {
  const _TodoTab();

  @override
  State<_TodoTab> createState() => _TodoTabState();
}

class _TodoTabState extends State<_TodoTab> {
  List<Map<String, dynamic>> _tasks = [];

  @override
  void initState() {
    super.initState();
    _loadTasks();
  }

  Future<void> _loadTasks() async {
    final db = await dbHelper.database;
    final data = await db.query(DatabaseHelper.todoTable, orderBy: 'id DESC');
    setState(() {
      _tasks = data;
    });
  }

  // CREATE: Add new task
  Future<void> _addTask(String title) async {
    final db = await dbHelper.database;
    await db.insert(
      DatabaseHelper.todoTable,
      {DatabaseHelper.todoTitle: title, DatabaseHelper.todoIsDone: 0}, // 0 is false
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    _loadTasks();
  }

  // UPDATE: Toggle task status
  Future<void> _toggleTaskStatus(int id, int currentStatus) async {
    final db = await dbHelper.database;
    final newStatus = currentStatus == 0 ? 1 : 0;
    await db.update(
      DatabaseHelper.todoTable,
      {DatabaseHelper.todoIsDone: newStatus},
      where: '${DatabaseHelper.todoId} = ?',
      whereArgs: [id],
    );
    _loadTasks();
  }

  // UPDATE: Edit task title
  Future<void> _updateTaskTitle(int id, String newTitle) async {
    final db = await dbHelper.database;
    await db.update(
      DatabaseHelper.todoTable,
      {DatabaseHelper.todoTitle: newTitle},
      where: '${DatabaseHelper.todoId} = ?',
      whereArgs: [id],
    );
    _loadTasks();
  }

  // DELETE: Delete a task
  Future<void> _deleteTask(int id) async {
    final db = await dbHelper.database;
    await db.delete(
      DatabaseHelper.todoTable,
      where: '${DatabaseHelper.todoId} = ?',
      whereArgs: [id],
    );
    _loadTasks();
  }

  // Dialog for Adding/Editing a task
  void _showTaskDialog({Map<String, dynamic>? task}) {
    final isEditing = task != null;
    final TextEditingController controller = TextEditingController(text: isEditing ? task[DatabaseHelper.todoTitle] : '');

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(isEditing ? 'Edit Task' : 'Add New Task'),
          content: TextField(
            controller: controller,
            decoration: const InputDecoration(hintText: 'Enter task name'),
            autofocus: true,
          ),
          actions: [
            TextButton(
              child: const Text('Cancel'),
              onPressed: () => Navigator.of(context).pop(),
            ),
            ElevatedButton(
              child: Text(isEditing ? 'Save' : 'Add'),
              onPressed: () {
                if (controller.text.isNotEmpty) {
                  if (isEditing) {
                    _updateTaskTitle(task[DatabaseHelper.todoId], controller.text);
                  } else {
                    _addTask(controller.text);
                  }
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _tasks.isEmpty
          ? const Center(child: Text('No tasks yet. Add one!'))
          : RefreshIndicator(
        onRefresh: _loadTasks,
        child: ListView.builder(
          itemCount: _tasks.length,
          itemBuilder: (context, index) {
            final task = _tasks[index];
            final isDone = task[DatabaseHelper.todoIsDone] == 1;

            return ListTile(
              title: Text(
                task[DatabaseHelper.todoTitle],
                style: TextStyle(
                  decoration: isDone ? TextDecoration.lineThrough : null,
                ),
              ),
              leading: Checkbox(
                value: isDone,
                onChanged: (bool? newValue) {
                  _toggleTaskStatus(task[DatabaseHelper.todoId], task[DatabaseHelper.todoIsDone]);
                },
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.edit, size: 20),
                    onPressed: () => _showTaskDialog(task: task),
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red, size: 20),
                    onPressed: () => _deleteTask(task[DatabaseHelper.todoId]),
                  ),
                ],
              ),
              onTap: () {
                _toggleTaskStatus(task[DatabaseHelper.todoId], task[DatabaseHelper.todoIsDone]);
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showTaskDialog(),
        child: const Icon(Icons.add),
      ),
    );
  }
}

// --- 3. NOTES APP TAB (Sqflite) ---
class _NotesTab extends StatefulWidget {
  const _NotesTab();

  @override
  State<_NotesTab> createState() => _NotesTabState();
}

class _NotesTabState extends State<_NotesTab> {
  List<Map<String, dynamic>> _notes = [];

  @override
  void initState() {
    super.initState();
    _loadNotes();
  }

  // READ: Load all notes
  Future<void> _loadNotes() async {
    final db = await dbHelper.database;
    // Order by latest timestamp
    final data = await db.query(DatabaseHelper.noteTable, orderBy: '${DatabaseHelper.noteTimestamp} DESC');
    setState(() {
      _notes = data;
    });
  }

  // DELETE: Delete a note
  Future<void> _deleteNote(int id) async {
    final db = await dbHelper.database;
    await db.delete(
      DatabaseHelper.noteTable,
      where: '${DatabaseHelper.noteId} = ?',
      whereArgs: [id],
    );
    _loadNotes();
  }

  // Helper function to navigate to the Note editor screen
  void _editNote(Map<String, dynamic>? note) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => _NoteEditorScreen(
          note: note,
          refreshNotes: _loadNotes, // Pass callback to refresh
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _notes.isEmpty
          ? const Center(child: Text('No notes yet. Tap the + to add one!'))
          : RefreshIndicator(
        onRefresh: _loadNotes,
        child: ListView.builder(
          itemCount: _notes.length,
          itemBuilder: (context, index) {
            final note = _notes[index];
            final content = note[DatabaseHelper.noteContent] as String;

            // Simple title extraction for display
            final title = content.split('\n')[0].trim();

            return ListTile(
              title: Text(title.isEmpty ? 'Untitled Note' : title,
                  maxLines: 1, overflow: TextOverflow.ellipsis),
              subtitle: Text(content, maxLines: 2, overflow: TextOverflow.ellipsis),
              onTap: () => _editNote(note),
              trailing: IconButton(
                icon: const Icon(Icons.delete, color: Colors.red),
                onPressed: () => _deleteNote(note[DatabaseHelper.noteId]),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _editNote(null),
        child: const Icon(Icons.add),
      ),
    );
  }
}

// --- Note Editor Screen ---
class _NoteEditorScreen extends StatefulWidget {
  final Map<String, dynamic>? note;
  final VoidCallback refreshNotes;

  const _NoteEditorScreen({this.note, required this.refreshNotes});

  @override
  State<_NoteEditorScreen> createState() => _NoteEditorScreenState();
}

class _NoteEditorScreenState extends State<_NoteEditorScreen> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.note?[DatabaseHelper.noteContent] as String?);
  }

  // CREATE/UPDATE: Save or update note
  void _saveNote() async {
    final content = _controller.text.trim();
    if (content.isNotEmpty) {
      final db = await dbHelper.database;
      final now = DateTime.now().toIso8601String();

      if (widget.note == null) {
        // CREATE: New note
        await db.insert(
          DatabaseHelper.noteTable,
          {DatabaseHelper.noteContent: content, DatabaseHelper.noteTimestamp: now},
          conflictAlgorithm: ConflictAlgorithm.replace,
        );
      } else {
        // UPDATE: Existing note
        await db.update(
          DatabaseHelper.noteTable,
          {DatabaseHelper.noteContent: content, DatabaseHelper.noteTimestamp: now},
          where: '${DatabaseHelper.noteId} = ?',
          whereArgs: [widget.note![DatabaseHelper.noteId]],
        );
      }
      widget.refreshNotes(); // Notify the list to reload
    }
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.note == null ? 'New Note' : 'Edit Note'),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: _saveNote,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TextField(
          controller: _controller,
          decoration: const InputDecoration(
            hintText: 'Start writing your note...',
            border: InputBorder.none,
          ),
          keyboardType: TextInputType.multiline,
          maxLines: null,
          expands: true,
        ),
      ),
    );
  }
}