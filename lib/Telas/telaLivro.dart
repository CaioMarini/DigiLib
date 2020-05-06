import 'package:flutter/material.dart';

class TelaLivro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
            //colocar aqui o retonrno para a tela anterior
            //Navigator.pop( context, ); //fazndo o pop volta para a tela que estava
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () {
              // do something
              Navigator.pushNamed(context, "/tela1");
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        //padding: EdgeInsets.all(10.0),
        padding: EdgeInsets.fromLTRB(
            20 /*left*/, 0.5 /*top*/, 18 /*right*/, 5 /*bottom*/),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white, width: 1),
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(
                //colors: [Colors.white, Colors.grey[350]],
                colors: [Colors.white, Colors.white],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight),
          ),
          child: Center(
            child: Column(
              children: <Widget>[
                Padding(
                  //padding: const EdgeInsets.all(50.0),
                  padding: EdgeInsets.fromLTRB(
                      20 /*left*/, 10 /*top*/, 20 /*right*/, 1 /*bottom*/),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          height: MediaQuery.of(context).size.height / 2.3,
                          width: MediaQuery.of(context).size.width / 2.3,
                          //color: Colors.red,
                          child: Image.asset("assets/imagens/livro2.jpg"),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        "Harleen",
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
                        "Autor",
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
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
                          "massa libero. Sed nec massa pulvinar tortor scelerisque viverra. "
                          "Sed pulvinar nisl sit amet velit varius vestibulum. In et sapien turpis. "
                          "Mauris quis arcu eu eros ornare hendrerit sit amet nec nisi. Curabitur vestibulum "
                          "libero et magna ultricies maximus. Maecenas et lobortis felis. Nam feugiat felis "
                          "ac blandit gravida.",
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
                    Navigator.pushNamed(context, "/tela3");
                    //Navigator.pop( context, );
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
