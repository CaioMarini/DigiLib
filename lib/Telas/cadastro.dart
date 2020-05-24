import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';



void main() => runApp(Cadastro());
class Cadastro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        
        appBar: AppBar(
          title: Text("DigLib"),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.book,
                color: Colors.white,
                
              ),
              onPressed: () {
                // do something
              },
            )
          ],
          
        ),
        body: Container(
          padding: EdgeInsets.symmetric( horizontal: 100),
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
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,       
                children: [
                SizedBox(height: 50),
                Text("DigLib"),
                Image.asset('assets/imagens/backless.png', scale: 4),
                SizedBox(height: 50),
                TextField(
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 50.0),
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(),
                    fillColor: Colors.white,
                    filled: true,
                    hintText: 'Email'
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 50.0),
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(),
                    fillColor: Colors.white,
                    filled: true,
                    hintText: 'Usuário'
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 50.0),
                    prefixIcon: Icon(Icons.lock),
                    border: OutlineInputBorder(),
                    fillColor: Colors.white,
                    filled: true,
                    hintText: 'Senha'
                  ),
                ),
                SizedBox(height: 20),
                ButtonTheme(
                  minWidth: 200,
                  height: 30,
                  child: RaisedButton(
                    color: Colors.white,
                    child: Text('Cadastrar'),
                    onPressed: () {
                      Alert(
                        context: context,
                        title: "Alerta!!",
                        desc: "Cadastro suspenso, indo para tela inicial!",
                        image: Image.asset('assets/imagens/backless.png', scale: 4),
                        buttons: [
                          DialogButton(
                            child: Text(
                              "OK",
                              style: TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            onPressed: () {                            
                              
                              Navigator.pushNamed(context, "/telaInicial");
                              
                            },
                            width: 120,
                          )
                        ],
                      ).show();
                      
                    },
                  ),
                ),
                
              ],
              )
            ),
            
          ),     
        ),    
      ),
    );
  }
}