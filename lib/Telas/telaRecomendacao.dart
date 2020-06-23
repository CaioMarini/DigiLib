import 'dart:async';
import 'package:app_livraria/model/Cadastro.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dialogs/flutter_dialogs.dart';
import '../model/Recomendacao.dart';
import 'telaCadastro.dart';


class TelaRecomendacao extends StatefulWidget {
  @override
  _TelaRecomendacaoState createState() => _TelaRecomendacaoState();
}

class _TelaRecomendacaoState extends State<TelaRecomendacao> {
  //Conexão Fluter+Firebase
  final db = Firestore.instance;
  final String colecao = "recomendacoes";
  final String usuario = "logins";
  bool recomendacaoControl = false;
  int count = 0;

  //Lista dinâmica para manipulação dos dados
  List<Recomendar> lista = List();
  List<Cadastrar> listaLogins = List();

  //Stream para "ouvir" o Firebase
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

    listenLogins = db.collection(usuario).snapshots().listen((res) {
      setState(() {
        listaLogins = res.documents
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
    final String idDocumento = ModalRoute.of(context).settings.arguments;
    List<Recomendar> listaUsuario = List();
    if(!recomendacaoControl){
      int i = 0;
      while(i < listaLogins.length){
        if(listaLogins[i].id == idDocumento){
          int k = 0;
          while(k < lista.length){
            if(lista[k].usuario == listaLogins[i].usuario){
              listaUsuario.add(lista[k]);
            }
            k = k + 1;
          }
        }
        i = i + 1;
      }
    }
    
    return Scaffold(
      appBar: AppBar(
        title: Text("DigLib"),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.person,
              color: Colors.white,
            ),
            onPressed: () {
              setState(() {
                recomendacaoControl = false;
              });
            },
          ),
          IconButton(
            icon: Icon(
              Icons.people,
              color: Colors.white,
            ),
            onPressed: () {
              setState(() {
                recomendacaoControl = true;
              });
            },
          )
        ],
      ),

      //
      // APRESENTAÇÃO DOS DADOS
      //
      body: StreamBuilder<QuerySnapshot>(

          //fonte de dados
          stream: db.collection(colecao).snapshots(),

          //exibição dos dados
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
                return Center(child: CircularProgressIndicator());

              default:
                //documentos retornados do Firebase
                List<DocumentSnapshot> docs = snapshot.data.documents;
                if(!recomendacaoControl){
                  
                  return ListView.builder(
                    itemCount: listaUsuario.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(
                          listaUsuario[index].livro,
                          style: TextStyle(fontSize: 20),
                        ),
                        subtitle: Text(listaUsuario[index].descricao + "\nPor: " + listaUsuario[index].usuario,
                            style: TextStyle(fontSize: 16)),
                        trailing: IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              _deletar(context, docs[index], index);
                            }
                          ),
                        onTap: () {
                          Navigator.pushNamed(
                            context, 
                            "/telacadastro", 
                            arguments: listaLogins[index].id);
                        },
                      );
                    }
                );
              }       
              else{
                return ListView.builder(
                    itemCount: lista.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(
                          lista[index].livro,
                          style: TextStyle(fontSize: 20),
                        ),
                        subtitle: Text(lista[index].descricao + "\nPor: " + lista[index].usuario,
                            style: TextStyle(fontSize: 16)),
                      );
                    }
                );
              }
            }
          }
        ),

      floatingActionButton: FloatingActionButton(
        foregroundColor: Colors.white,
        backgroundColor: Colors.blueGrey,
        elevation: 0,
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, "/cadastro", arguments: null);
        },
      ),
      backgroundColor: Colors.brown[50],
    );
  }

  //deletar item
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

  void _adicionar(BuildContext context, DocumentSnapshot doc){
    Recomendar dados;

    showPlatformDialog(
      context: context,
      builder: (_) => BasicDialogAlert(
        title: Text("Adicione as informações nos campos corretos"),
        actions: <Widget>[
          BasicDialogAction(
            title: Text("Sim"),
            onPressed: () {

              
              //deletar o item no Firebase
              //db.collection(colecao).document(doc.documentID).setData();
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
