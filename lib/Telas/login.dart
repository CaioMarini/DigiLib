import 'package:flutter/material.dart';

// Change this to fit the PDF file you are using to test.
const String _documentPath = 'assets/imagens/alice_no_pais_das_maravihas.pdf';

void main() => runApp(Login());

class Login extends StatelessWidget {
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
          padding: EdgeInsets.symmetric(horizontal: 100),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/imagens/background.png"),
              fit: BoxFit.cover,
            ),
            color: Colors.white,
          ),
          child: Center(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 50),
              Text("DigLib"),
              Image.asset(
                'assets/imagens/backless.png',
                scale: 4.0,
              ),
              SizedBox(height: 50),
              TextField(
                decoration: InputDecoration(
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 50.0),
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(),
                    fillColor: Colors.white,
                    filled: true,
                    hintText: 'Login'),
              ),
              SizedBox(height: 50),
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
              SizedBox(height: 100),
              ButtonTheme(
                minWidth: 200.0,
                height: 30.0,
                child: RaisedButton(
                  color: Colors.white,
                  child: Text('Login'),
                  onPressed: () {
                    print("salve");
                    Navigator.pushNamed(context, "/telaInicial");
                  },
                ),
              ),
              ButtonTheme(
                minWidth: 200.0,
                height: 30.0,
                child: RaisedButton(
                  color: Colors.white,
                  child: Text('Create'),
                  onPressed: () {},
                ),
              ),
            ],
          )),
        ),
      ),
    );
  }
}
