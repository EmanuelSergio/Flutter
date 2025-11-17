import 'package:flutter/material.dart';
import 'package:todo_list/components/task.dart';
import 'package:todo_list/data/iInherite_task.dart';
import 'package:todo_list/data/task_dao.dart';
import 'package:todo_list/pages/form_screen.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        title: Text("Tarefas", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
      ),
      body: FutureBuilder<List<Task>>(
        future: TaskDao().findAll(),
        builder: (context, snapshot) {
          List<Task>? tarefas = snapshot.data;
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [Text("Nenhuma conexão iniciada")],
                ),
              );
            case ConnectionState.waiting:
              return const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(),
                    Text("Carregando..."),
                  ],
                ),
              );
            case ConnectionState.active:
              return const Center(child: CircularProgressIndicator());
            case ConnectionState.done:
              if (snapshot.hasError) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.error_outline,
                        size: 128,
                        color: Colors.red,
                      ),
                      Text(
                        "Erro: ${snapshot.error}",
                        style: const TextStyle(color: Colors.red),
                      ),
                    ],
                  ),
                );
              }
              if (snapshot.hasData && tarefas != null) {
                if (tarefas.isNotEmpty) {
                  return ListView.builder(
                    itemCount: tarefas.length,
                    itemBuilder: (context, index) {
                      final Task tarefa = tarefas[index];
                      return tarefa;
                    },
                  );
                }
                return const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.info_outline, size: 128, color: Colors.blue),
                      Text("Nenhuma tarefa cadastrada!"),
                    ],
                  ),
                );
              }
              return const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.warning_outlined,
                      size: 128,
                      color: Colors.orange,
                    ),
                    Text("Nenhum dado encontrado!"),
                  ],
                ),
              );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (contextNew) => FormScreen(taskContext: context),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
