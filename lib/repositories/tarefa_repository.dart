import 'package:diolt/tarefa.dart';

class TarefaRepository {
  final List<Tarefa> _tarefas = [];

  Future<void> adicionar(Tarefa tarefa) async {
    await Future.delayed(const Duration(seconds: 1));
    _tarefas.add(tarefa);
  }

  Future<List<Tarefa>> listarTarefas() async{
    await Future.delayed(const Duration(seconds: 1));
    return _tarefas;
  }

  void alterar(String id, bool concluida) async {
    await Future.delayed(const Duration(seconds: 1));
    _tarefas.where((element) => element.getId() == id).first.setConcluida(concluida);
  }
}