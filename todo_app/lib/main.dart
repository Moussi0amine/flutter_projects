import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert'; // for JSON encoding/decoding

void main() => runApp(const TodoApp());

/// ✅ Root widget
class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My To-Do App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.deepPurple,
      ),
      home: const TodoScreen(),
    );
  }
}

/// 📋 Main To-Do screen
class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  List<Map<String, dynamic>> _tasks = []; // each task = { "title": ..., "done": true/false }

  @override
  void initState() {
    super.initState();
    _loadTasks();
  }

  /// 💾 Load tasks from local storage
  Future<void> _loadTasks() async {
    final prefs = await SharedPreferences.getInstance();
    final savedTasks = prefs.getString('tasks');
    if (savedTasks != null) {
      setState(() {
        _tasks = List<Map<String, dynamic>>.from(jsonDecode(savedTasks));
      });
    }
  }

  /// 💾 Save tasks to local storage
  Future<void> _saveTasks() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('tasks', jsonEncode(_tasks));
  }

  /// ➕ Add new task via dialog
  void _showAddTaskDialog() {
    final TextEditingController controller = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Add Task'),
        content: TextField(
          controller: controller,
          autofocus: true,
          decoration: const InputDecoration(
            hintText: 'Enter your task...',
            border: OutlineInputBorder(),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              final taskTitle = controller.text.trim();
              if (taskTitle.isNotEmpty) {
                setState(() {
                  _tasks.add({'title': taskTitle, 'done': false});
                });
                _saveTasks();
              }
              Navigator.pop(context);
            },
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }

  /// 🗑️ Delete a task
  void _deleteTask(int index) {
    setState(() {
      _tasks.removeAt(index);
    });
    _saveTasks();
  }

  /// ✅ Toggle a task as done or not
  void _toggleTask(int index, bool? value) {
    setState(() {
      _tasks[index]['done'] = value ?? false;
    });
    _saveTasks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('✅ My To-Do List'),
        centerTitle: true,
        elevation: 0,
      ),
      body: _tasks.isEmpty
          ? const Center(
              child: Text(
                'No tasks yet.\nTap + to add one!',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white54, fontSize: 18),
              ),
            )
          : ListView.builder(
              itemCount: _tasks.length,
              padding: const EdgeInsets.all(10),
              itemBuilder: (context, index) {
                final task = _tasks[index];
                return Card(
                  color: Colors.grey.shade900,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  margin: const EdgeInsets.symmetric(vertical: 6),
                  child: CheckboxListTile(
                    value: task['done'],
                    title: Text(
                      task['title'],
                      style: TextStyle(
                        fontSize: 18,
                        decoration: task['done']
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                        color: task['done']
                            ? Colors.white54
                            : Colors.white,
                      ),
                    ),
                    onChanged: (value) => _toggleTask(index, value),
                    secondary: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.redAccent),
                      onPressed: () => _deleteTask(index),
                    ),
                    activeColor: Colors.deepPurpleAccent,
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddTaskDialog,
        child: const Icon(Icons.add),
      ),
    );
  }
}
