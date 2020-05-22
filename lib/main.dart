import 'package:app_livraria/Telas/telaLivro.dart';
import 'package:flutter/material.dart';
import 'Telas/login.dart';
import 'Telas/telaInformacao.dart';
import 'Telas/telaInicial.dart';

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
      initialRoute: "/login",
      routes: {
        "/telaInfo": (context) => TelaInformacao(),
        "/telaLivro": (context) => TelaLivro(),
        //"/telaLeitura1": (context) => TelaLeituraLivro(),
        "/telaInicial": (context) => TelaInicial(),
        "/telaLeitura": (context) => OpenBooks(),
        "/login": (context) => Login(),

      }));
}
