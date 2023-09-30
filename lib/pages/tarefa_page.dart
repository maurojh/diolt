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
  var apenasNaoConcluidos = false;

  @override
  void initState() {
    // TODO: implement initState
    obterTarefas();
    super.initState();
  }

  void obterTarefas() async {
    if(apenasNaoConcluidos) {
      _tarefas = await tarefaRepository.listarTarefasNaoConcluidas();
    } else {
      _tarefas = await tarefaRepository.listarTarefas();
    } 
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
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          children: [
           Container(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
             child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Listar não concluídas?'),
                  Switch(value: apenasNaoConcluidos, onChanged: (bool value) {
                    setState(() {
                      apenasNaoConcluidos = value;
                      obterTarefas();
                    });
                  }),
                ],
              ),
           ),
            Expanded(
              child: ListView.builder(
                itemCount: _tarefas.length,
                itemBuilder: (BuildContext bc, int index) {
                  var tarefaAtual = _tarefas[index];
                return Dismissible(
                  key: Key(tarefaAtual.id),
                  onDismissed: (DismissDirection dd) async {
                    await tarefaRepository.remover(tarefaAtual.id);
                    obterTarefas();
                  },
                  child: ListTile(
                    title: Text(tarefaAtual.tarefa),
                    trailing: Switch(value: tarefaAtual.concluida, onChanged: 
                    (bool value) async {
                      await tarefaRepository.alterar(tarefaAtual.id, value);
                      setState(() {
                        
                      });
                    },
                    ),
                    ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
