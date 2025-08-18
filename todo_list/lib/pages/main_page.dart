import 'package:flutter/material.dart';
import 'package:todo_list/components/task.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

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
            Task(
              title: "Ler um livro",
              foto: "https://picsum.photos/seed/book/200/300",
              dificuldade: 2,
            ),
            Task(
              title: "Caminhar",
              foto: "https://picsum.photos/seed/walk/200/300",
              dificuldade: 1,
            ),
            Task(
              title: "Estudar Dart",
              foto: "https://picsum.photos/seed/dart/200/300",
              dificuldade: 4,
            ),
            Task(
              title: "Fazer compras",
              foto: "https://picsum.photos/seed/market/200/300",
              dificuldade: 3,
            ),
            Task(
              title: "Arrumar a mesa",
              foto: "https://picsum.photos/seed/desk/200/300",
              dificuldade: 1,
            ),
            Task(
              title: "Meditar",
              foto: "https://picsum.photos/seed/meditate/200/300",
              dificuldade: 2,
            ),
            Task(
              title: "Lavar roupa",
              foto: "https://picsum.photos/seed/laundry/200/300",
              dificuldade: 3,
            ),
            Task(
              title: "Escrever código",
              foto: "https://picsum.photos/seed/code/200/300",
              dificuldade: 5,
            ),
            Task(
              title: "Regar as plantas",
              foto: "https://picsum.photos/seed/plants/200/300",
              dificuldade: 1,
            ),
            Task(
              title: "Organizar emails",
              foto: "https://picsum.photos/seed/email/200/300",
              dificuldade: 2,
            ),
            SizedBox(height: 80),
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
