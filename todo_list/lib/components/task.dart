import 'package:flutter/material.dart';
import 'package:todo_list/components/starts.dart';

class Task extends StatefulWidget {
  final String title;
  final String foto;
  final int dificuldade;
  const Task({
    super.key,
    required this.title,
    required this.foto,
    required this.dificuldade,
  });

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  int nivel = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 5,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          child: Stack(
            children: [
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 100,
                        width: 74,
                        color: Colors.black26,
                        child: Image.network(fit: BoxFit.cover, widget.foto),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 200,
                            child: Text(
                              widget.title,
                              style: TextStyle(
                                fontSize: 24,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                          Starts(dificuldade: widget.dificuldade),
                        ],
                      ),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            nivel++;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: EdgeInsets.all(6),

                          // Color del botón
                        ),
                        child: Column(
                          children: [
                            Icon(
                              Icons.arrow_drop_up,
                              size: 30,
                              color: Colors.white,
                            ),
                            Text(
                              "Lvl Up",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 1),
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                      color: (nivel / widget.dificuldade) >= 10
                          ? Colors.green
                          : Colors.red,
                    ),
                    height: 40,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 200,
                            child: LinearProgressIndicator(
                              value: (widget.dificuldade > 0)
                                  ? (nivel / widget.dificuldade) / 10
                                  : 1,
                              color: Colors.white,
                              // ignore: deprecated_member_use
                              backgroundColor: Colors.white.withOpacity(0.5),
                            ),
                          ),
                          // Text("XP 100", style: TextStyle(color: Colors.white)),
                          Text(
                            "Nível: $nivel",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
