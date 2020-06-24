import 'dart:async';

import 'package:app_livraria/model/Aventura.dart';
import 'package:app_livraria/model/Drama.dart';
import 'package:app_livraria/model/Romance.dart';
import 'package:app_livraria/model/Terror.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import "package:flutter/material.dart";

void main() => runApp(TelaInicial());

class TelaInicial extends StatefulWidget {
  @override
  _TelaInicialState createState() => _TelaInicialState();
}

class _TelaInicialState extends State<TelaInicial> {
//Conexão Flutter+Firebase
  final db = Firestore.instance;
  //final dbD = Firestore.instance;
  final String colecao = "aventura";
  final String colecaoDrama = "drama";
  final String colecaoRomance = "romance";
  final String colecaoTerror = "terror";

//Lista dinâmica para manipulação dos dados
  List<Aventura> listaAven = List();
  List<Drama> listaDrama = List();
  List<Romance> listaRomance = List();
  List<Terror> listaTerror = List();

//Stream para "ouvir" o Firebase
  StreamSubscription<QuerySnapshot> listen;
  StreamSubscription<QuerySnapshot> listenDrama;
  StreamSubscription<QuerySnapshot> listenRomance;
  StreamSubscription<QuerySnapshot> listenTerror;

  @override
  void initState() {
    super.initState();

    //Cancelar o listen, caso a coleção esteja vazia
    listen?.cancel();
    listenDrama?.cancel();
    listenRomance?.cancel();
    listenTerror?.cancel();

    //retornar dados da coleção e inserir na lista dinamica
    listen = db.collection(colecao).snapshots().listen((res) {
      setState(() {
        listaAven = res.documents
            .map((doc) => Aventura.fromMap(doc.data, doc.documentID))
            .toList();
      });
    });

    listenDrama = db.collection(colecaoDrama).snapshots().listen((res) {
      setState(() {
        listaDrama = res.documents
            .map((doc) => Drama.fromMap(doc.data, doc.documentID))
            .toList();
      });
    });

    listenRomance = db.collection(colecaoRomance).snapshots().listen((res) {
      setState(() {
        listaRomance = res.documents
            .map((doc) => Romance.fromMap(doc.data, doc.documentID))
            .toList();
      });
    });

    listen = db.collection(colecaoTerror).snapshots().listen((res) {
      setState(() {
        listaTerror = res.documents
            .map((doc) => Terror.fromMap(doc.data, doc.documentID))
            .toList();
      });
    });
  }

