import 'package:flutter/material.dart';
import '../model/Livro.dart';

class TelaLivro extends StatefulWidget {
  @override
  _TelaLivroState createState() => _TelaLivroState();
}

class _TelaLivroState extends State<TelaLivro> {
  String sinopse = "";
  String titulo = "";
  String autor = "";
  String imagem = "";
  String pdf = "";

  @override
  Widget build(BuildContext context) {
    final Livro livro = ModalRoute.of(context).settings.arguments;
    sinopse = livro.sinopse;
    titulo = livro.titulo;
    autor = livro.autor;
    imagem = livro.image;
    pdf = livro.pdf;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "DigiLib",
        ),
        leading: IconButton(
          tooltip: 'Retornar a Tela Anterior',
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(
              context,
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(
            20 /*left*/, 0.5 /*top*/, 18 /*right*/, 5 /*bottom*/),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white, width: 1),
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(
                colors: [Colors.white, Colors.white],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight),
          ),
          child: Center(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(
                      20 /*left*/, 10 /*top*/, 20 /*right*/, 1 /*bottom*/),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          height: MediaQuery.of(context).size.height / 2.3,
                          width: MediaQuery.of(context).size.width / 2.3,
                          child: Image.network(imagem),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        titulo,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black,
                            height: 2,
                            fontSize: 36,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        autor,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black,
                            height: 1,
                            fontSize: 20,
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Text(
                          sinopse,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black,
                              height: 1,
                              fontSize: 20,
                              fontWeight: FontWeight.normal),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                RaisedButton(
                  color: Colors.blueGrey,
                  child: Text(
                    "Ler",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        height: 1,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, "/telaLeitura",arguments: pdf);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
