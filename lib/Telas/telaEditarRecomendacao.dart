import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../model/Recomendacao.dart';
import '../model/Cadastro.dart';

class TelaEditarRecomendacao extends StatefulWidget {
  @override
  _TelaEditarRecomendacaoState createState() => _TelaEditarRecomendacaoState();
}

class _TelaEditarRecomendacaoState extends State<TelaEditarRecomendacao> {
  //controles para os campos de texto
  TextEditingController txtLivro = TextEditingController();
  TextEditingController txtDescricao = TextEditingController();
  final String colecao = "recomendacoes";
  final String loginControl = "logins";
  bool salvarVisibleControl = false;
  String usuario;

  //instância do Firebase
  var db = Firestore.instance;

  List<Recomendar> lista = List();
  List<Cadastrar> listaLogin = List();
  StreamSubscription<QuerySnapshot> listen;
  StreamSubscription<QuerySnapshot> listenLogins;

  @override
  void initState() {
    super.initState();

    //cancelar o listen, caso a coleção esteja vazia.
    listen?.cancel();
    listenLogins?.cancel();

    //retornar dados da coleção e inserir na lista dinâmica
    listen = db.collection(colecao).snapshots().listen((res) {
      setState(() {
        lista = res.documents
            .map((doc) => Recomendar.fromMap(doc.data, doc.documentID))
            .toList();
      });

      
    });

    listenLogins = db.collection(loginControl).snapshots().listen((res) {
      setState(() {
        listaLogin = res.documents
            .map((doc) => Cadastrar.fromMap(doc.data, doc.documentID))
            .toList();
      });

      
    });
  }

  void getDocumento(String idDocumento) async {
    //Recuperar o documento no Firestore
    DocumentSnapshot doc =
        await db.collection(colecao)
        .document(idDocumento).get();

    setState(() {
      txtLivro.text = doc.data["livro"];
      txtDescricao.text = doc.data["descricao"];
    });
  }

  @override
  void dispose() {
    listen?.cancel();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    List<String> idDocumento = ModalRoute.of(context).settings.arguments;
    List<Recomendar> listaUsuario = List();
    
    int i = 0;
    while(i < listaLogin.length){
      if(listaLogin[i].id == idDocumento[1]){
        usuario = listaLogin[i].usuario;
        salvarVisibleControl = true;
        int k = 0;
        while(k < lista.length){
          if(lista[k].usuario == listaLogin[i].usuario){
            listaUsuario.add(lista[k]);
          }
          k = k + 1;
        }
      }
      i = i + 1;
    }
    if (idDocumento != null) {
      if (txtLivro.text == "" && txtDescricao.text == ""){
        getDocumento(idDocumento[0]);
      }
    }
    
    return Scaffold(
      
      body: Container(
        
        padding: EdgeInsets.symmetric( horizontal: 100),
          decoration: BoxDecoration(
            color: Colors.white,
          ),

        child: Center(
          child: SingleChildScrollView(
            child:  Column(
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
                SizedBox(height: 20),
                TextField(
                  enabled: salvarVisibleControl,
                  controller: txtLivro,
                  decoration: InputDecoration(        
                    contentPadding: const EdgeInsets.symmetric(horizontal: 50.0),
                    prefixIcon: Icon(Icons.book),
                    border: OutlineInputBorder(),
                    fillColor: Colors.white,
                    filled: true,
                    hintText: 'Livro',         
                  ),
                ),
                SizedBox(height: 20,),
                TextField(
                  enabled: salvarVisibleControl,
                  controller: txtDescricao,
                  minLines: 10,
                  maxLines: 10,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    fillColor: Colors.white,
                    filled: true,
                    hintText: 'Descrição',
                  ),
                ),
              
                SizedBox(height: 20),
                SizedBox(
                  width: 130,
                  child: Visibility(
                    child: RaisedButton(
                    color: Colors.white,
                    child: Text(
                      'Salvar',
                      style: TextStyle(height: 1.5, fontSize: 22),
                    ),
                    onPressed: () {
                      if (idDocumento[0] == null && listaUsuario.length < 3){                           
                        inserir(context,Recomendar(idDocumento[0], txtLivro.text, usuario, txtDescricao.text));
                      }
                      else if(idDocumento[0] == null && listaUsuario.length >= 3){
                        Alert(
                          context: context,
                          title: "Alerta!!",
                          desc: "Máximo de Recomendações\natingido",
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
                      else{  
                        atualizar(context,Recomendar(idDocumento[0], txtLivro.text, usuario, txtDescricao.text));
                      }
                    }
                    ),
                    visible: salvarVisibleControl,
                  )
                  
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 130,
                  child: RaisedButton(
                    color: Colors.white,
                    child: Text(
                      'Cancelar',
                      style: TextStyle(height: 1.5, fontSize: 22),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  
  void atualizar(BuildContext context, Recomendar recomendacao) async{
    await db.collection("recomendacoes").document(recomendacao.id)
      .updateData(
        {
          "livro": recomendacao.livro,
          "descricao": recomendacao.descricao
        }
      );
    Navigator.pop(context);
  }

  
  void inserir(BuildContext context, Recomendar recomendacao) async{
    await db.collection("recomendacoes")
      .add(
        {
          "livro": recomendacao.livro,
          "usuario": recomendacao.usuario,
          "descricao": recomendacao.descricao
        }
      );
    Navigator.pop(context);
  }  

}
