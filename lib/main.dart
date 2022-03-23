// ignore_for_file: unnecessary_new, prefer_const_constructors, constant_identifier_names, avoid_unnecessary_containers

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Contrato> contatos = [];

  @override
  void initState() {
    super.initState();

    contatos.add(new Contrato(
      nome: 'Andre Pereira',
      telefone: '3379-9999',
      tipo: ContratoType.CASA,
    ));
    contatos.add(new Contrato(
      nome: 'Simão dos Santos',
      telefone: '99879-9999',
      tipo: ContratoType.CELULAR,
    ));
    contatos.add(new Contrato(
      nome: 'Thiago - MVC',
      telefone: '3379-9999',
      tipo: ContratoType.FAVORITO,
    ));
    contatos.add(new Contrato(
      nome: 'Renata - Taxista',
      telefone: '3379-9999',
      tipo: ContratoType.TRABALHO,
    ));
    contatos.add(new Contrato(
      nome: 'Lucas - Bolão',
      telefone: '98379-9999',
      tipo: ContratoType.CELULAR,
    ));
    contatos.add(new Contrato(
      nome: 'Andressa Lima',
      telefone: '3379-9999',
      tipo: ContratoType.CASA,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.separated(
            itemBuilder: (context, index) {
              var contato = contatos[index];
              return ListTile(
                leading: CircleAvatar(
                  child: ContatoHelper.getIconByContatoType(contato.tipo),
                  backgroundColor: Colors.blue[200],
                ),
                title: Text(contato.nome),
                subtitle: Text(contato.telefone),
                trailing: IconButton(
                  icon: Icon(Icons.call),
                  onPressed: () => {},
                ),
              );
            },
            separatorBuilder: (context, index) => Divider(),
            itemCount: contatos.length));
  }
}

class Contrato {
  final String nome;
  final String telefone;
  final ContratoType tipo;

  Contrato({required this.nome, required this.telefone, required this.tipo});
}

enum ContratoType { CELULAR, TRABALHO, FAVORITO, CASA }

class ContatoHelper {
  static Icon getIconByContatoType(ContratoType tipo) {
    switch (tipo) {
      case ContratoType.CELULAR:
        return Icon(Icons.phone_android, color: Colors.green[700]);
      case ContratoType.TRABALHO:
        return Icon(Icons.work, color: Colors.brown[600]);
      case ContratoType.FAVORITO:
        return Icon(Icons.star, color: Colors.yellow[600]);
      case ContratoType.CASA:
        return Icon(Icons.home, color: Colors.purple[600]);
    }
  }
}
