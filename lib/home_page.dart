import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untitled/todo_provider.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController();
    final descriptionController = TextEditingController();
    final todos = ref.watch(todoProviderProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "TODO APP",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: todos.length,
          itemBuilder: (context, index) {
            final todo = todos[index];
            return ListTile(
              leading: Checkbox(
                value: todo.isCompleted,
                onChanged: (value) {
                  ref
                      .read(todoProviderProvider.notifier)
                      .setFinished(id: todo.id);
                },
              ),
              title: Text(
                todo.title,
                style: TextStyle(
                  decoration: todo.isCompleted
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                  fontStyle: FontStyle.normal,
                ),
              ),
              subtitle: Text(
                todo.description,
                style: TextStyle(
                  fontStyle: todo.isCompleted
                      ? FontStyle.italic
                      : FontStyle.normal,
                ),
              ),
              trailing: GestureDetector(
                onTap: () {
                  ref
                      .read(todoProviderProvider.notifier)
                      .deleteTodo(id: todo.id);
                },
                child: Icon(Icons.delete),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              icon: Icon(Icons.add),
              title: Text("Add Todo"),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Enter the title",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),

                  TextField(
                    controller: titleController,
                    decoration: InputDecoration(hintText: "Title"),
                  ),
                  SizedBox(height: 24),
                  Text(
                    "Enter the description",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),

                  TextField(
                    controller: descriptionController,
                    decoration: InputDecoration(hintText: "Description"),
                  ),
                ],
              ),
              actions: [
                OverflowBar(
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("Cancel"),
                    ),
                    TextButton(
                      onPressed: () {
                        if (titleController.text.isNotEmpty ||
                            descriptionController.text.isNotEmpty) {
                          ref
                              .read(todoProviderProvider.notifier)
                              .addTodo(
                                title: titleController.text,
                                description: descriptionController.text,
                              );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: Colors.red,
                              content: Text(
                                "Title and description cannot be empty",
                              ),
                            ),
                          );
                        }
                        Navigator.pop(context);
                      },
                      child: Text("Add"),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
