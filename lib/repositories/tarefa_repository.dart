import 'package:diolt/tarefa.dart';

class TarefaRepository {
  final List<Tarefa> _tarefas = [];

  Future<void> adicionar(Tarefa tarefa) async {
    await Future.delayed(const Duration(seconds: 1));
    _tarefas.add(tarefa);
  }

  Future<List<Tarefa>> listarTarefas() async {
    await Future.delayed(const Duration(seconds: 1));
    return _tarefas;
  }

  Future<List<Tarefa>> listarTarefasNaoConcluidas() async {
    await Future.delayed(const Duration(seconds: 1));
    return _tarefas.where((element) => !element.getConcluida()).toList();
  }

  Future<void> alterar(String id, bool concluida) async {
    await Future.delayed(const Duration(seconds: 1));
    _tarefas
        .where((element) => element.getId() == id)
        .first
        .setConcluida(concluida);
  }

  Future<void> remover(String id) async {
    await Future.delayed(const Duration(seconds: 1));
    _tarefas.remove(_tarefas.where((element) => element.getId() == id).first);
  }
}
