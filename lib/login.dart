import 'package:flutter/material.dart';

class MyLogin extends StatefulWidget {
  const MyLogin({Key? key}) : super(key: key);

  @override
  State<MyLogin> createState() => _MyLoginState();
}

class Task {
  String name;
  bool isDone;

  Task({required this.name, this.isDone = false});
}

class _MyLoginState extends State<MyLogin> {
  final TextEditingController _controller = TextEditingController();
  final List<Task> _tasks = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: const Text('Task Manager'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _controller,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                labelText: 'Enter a new task',
                labelStyle: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  String taskName = _controller.text;
                  if (taskName.isNotEmpty) {
                    _tasks.add(Task(name: taskName));
                    _controller.clear();
                  }
                });
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
              child: const Text('Add Task', style: TextStyle(color: Colors.white)),
            ),
            const SizedBox(height: 20),
            const Text(
              'Tasks:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: _tasks.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      _tasks[index].name,
                      style: const TextStyle(color: Colors.white),
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () {
                            setState(() {
                              _tasks.removeAt(index);
                            });
                          },
                        ),
                        Checkbox(
                          value: _tasks[index].isDone,
                          onChanged: (value) {
                            setState(() {
                              _tasks[index].isDone = value ?? false;
                            });
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.black,
    );
  }
}
