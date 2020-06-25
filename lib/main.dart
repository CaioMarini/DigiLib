
import 'package:app_livraria/Telas/telaLivro.dart';
import 'package:flutter/material.dart';
import 'Telas/telaCadastro.dart';
import 'Telas/telaLogin.dart';
import 'Telas/telaInformacao.dart';
import 'Telas/telaInicial.dart';
import 'Telas/telaRecomendacao.dart';
import 'Telas/telaEditarRecomendacao.dart';
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
      initialRoute: "/telaLogin",
      routes: {
        "/telaInfo": (context) => TelaInformacao(),
        "/telaInicial": (context) => TelaInicial(),
        "/telaLivro" : (context) => TelaLivro(),
        "/telaLeitura": (context) => OpenBooks(),
        "/telaLogin": (context) => TelaLogin(),
        "/telaCadastro": (context) => TelaCadastro(),
        "/telaRecomendacao": (context) => TelaRecomendacao(),
        "/telaEditarRecomendacao": (context) => TelaEditarRecomendacao(),
      }));
}
