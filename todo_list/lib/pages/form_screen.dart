import 'package:flutter/material.dart';
import 'package:todo_list/components/task.dart';
import 'package:todo_list/data/iInherite_task.dart';

class FormScreen extends StatefulWidget {
  FormScreen({super.key, required this.taskContext});

  final BuildContext taskContext;

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _difficultyController = TextEditingController();
  TextEditingController _imageController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  valueValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Este campo não pode ser vazio';
    }
    return null;
  }

  dificultyValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Este campo não pode ser vazio';
    }
    final n = int.tryParse(value);
    if (n == null || n < 1 || n > 5) {
      return 'Insira um número entre 1 e 5';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text("Nova Tarefa"),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.black12,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.black, width: 3),
          ),
          child: Column(
            children: [
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        onChanged: (_) {
                          setState(() {});
                        },
                        validator: (value) => valueValidator(value),
                        controller: _nameController,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Nome",
                          fillColor: Colors.white,
                          filled: true,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        validator: (value) => dificultyValidator(value),
                        onChanged: (_) {
                          setState(() {});
                        },
                        controller: _difficultyController,
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Dificuldade",
                          fillColor: Colors.white,
                          filled: true,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        validator: (value) => valueValidator(value),
                        controller: _imageController,
                        textAlign: TextAlign.center,
                        onChanged: (_) {
                          setState(() {});
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Imagem",
                          fillColor: Colors.white,
                          filled: true,
                        ),
                      ),
                    ),
                    Container(
                      width: 72,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.blue, width: 2),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        child: Image.network(
                          _imageController.text == ""
                              ? "https://pics.craiyon.com/2023-08-01/c10e5c59e87647598836af1e5be2eb0d.webp"
                              : _imageController.text,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("Tarefa adicionada com sucesso!"),
                            ),
                          );
                          Inheritetask.of(widget.taskContext).addTask(
                            Task(
                              title: _nameController.text,
                              dificuldade: int.parse(
                                _difficultyController.text,
                              ),
                              foto: _imageController.text,
                            ),
                          );
                          Navigator.pop(context);
                        }
                      },
                      child: Text("Adicionar"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
