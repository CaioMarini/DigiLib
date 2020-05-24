import 'package:flutter/material.dart';

class TelaInformacao extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
          leading: IconButton(
            tooltip: 'Retornar ao Menu',
            icon: const Icon(Icons.arrow_back),
            color: Colors.white,
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
                          "Caio   Marini",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black,
                              height: 1,
                              fontSize: 36,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Expanded(
                        child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.white70, width: 2),
                              borderRadius: BorderRadius.circular(10),
                              gradient: LinearGradient(
                                  colors: [Colors.blueGrey[800], Colors.blueGrey],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(5.5),
                              child: Image.asset("assets/imagens/caio.jpg",scale: 1,),
                            )
                            ),
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
                          "Henrique Colombari",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black,
                              height: 1,
                              fontSize: 36,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Expanded(
                        child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.white70, width: 2),
                              borderRadius: BorderRadius.circular(10),
                              gradient: LinearGradient(
                                  colors: [Colors.blueGrey[800], Colors.blueGrey],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(5.5),
                              child: Image.asset("assets/imagens/henrique.jpg",scale: 1,),
                            )
                            ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
