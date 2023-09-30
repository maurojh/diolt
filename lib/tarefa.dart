import 'package:flutter/material.dart';

class Tarefa {
  final String _id = UniqueKey().toString();
  String _tarefa = '';
  bool _concluida = false;

  Tarefa(this._tarefa, this._concluida);

  String get id => _id;
  
  // String getId() {
  //   return _id;
  // }

  set tarefa(String tarefa) {
    _tarefa = tarefa;
  }

  String get tarefa => _tarefa;

  // String getTarefa() {
  //   return _tarefa;
  // }

  set concluida(bool concluida) {
    _concluida = concluida;
  }

  // void setConcluida(bool concluida) {
  //   _concluida = concluida;
  // }

  bool get concluida => _concluida;

  // bool getConcluida() {
  //   return _concluida;
  // }
}