import "package:flutter/material.dart";

class TelaInicial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("DigiLibi"),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(color: Colors.blueGrey),
                child: Text(
                  "DigiLibi",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.message),
                title: Text("Livro"),
                onTap: () {
                  Navigator.pop(
                      context); //fecha o drawer,assim quando for para a proxima tela e retornar dela, o drawer fica fechado
                  Navigator.pushNamed(context, "/telaLivro");
                },
              ),
              ListTile(
                leading: Icon(Icons.people),
                title: Text("Informações"),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, "/telaInfo");
                },
              ),
              ListTile(
                leading: Icon(Icons.message),
                title: Text("Aventura"),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, "/telaLivro");
                },
              ),ListTile(
                leading: Icon(Icons.message),
                title: Text("Ação"),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, "/telaLivro");
                },
              ),ListTile(
                leading: Icon(Icons.message),
                title: Text("Drama"),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, "/telaLeitura");
                },
              ),

            ],
          ),
        ),
        body: SingleChildScrollView(
          //padding: EdgeInsets.all(10.0),
          padding: EdgeInsets.fromLTRB(
              20 /*left*/, 0.5 /*top*/, 18 /*right*/, 5 /*bottom*/),
          child: Center(
            


          ),
        ));
  }
}
