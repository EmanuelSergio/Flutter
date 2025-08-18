import 'package:flutter/material.dart';
import 'package:todo_list/task.dart';

class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool opacidade = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        title: Text("Tarefas", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
      ),
      body: AnimatedOpacity(
        duration: Duration(milliseconds: 500),
        opacity: opacidade ? 1.0 : 0.0,
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Task(
              title: "Estudar Flutter",
              foto:
                  "https://pbs.twimg.com/media/Eu7m692XIAEvxxP?format=png&name=large",
              dificuldade: 3,
            ),
            Task(
              title: "Cozinhar",
              foto:
                  "https://pbs.twimg.com/media/Eu7m692XIAEvxxP?format=png&name=large",
              dificuldade: 2,
            ),
            Task(
              title: "Limpar a casa",
              foto:
                  "https://pbs.twimg.com/media/Eu7m692XIAEvxxP?format=png&name=large",
              dificuldade: 1,
            ),
            Task(
              title: "Treinar",
              foto: "https://picsum.photos/200/300",
              dificuldade: 5,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            opacidade = !opacidade;
          });
        },
        child: Icon(Icons.remove_red_eye),
      ),
    );
  }
}
