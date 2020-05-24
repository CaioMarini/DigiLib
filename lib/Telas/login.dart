import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() => runApp(Login());

class Login extends StatelessWidget {
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
                    fontSize: 90,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Image.asset('assets/imagens/backless.png', scale: 1.859),
                SizedBox(height: 55),
                TextField(
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
                ButtonTheme(
                  minWidth: 200.0,
                  height: 40.0,
                  child: RaisedButton(
                    color: Colors.white,
                    child: Text(
                      'Login',
                      style: TextStyle(height: 1.5, fontSize: 22),
                    ),
                    onPressed: () {
                      Alert(
                        context: context,
                        title: "Alerta!!",
                        desc: "Login suspenso, indo para tela inicial!",
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
                              Navigator.pushNamed(context, "/telaInicial");
                            },
                            width: 120,
                          )
                        ],
                      ).show();
                    },
                  ),
                ),
                SizedBox(height: 20),
                ButtonTheme(
                  minWidth: 200.0,
                  height: 40.0,
                  child: RaisedButton(
                    color: Colors.white,
                    child: Text(
                      'Cadastrar',
                      style: TextStyle(height: 1.5, fontSize: 22),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, "/cadastro");
                    },
                  ),
                ),
              ],
            )),
          ),
        ),
      ),
    );
  }
}
