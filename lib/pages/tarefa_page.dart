import 'package:diolt/repositories/tarefa_repository.dart';
import 'package:diolt/tarefa.dart';
import 'package:flutter/material.dart';

class TarefaPage extends StatefulWidget {
  const TarefaPage({super.key});

  @override
  State<TarefaPage> createState() => _TarefaPageState();
}

class _TarefaPageState extends State<TarefaPage> {
  TarefaRepository tarefaRepository = TarefaRepository();
  TextEditingController controlaNovaTarefa = TextEditingController();
  var _tarefas = <Tarefa>[];

  @override
  void initState() {
    // TODO: implement initState
    obterTarefas();
    super.initState();
  }

  void obterTarefas() async {
    _tarefas = await tarefaRepository.listarTarefas();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            controlaNovaTarefa.text = '';
            showDialog(
                context: context,
                builder: (BuildContext bc) {
                  return AlertDialog(
                    title: Text('Adicionar tarefa'),
                    content: TextField(
                      controller: controlaNovaTarefa,
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('cancelar'),
                      ),
                      TextButton(
                        onPressed: () async {
                          await tarefaRepository.adicionar(
                            Tarefa(controlaNovaTarefa.text, false)
                          );
                          setState(() {
                            
                          });
                          //print(controlaNovaTarefa.text);
                          Navigator.pop(context);
                        },
                        child: Text('salvar'),
                      )
                    ],
                  );
                });
          }),
      body: ListView.builder(
        itemCount: _tarefas.length,
        itemBuilder: (BuildContext bc, int index) {
          var tarefaAtual = _tarefas[index];
        return Text(tarefaAtual.getTarefa());
      }),
    );
  }
}
