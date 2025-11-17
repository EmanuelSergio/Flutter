import 'package:sqflite/sqflite.dart';
import 'package:todo_list/components/task.dart';
import 'package:todo_list/data/database.dart';

class TaskDao {
  static const String tableSql =
      'CREATE TABLE $_tableName('
      '$_name TEXT, '
      '$_difficulty INTEGER, '
      '$_image TEXT'
      ')';

  static const String _tableName = 'tasksTable';
  static const String _name = 'name';
  static const String _difficulty = 'difficulty';
  static const String _image = 'image';

  save(Task task) async {
    final Database db = await getDataBase();
    var taskExist = await find(task.title);
    if (taskExist.isEmpty) {
      return await db.insert(_tableName, toMap(task));
    } else {
      return await db.update(
        _tableName,
        toMap(task),
        where: '$_name = ?',
        whereArgs: [task.title],
      );
    }
  }

  Future<List<Task>> findAll() async {
    final Database db = await getDataBase();
    final List<Map<String, dynamic>> result = await db.query(_tableName);
    print('Encontradas ${result} tarefas');
    return toList(result);
  }

  List<Task> toList(List<Map<String, dynamic>> map) {
    final List<Task> taskList = [];
    for (Map<String, dynamic> linha in map) {
      final Task task = Task(
        title: linha[_name],
        dificuldade: linha[_difficulty],
        foto: linha[_image],
      );
      taskList.add(task);
    }
    return taskList;
  }

  Map<String, dynamic> toMap(Task task) {
    final Map<String, dynamic> values = {};
    values[_name] = task.title;
    values[_difficulty] = task.dificuldade;
    values[_image] = task.foto;
    return values;
  }

  Future<List<Task>> find(String nomeTarefa) async {
    final Database db = await getDataBase();
    final List<Map<String, dynamic>> result = await db.query(
      where: '$_name = ?',
      whereArgs: [nomeTarefa],
      _tableName,
    );
    return toList(result);
  }

  delete(String nomeTarefa) async {
    final Database db = await getDataBase();
    return await db.delete(
      _tableName,
      where: '$_name = ?',
      whereArgs: [nomeTarefa],
    );
  }
}
