import 'dart:async';

import 'package:app_livraria/model/Cadastro.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dialogs/flutter_dialogs.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() => runApp(TelaLogin());

class TelaLogin extends StatefulWidget {
  @override
  _TelaLoginState createState() => _TelaLoginState();
}

class _TelaLoginState extends State<TelaLogin> {
  TextEditingController txtUsuario = TextEditingController();
  TextEditingController txtSenha = TextEditingController();
  final db = Firestore.instance;
  final String colecao = "logins";
  bool loginValidation = false;
  int index;

  List<Cadastrar> lista = List();
  StreamSubscription<QuerySnapshot> listen;

  @override
  void initState() {
    super.initState();

    //cancelar o listen, caso a coleção esteja vazia.
    listen?.cancel();

    //retornar dados da coleção e inserir na lista dinâmica
    listen = db.collection(colecao).snapshots().listen((res) {
      setState(() {
        lista = res.documents
            .map((doc) => Cadastrar.fromMap(doc.data, doc.documentID))
            .toList();
      });

      
    });
  }

  @override
  void dispose() {
    listen?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          
          padding: EdgeInsets.symmetric(horizontal: 70),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/imagens/biblioteca.jpg"),
              fit: BoxFit.cover,
            ),
            color: Colors.white,
          ),
          child: Center(
            child: SingleChildScrollView(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                
                SizedBox(height: 2),
                Text(
                  "DigiLib",
                  style: TextStyle(
                    color: Colors.black,
                    height: 1.5,
                    fontSize: 45,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Image.asset('assets/imagens/backless.png', scale: 1.859),
                SizedBox(height: 55),
                TextField(
                  controller: txtUsuario,
                  decoration: InputDecoration(
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 5.0),
                      prefixIcon: Icon(Icons.person),
                      border: OutlineInputBorder(),
                      fillColor: Colors.white,
                      filled: true,
                      hintText: 'Login'),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: txtSenha,
                  obscureText: true,
                  decoration: InputDecoration(
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 50.0),
                      prefixIcon: Icon(Icons.lock),
                      border: OutlineInputBorder(),
                      fillColor: Colors.white,
                      filled: true,
                      hintText: 'Password'),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 130,
                      child: ButtonTheme(
                        minWidth: 200.0,
                        height: 40.0,
                        child: RaisedButton(
                          color: Colors.white,
                          child: Text(
                            'Login',
                            style: TextStyle(height: 1.5, fontSize: 22),
                          ),
                          onPressed: () {
                            loginValidation = false;
                            int i = 0;
                            while(i < lista.length){
                              if(lista[i].usuario == txtUsuario.text && lista[i].senha == txtSenha.text){
                                loginValidation = true;
                                index = i;
                              }
                              i = i + 1;
                            }


                            if(loginValidation){
                              Navigator.pushNamed(context, "/telaInicial",arguments: lista[index].id);
                            }
                            else{
                              
                              Alert(
                              context: context,
                              title: "Alerta!!",
                              desc: "Usuario ou senha invalidos",
                              image: Image.asset('assets/imagens/backless.png',
                                  scale: 4),
                              buttons: [
                                DialogButton(
                                  child: Text(
                                    "OK",
                                    style:
                                        TextStyle(color: Colors.white, fontSize: 20),
                                  ),
                                  onPressed: () {
                                    Navigator.pop(context);
                                    
                                  },
                                  width: 120,
                                )
                              ],
                            ).show();
                            }
                            
                          },
                        ),
                      ),
                  ),
                  SizedBox(
                      width: 20,
                    ),
                  SizedBox(
                      width: 130,
                      child: ButtonTheme(
                      minWidth: 200.0,
                      height: 40.0,
                      child: RaisedButton(
                        color: Colors.white,
                        child: Text(
                          'Cadastrar',
                          style: TextStyle(height: 1.5, fontSize: 22),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, "/telaCadastro");
                        },
                      ),
                    ),
                  ),

                  ]
                ),
              ],
            )),
          ),
        ),
      ),
    );
  }

  void _deletar(BuildContext context, DocumentSnapshot doc, int posicao) {
    showPlatformDialog(
      context: context,
      builder: (_) => BasicDialogAlert(
        title: Text("Tem certeza que deseja excluir?"),
        actions: <Widget>[
          BasicDialogAction(
            title: Text("Sim"),
            onPressed: () {
              
              //deletar o item no Firebase
              db.collection(colecao).document(doc.documentID).delete();

              //atualizar a lista
              setState(() {
                lista.removeAt(posicao);
              });
              Navigator.pop(context);

            },
          ),
          BasicDialogAction(
            title: Text("Não"),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }


}
