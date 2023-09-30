import 'package:flutter/material.dart';

class Tarefa {
  final String _id = UniqueKey().toString();
  String _tarefa = '';
  bool _concluida = false;

  Tarefa(this._tarefa, this._concluida);

  String getId() {
    return _id;
  }

  void setTarefa(String tarefa) {
    _tarefa = tarefa;
  }

  String getTarefa() {
    return _tarefa;
  }

  void setConcluida(bool concluida) {
    _concluida = concluida;
  }

  bool getConcluida() {
    return _concluida;
  }
}