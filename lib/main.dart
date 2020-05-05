import 'package:app_livraria/telaInformacao.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "DigLib",
      theme: ThemeData(
        textTheme: TextTheme(button: TextStyle(color: Colors.green)),//Cor padrao do texto dos botoes
        primaryColor: Colors.blueGrey,//Cor padrao da aplicacao
      ),
      initialRoute: "/tela1",
      routes: {
        "/tela1": (context) => TelaInformacao(),
      }));
}
