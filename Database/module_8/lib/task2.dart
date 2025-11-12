import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'task_model.dart';

class TaskScreen extends StatefulWidget {
  @override
  _TaskScreenState createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  final _taskBox = Hive.box<TaskModel>('tasks');
  final TextEditingController _controller = TextEditingController();

  void _addTask(String title) {
    final newTask = TaskModel(title: title);
    _taskBox.add(newTask);
    _controller.clear();
    setState(() {});
  }

  void _updateTask(TaskModel task, String newTitle) {
    task.title = newTitle;
    task.save();
    setState(() {});
  }

  void _deleteTask(TaskModel task) {
    task.delete();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("To-Do List")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(labelText: "New Task"),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () => _addTask(_controller.text),
                ),
              ],
            ),
          ),
          Expanded(
            child: ValueListenableBuilder(
              valueListenable: _taskBox.listenable(),
              builder: (context, Box<TaskModel> box, _) {
                if (box.isEmpty) return Center(child: Text("No tasks added."));
                return ListView.builder(
                  itemCount: box.length,
                  itemBuilder: (context, index) {
                    final task = box.getAt(index);
                    return ListTile(
                      title: Text(task!.title),
                      leading: Checkbox(
                        value: task.isCompleted,
                        onChanged: (val) {
                          task.isCompleted = val!;
                          task.save();
                          setState(() {});
                        },
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(Icons.edit),
                            onPressed: () {
                              _controller.text = task.title;
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: Text("Edit Task"),
                                  content: TextField(controller: _controller),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        _updateTask(task, _controller.text);
                                        Navigator.pop(context);
                                      },
                                      child: Text("Update"),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () => _deleteTask(task),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
