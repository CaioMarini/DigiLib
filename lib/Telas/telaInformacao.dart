import 'package:flutter/material.dart';

class TelaInformacao extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          //leading: Icon(Icons.favorite),
          centerTitle: true,
          title: Text(
            "DigiLib",
            style: TextStyle(
                color: Colors.black,
                height: 1,
                fontSize: 33,
                fontWeight: FontWeight.bold),
          ),
          leading: IconButton(
            tooltip: 'Retornar ao Menu',
            icon: const Icon(Icons.arrow_back),
            color: Colors.blue[600],
            onPressed: () {
              //colocar aqui o retonrno para o menu
              Navigator.pop(
                context,
              );
            },
          ),
        ),
        body: SingleChildScrollView(
          //padding: EdgeInsets.all(10.0),
          padding: EdgeInsets.fromLTRB(
              20 /*left*/, 0.5 /*top*/, 18 /*right*/, 5 /*bottom*/),
          child: Center(
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        "Tema Escolhido",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black,
                            height: 3,
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
                        " O tema da DigiLib é a criação de uma biblioteca online",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black,
                            height: 1,
                            fontSize: 24,
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        "Objetivo",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black,
                            height: 3,
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
                        "A DigLib tem o objetvo de ser uma biblioteca online,"
                        " na qual é possivel ler diversos livros sem sair do comforto da sua casa ",
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            color: Colors.black,
                            height: 1.2,
                            fontSize: 24,
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          "Dev A",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black,
                              height: 2,
                              fontSize: 36,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Expanded(
                        child: Image.asset("assets/imagens/dev.jpg"),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          "Dev A",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black,
                              height: 2,
                              fontSize: 36,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Expanded(
                        child: Image.asset("assets/imagens/dev.jpg"),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
        );
  }
}
