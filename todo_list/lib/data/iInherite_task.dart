import 'package:flutter/material.dart';
import 'package:todo_list/components/task.dart';

class Inheritetask extends InheritedWidget {
  Inheritetask({super.key, required Widget child}) : super(child: child);

  List<Task> taskList = [
    Task(
      title: "Estudar Flutter",
      foto: "https://pbs.twimg.com/media/Eu7m692XIAEvxxP?format=png&name=large",
      dificuldade: 3,
    ),
    Task(
      title: "Cozinhar",
      foto: "https://pbs.twimg.com/media/Eu7m692XIAEvxxP?format=png&name=large",
      dificuldade: 2,
    ),
    Task(
      title: "Limpar a casa",
      foto: "https://pbs.twimg.com/media/Eu7m692XIAEvxxP?format=png&name=large",
      dificuldade: 1,
    ),
    Task(
      title: "Treinar",
      foto: "https://pbs.twimg.com/media/Eu7m692XIAEvxxP?format=png&name=large",
      dificuldade: 5,
    ),
    Task(
      title: "Ler um livro",
      foto: "https://pbs.twimg.com/media/Eu7m692XIAEvxxP?format=png&name=large",
      dificuldade: 2,
    ),
    Task(
      title: "Caminhar",
      foto: "https://pbs.twimg.com/media/Eu7m692XIAEvxxP?format=png&name=large",
      dificuldade: 1,
    ),
    Task(
      title: "Estudar Dart",
      foto: "https://pbs.twimg.com/media/Eu7m692XIAEvxxP?format=png&name=large",
      dificuldade: 4,
    ),
    Task(
      title: "Fazer compras",
      foto: "https://pbs.twimg.com/media/Eu7m692XIAEvxxP?format=png&name=large",
      dificuldade: 3,
    ),
  ];

  void addTask(Task task) {
    taskList.add(task);
  }

  static Inheritetask of(BuildContext context) {
    final Inheritetask? result = context
        .dependOnInheritedWidgetOfExactType<Inheritetask>();
    assert(result != null, 'No Inheritetask found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(Inheritetask oldWidget) {
    return true;
  }
}
