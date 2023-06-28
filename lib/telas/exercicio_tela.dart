import 'package:flutter/material.dart';
import 'package:flutter_gymapp/_comum/minhas_cores.dart';
import 'package:flutter_gymapp/modelos/exercicio_modelo.dart';
import 'package:flutter_gymapp/modelos/sentimento_modelo.dart';

class ExercicoTela extends StatelessWidget {
  ExercicoTela({super.key});

  final ExercicioModelo exercicioModelo = ExercicioModelo(
      id: "EX001",
      nome: "Remada baixa supinada",
      treino: "Treino A",
      comoFazer: "Segura a barra e puxa");

  //Lista de sentimentos para cada dia/descrição do Exercício
  final List<SentimentoModelo> listaSentimentos = [
    SentimentoModelo(
        id: "SE001", sentindo: "Pouca ativação hoje", data: "2023-06-26"),
    SentimentoModelo(
        id: "SE002", sentindo: "Já senti ativação hoje", data: "2023-06-27"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(
          title: Column(children: [
            Text(
              exercicioModelo.nome,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
            Text(
              exercicioModelo.treino,
              style: const TextStyle(fontSize: 15),
            )
          ]),
          centerTitle: true,
          backgroundColor: MinhasCores.azulEscuro,
          elevation: 0, //Propriedade para tratar a sombra da AppBar
          toolbarHeight: 72,
          //Definição do arredondamento das quinas inferiores da AppBar
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(24),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            print("Clicado");
          },
          child: const Icon(Icons.add),
        ),
        body: Container(
          margin: const EdgeInsets.all(8),
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: ListView(
            children: [
              SizedBox(
                height: 250,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text("Enviar foto"),
                    ),
                    ElevatedButton(
                        onPressed: () {}, child: const Text("Tirar foto")),
                  ],
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              const Text(
                "Como fazer?",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(exercicioModelo.comoFazer),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Divider(color: Colors.black),
              ),
              const Text(
                "Como estou me sentindo?",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                //Lista de textos
                children: List.generate(listaSentimentos.length, (index) {
                  SentimentoModelo sentimentoAgora = listaSentimentos[index];
                  return ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(sentimentoAgora.sentindo),
                    subtitle: Text(sentimentoAgora.data),
                    leading: const Icon(Icons.double_arrow),
                    trailing: IconButton(
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                      onPressed: () {
                        print("Deletar ${sentimentoAgora.sentindo}");
                      },
                    ),
                  );
                }),
              )
            ],
          ),
        ));
  }
}
