import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../model/Cadastro.dart';

class TelaCadastro extends StatefulWidget {
  @override
  _TelaCadastroState createState() => _TelaCadastroState();
}

class _TelaCadastroState extends State<TelaCadastro> {
  //controles para os campos de texto
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtUsuario = TextEditingController();
  TextEditingController txtSenha = TextEditingController();
  bool _emailValidate = false;
  bool _emailControl = false;
  bool _usuarioValidate = false;
  bool _senhaValidate = false;
  String emailErrorControl = "";
  String usuarioErrorControl = "";
  final String colecao = "logins";

  //instância do Firebase
  var db = Firestore.instance;

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

  void getDocumento(String idDocumento) async {
    //Recuperar o documento no Firestore
    DocumentSnapshot doc =
        await db.collection("logins")
        .document(idDocumento).get();

    setState(() {
      txtEmail.text = doc.data["email"];
      txtUsuario.text = doc.data["usuario"];
      txtSenha.text = doc.data["senha"];
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

    if (idDocumento != null) {
      if (txtEmail.text == "" && txtUsuario.text == "" && txtSenha.text == ""){
        getDocumento(idDocumento);
      }
    }
    else{
      _emailControl = true;
    }

    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric( horizontal: 50),
          decoration: BoxDecoration(
            
            image: DecorationImage(
              image: AssetImage("assets/imagens/biblioteca.jpg"),
              
              fit: BoxFit.cover,
            ),
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
                SizedBox(height: 55),
                TextField(
                  enabled: _emailControl,
                  controller: txtEmail,
                  decoration: InputDecoration(        
                    contentPadding: const EdgeInsets.symmetric(horizontal: 50.0),
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(),
                    fillColor: Colors.white,
                    filled: true,
                    hintText: 'Email',
                    errorText: _emailValidate ? emailErrorControl : null
                    
                  ),
                ),
                SizedBox(height: 20,),
                TextField(
                  controller: txtUsuario,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 50.0),
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(),
                    fillColor: Colors.white,
                    filled: true,
                    hintText: 'Usuário',
                    errorText: _usuarioValidate ? usuarioErrorControl : null
                  ),
                ),
                SizedBox(height: 20,),
                TextField(
                  controller: txtSenha,
                  obscureText: true,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 50.0),
                    prefixIcon: Icon(Icons.lock),
                    border: OutlineInputBorder(),
                    fillColor: Colors.white,
                    filled: true,
                    hintText: 'Senha',
                    errorText: _senhaValidate ? 'Campo não pode ser vazio' : null
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 130,
                      child: RaisedButton(
                        color: Colors.white,
                        child: Text(
                          'Salvar',
                          style: TextStyle(height: 1.5, fontSize: 22),
                        ),
                        onPressed: () {
                          _emailValidate = false;
                          _usuarioValidate = false;
                          _senhaValidate = false;
                            if (idDocumento == null){
                              int i = 0;
                                while(i < lista.length){
                                  if(lista[i].email == txtEmail.text){
                                    setState(() {
                                      _emailValidate = true;
                                      emailErrorControl = "Email já cadastrado";
                                    });                  
                                  }

                                  if(lista[i].usuario == txtUsuario.text){
                                    setState(() {
                                      _usuarioValidate = true;
                                      usuarioErrorControl = "Usuario já cadastrado";
                                    });
                                  }
                                  i = i + 1;
                                }
                              if(txtEmail.text == ""|| txtSenha.text == "" || txtUsuario.text == "" 
                              || _emailValidate || _usuarioValidate){
                                
                                
                                if(txtEmail.text == ""|| !txtEmail.text.contains("@")){
                                  setState(() {
                                    _emailValidate = true;
                                    emailErrorControl = "Email inválido";
                                  });
                                }
                                
                                if(txtUsuario.text ==""){
                                  setState(() {
                                    _usuarioValidate = true;
                                    usuarioErrorControl = "Campo não pode ser vazio";
                                  });
                                }
                                
                                if(txtSenha.text == ""){
                                  setState(() {
                                    _senhaValidate = true;
                                  });
                                }
                                
                                
                              }
                              else{
                                inserir(context,Cadastrar(idDocumento, txtEmail.text, txtUsuario.text, txtSenha.text));
                              }
                              

                            }
                            else{
                              int i = 0;
                                while(i < lista.length){
                                  if(lista[i].usuario == txtUsuario.text){
                                    setState(() {
                                      _usuarioValidate = true;
                                      usuarioErrorControl = "Usuario já cadastrado";
                                    });
                                  }
                                  i = i + 1;
                                }
                              if(txtSenha.text == "" || txtUsuario.text == "" || _usuarioValidate){
                                
                                
                               if(txtUsuario.text ==""){
                                  setState(() {
                                    _usuarioValidate = true;
                                    usuarioErrorControl = "Campo não pode ser vazio";
                                  });
                                }
                                
                                if(txtSenha.text == ""){
                                  setState(() {
                                    _senhaValidate = true;
                                  });
                                }
                                
                                
                              }
                              else{
                                atualizar(context,Cadastrar(idDocumento, txtEmail.text, txtUsuario.text, txtSenha.text));
                              }
                              

                            }
                            }
                      ),
                    ),
                    SizedBox(
                      width: 30,
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  
  void atualizar(BuildContext context, Cadastrar usuario) async{
    await db.collection("logins").document(usuario.id)
      .updateData(
        {
          "usuario": usuario.usuario,
          "senha": usuario.senha
        }
      );
    Navigator.pop(context);
  }

  
  void inserir(BuildContext context, Cadastrar login) async{
    await db.collection("logins")
      .add(
        {
          "email": login.email,
          "usuario": login.usuario,
          "senha": login.senha
        }
      );
    Navigator.pop(context);
  }  

}