  @override
  void dispose() {
    listen?.cancel();
    listenDrama?.cancel();
    listenRomance?.cancel();
    listenTerror?.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final String idDocumento = ModalRoute.of(context).settings.arguments;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          centerTitle: true,
          title: Text(
            "DigiLib",
            style: TextStyle(
                color: Colors.white,
                height: 1,
                fontSize: 27,
                fontWeight: FontWeight.bold),
          ),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(color: Colors.blueGrey),
                child: Text(
                  "DigiLibi",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.person),
                title: Text(
                  "Perfil",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, "/telaCadastro",
                      arguments: idDocumento);
                },
              ),
              ListTile(
                leading: Icon(Icons.bookmark),
                title: Text(
                  "Recomendações",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, "/telaRecomendacao",
                      arguments: idDocumento);
                },
              ),
              ListTile(
                leading: Icon(Icons.explore),
                title: Text(
                  "Aventura",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                  ),
                ),
                onTap: () {
                  Navigator.pop(
                      context); //fecha o drawer,assim quando for para a proxima tela e retornar dela, o drawer fica fechado
                  Navigator.pushNamed(context, "/telaLivro");
                },
              ),
              ListTile(
                leading: Icon(Icons.sentiment_very_satisfied),
                title: Text(
                  "Comédia",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, "/telaLivro");
                },
              ),
              ListTile(
                leading: Icon(Icons.movie_filter),
                title: Text(
                  "Drama",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, "/telaLeitura");
                },
              ),
              ListTile(
                leading: Icon(Icons.favorite_border),
                title: Text(
                  "Romance",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, "/telaLivro");
                },
              ),
              ListTile(
                leading: Icon(Icons.sentiment_very_dissatisfied),
                title: Text(
                  "Terror",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, "/telaLivro");
                },
              ),
              ListTile(
                leading: Icon(Icons.info_outline),
                title: Text(
                  "Informações",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, "/telaInfo");
                },
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Text(
                "Aventura",
                textAlign: TextAlign.start,
                style: TextStyle(
                    color: Colors.black,
                    height: 2,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 1.0),
                height: 300.0,
                child: StreamBuilder<QuerySnapshot>(

                    //fonte de dados
                    stream: db.collection(colecao).snapshots(),

                    //exibição dos dados
                    builder: (context, snapshot) {
                      switch (snapshot.connectionState) {
                        case ConnectionState.none:
                        case ConnectionState.waiting:
                          return Center(child: CircularProgressIndicator());

                        default:
                          //documentos retornados do Firebase
                          List<DocumentSnapshot> docs = snapshot.data.documents;
                          return ListView.builder(
                              scrollDirection: Axis.horizontal,
                              //itemCount: docs.length,
                              itemCount: 10,
                              itemBuilder: (context, index) {
                                return Container(
                                  width: 160.0,
                                  color: Colors.white,
                                  child: Card(
                                    child: Wrap(children: <Widget>[
                                      Image.network(listaAven[index].image),
                                      ListTile(
                                        title: Text(
                                          listaAven[index].titulo,
                                          style: TextStyle(fontSize: 20),
                                        ),
                                        subtitle: Text(listaAven[index].autor,
                                            style: TextStyle(fontSize: 16)),
                                        onTap: () {
                                          Navigator.pushNamed(
                                              context, "/telacadastro",
                                              arguments: listaAven[index].id);
                                        },
                                      ),
                                    ]),
                                  ),
                                );
                              });
                      }
                    }),
              ),
              Text(
                "Drama",
                textAlign: TextAlign.start,
                style: TextStyle(
                    color: Colors.black,
                    height: 2,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 1.0),
                height: 300.0,
                child: StreamBuilder<QuerySnapshot>(

                    //fonte de dados
                    stream: db.collection(colecaoDrama).snapshots(),

                    //exibição dos dados
                    builder: (context, snapshot) {
                      switch (snapshot.connectionState) {
                        case ConnectionState.none:
                        case ConnectionState.waiting:
                          return Center(child: CircularProgressIndicator());

                        default:
                          //documentos retornados do Firebase
                          List<DocumentSnapshot> docs = snapshot.data.documents;
                          return ListView.builder(
                              scrollDirection: Axis.horizontal,
                              //itemCount: docs.length,
                              itemCount: 10,
                              itemBuilder: (context, index) {
                                return Container(
                                  width: 160.0,
                                  color: Colors.white,
                                  child: Card(
                                    child: Wrap(children: <Widget>[
                                      Image.network(listaDrama[index].image),
                                      ListTile(
                                        title: Text(
                                          listaDrama[index].titulo,
                                          style: TextStyle(fontSize: 20),
                                        ),
                                        subtitle: Text(listaDrama[index].autor,
                                            style: TextStyle(fontSize: 16)),
                                        onTap: () {
                                          Navigator.pushNamed(
                                              context, "/telacadastro",
                                              arguments: listaDrama[index].id);
                                        },
                                      ),
                                    ]),
                                  ),
                                );
                              });
                      }
                    }),
              ),
              Text(
                "Romance",
                textAlign: TextAlign.start,
                style: TextStyle(
                    color: Colors.black,
                    height: 2,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 1.0),
                height: 300.0,
                child: StreamBuilder<QuerySnapshot>(

                    //fonte de dados
                    stream: db.collection(colecaoRomance).snapshots(),

                    //exibição dos dados
                    builder: (context, snapshot) {
                      switch (snapshot.connectionState) {
                        case ConnectionState.none:
                        case ConnectionState.waiting:
                          return Center(child: CircularProgressIndicator());

                        default:
                          //documentos retornados do Firebase
                          List<DocumentSnapshot> docs = snapshot.data.documents;
                          return ListView.builder(
                              scrollDirection: Axis.horizontal,
                              //itemCount: docs.length,
                              itemCount: 10,
                              itemBuilder: (context, index) {
                                return Container(
                                  width: 160.0,
                                  color: Colors.white,
                                  child: Card(
                                    child: Wrap(children: <Widget>[
                                      Image.network(listaRomance[index].image),
                                      ListTile(
                                        title: Text(
                                          listaRomance[index].titulo,
                                          style: TextStyle(fontSize: 20),
                                        ),
                                        subtitle: Text(
                                            listaRomance[index].autor,
                                            style: TextStyle(fontSize: 16)),
                                        onTap: () {
                                          Navigator.pushNamed(
                                              context, "/telacadastro",
                                              arguments: listaDrama[index].id);
                                        },
                                      ),
                                    ]),
                                  ),
                                );
                              });
                      }
                    }),
              ),
              Text(
                "Terror",
                textAlign: TextAlign.start,
                style: TextStyle(
                    color: Colors.black,
                    height: 2,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 1.0),
                height: 300.0,
                child: StreamBuilder<QuerySnapshot>(

                    //fonte de dados
                    stream: db.collection(colecaoTerror).snapshots(),

                    //exibição dos dados
                    builder: (context, snapshot) {
                      switch (snapshot.connectionState) {
                        case ConnectionState.none:
                        case ConnectionState.waiting:
                          return Center(child: CircularProgressIndicator());

                        default:
                          //documentos retornados do Firebase
                          List<DocumentSnapshot> docs = snapshot.data.documents;
                          return ListView.builder(
                              scrollDirection: Axis.horizontal,
                              //itemCount: docs.length,
                              itemCount: 10,
                              itemBuilder: (context, index) {
                                return Container(
                                  width: 160.0,
                                  color: Colors.white,
                                  child: Card(
                                    child: Wrap(children: <Widget>[
                                      Image.network(listaTerror[index].image),
                                      ListTile(
                                        title: Text(
                                          listaTerror[index].titulo,
                                          style: TextStyle(fontSize: 20),
                                        ),
                                        subtitle: Text(
                                            listaTerror[index].autor,
                                            style: TextStyle(fontSize: 16)),
                                        onTap: () {
                                          Navigator.pushNamed(
                                              context, "/telacadastro",
                                              arguments: listaDrama[index].id);
                                        },
                                      ),
                                    ]),
                                  ),
                                );
                              });
                      }
                    }),
              ),
            ],
          ),
        ));
  }
}
