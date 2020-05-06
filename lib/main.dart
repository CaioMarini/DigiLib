import 'package:app_livraria/Telas/telaLivro.dart';
import 'package:flutter/material.dart';
import 'Telas/telaInformacao.dart';
import 'Telas/telaLeituraLivro.dart';

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "DigLib",
      theme: ThemeData(
        textTheme: TextTheme(
            button: TextStyle(
                color: Colors.green)), //Cor padrao do texto dos botoes
        primaryColor: Colors.blueGrey, //Cor padrao da aplicacao
      ),
      initialRoute: "/tela2",
      routes: {
        "/tela1": (context) => TelaInformacao(),
        "/tela2": (context) => TelaLivro(),
        "/tela3": (context) => TelaLeituraLivro(),

      }));
}
