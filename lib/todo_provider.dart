import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:untitled/todo_item.dart';

part 'todo_provider.g.dart';

@riverpod
class TodoProvider extends _$TodoProvider {
  @override
  List<TodoItem> build() {
    return [];
  }

  void addTodo({required String title, required String description}) {
    final newTodo = TodoItem.create(title: title, description: description);
    state = [...state, newTodo];
  }

  void deleteTodo({required String id}) {
    state.removeWhere((todo) => todo.id == id);
    state = [...state]; // force rebuild with new reference
  }

  void setFinished({required String id}) {
    state = state.map((todo) {
      if (todo.id == id) {
        return todo.copyWith(isCompleted: !todo.isCompleted);
      }
      return todo;
    }).toList();
  }
}
