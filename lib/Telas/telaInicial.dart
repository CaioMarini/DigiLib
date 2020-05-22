
import "package:flutter/material.dart";
/*
Container Aventura(String imagemVal, String titulo, String autor) {
  return Container(
    width: 160.0,
    color: Colors.white,
    child: Card(
      child: Wrap(
        children: <Widget>[
          Image.asset(imagemVal),
          ListTile(
            title: Text(titulo),
            subtitle: Text(autor),
            onTap: () {},
          )
        ],
      ),
    ),
  );
}
*/
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
                leading: Icon(Icons.explore),
                title: Text(
                  "Aventura",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
                onTap: () {
                  Navigator.pop(
                      context); //fecha o drawer,assim quando for para a proxima tela e retornar dela, o drawer fica fechado
                  Navigator.pushNamed(context, "/telaLivro");
                },
              ),
              ListTile(
                leading: Icon(Icons.sentiment_very_satisfied),
                title: Text(
                  "Comédia",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, "/telaLivro");
                },
              ),
              ListTile(
                leading: Icon(Icons.movie_filter),
                title: Text(
                  "Drama",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, "/telaLeitura");
                },
              ),
              ListTile(
                leading: Icon(Icons.favorite_border),
                title: Text(
                  "Romance",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, "/telaLivro");
                },
              ),
              ListTile(
                leading: Icon(Icons.sentiment_very_dissatisfied),
                title: Text(
                  "Terror",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, "/telaLivro");
                },
              ),
              ListTile(
                leading: Icon(Icons.info_outline),
                title: Text(
                  "Informações",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, "/telaInfo");
                },
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(vertical: 20.0),
                height: 300.0,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    Container(
                      width: 160.0,
                      color: Colors.white,
                      child: Card(
                        child: Wrap(
                          children: <Widget>[
                            Image.asset("assets/imagens/livro2.jpg"),
                            ListTile(
                              title: Text("Harleen"),
                              subtitle: Text("Autor"),
                              onTap: () {
                                Navigator.pushNamed(context, "/telaLivro");
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 160.0,
                      color: Colors.white,
                      child: Card(
                        child: Wrap(
                          children: <Widget>[
                            Image.asset("assets/imagens/livro2.jpg"),
                            ListTile(
                              title: Text("Harleen"),
                              subtitle: Text("Autor"),
                              onTap: () {
                                Navigator.pushNamed(context, "/telaLivro");
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 160.0,
                      color: Colors.white,
                      child: Card(
                        child: Wrap(
                          children: <Widget>[
                            Image.asset("assets/imagens/livro2.jpg"),
                            ListTile(
                              title: Text("Harleen"),
                              subtitle: Text("Autor"),
                              onTap: () {
                                Navigator.pushNamed(context, "/telaLivro");
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 160.0,
                      color: Colors.white,
                      child: Card(
                        child: Wrap(
                          children: <Widget>[
                            Image.asset("assets/imagens/livro2.jpg"),
                            ListTile(
                              title: Text("Harleen"),
                              subtitle: Text("Autor"),
                              onTap: () {
                                Navigator.pushNamed(context, "/telaLivro");
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 160.0,
                      color: Colors.white,
                      child: Card(
                        child: Wrap(
                          children: <Widget>[
                            Image.asset("assets/imagens/livro2.jpg"),
                            ListTile(
                              title: Text("Harleen"),
                              subtitle: Text("Autor"),
                              onTap: () {
                                Navigator.pushNamed(context, "/telaLivro");
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 20.0),
                height: 300.0,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    Container(
                      width: 160.0,
                      color: Colors.white,
                      child: Card(
                        child: Wrap(
                          children: <Widget>[
                            Image.asset("assets/imagens/livro2.jpg"),
                            ListTile(
                              title: Text("Harleen"),
                              subtitle: Text("Autor"),
                              onTap: () {
                                Navigator.pushNamed(context, "/telaLivro");
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 160.0,
                      color: Colors.white,
                      child: Card(
                        child: Wrap(
                          children: <Widget>[
                            Image.asset("assets/imagens/livro2.jpg"),
                            ListTile(
                              title: Text("Harleen"),
                              subtitle: Text("Autor"),
                              onTap: () {
                                Navigator.pushNamed(context, "/telaLivro");
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 160.0,
                      color: Colors.white,
                      child: Card(
                        child: Wrap(
                          children: <Widget>[
                            Image.asset("assets/imagens/livro2.jpg"),
                            ListTile(
                              title: Text("Harleen"),
                              subtitle: Text("Autor"),
                              onTap: () {
                                Navigator.pushNamed(context, "/telaLivro");
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 160.0,
                      color: Colors.white,
                      child: Card(
                        child: Wrap(
                          children: <Widget>[
                            Image.asset("assets/imagens/livro2.jpg"),
                            ListTile(
                              title: Text("Harleen"),
                              subtitle: Text("Autor"),
                              onTap: () {
                                Navigator.pushNamed(context, "/telaLivro");
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 160.0,
                      color: Colors.white,
                      child: Card(
                        child: Wrap(
                          children: <Widget>[
                            Image.asset("assets/imagens/livro2.jpg"),
                            ListTile(
                              title: Text("Harleen"),
                              subtitle: Text("Autor"),
                              onTap: () {
                                Navigator.pushNamed(context, "/telaLivro");
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 20.0),
                height: 300.0,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    Container(
                      width: 160.0,
                      color: Colors.white,
                      child: Card(
                        child: Wrap(
                          children: <Widget>[
                            Image.asset("assets/imagens/livro2.jpg"),
                            ListTile(
                              title: Text("Harleen"),
                              subtitle: Text("Autor"),
                              onTap: () {
                                Navigator.pushNamed(context, "/telaLivro");
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 160.0,
                      color: Colors.white,
                      child: Card(
                        child: Wrap(
                          children: <Widget>[
                            Image.asset("assets/imagens/livro2.jpg"),
                            ListTile(
                              title: Text("Harleen"),
                              subtitle: Text("Autor"),
                              onTap: () {
                                Navigator.pushNamed(context, "/telaLivro");
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 160.0,
                      color: Colors.white,
                      child: Card(
                        child: Wrap(
                          children: <Widget>[
                            Image.asset("assets/imagens/livro2.jpg"),
                            ListTile(
                              title: Text("Harleen"),
                              subtitle: Text("Autor"),
                              onTap: () {
                                Navigator.pushNamed(context, "/telaLivro");
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 160.0,
                      color: Colors.white,
                      child: Card(
                        child: Wrap(
                          children: <Widget>[
                            Image.asset("assets/imagens/livro2.jpg"),
                            ListTile(
                              title: Text("Harleen"),
                              subtitle: Text("Autor"),
                              onTap: () {
                                Navigator.pushNamed(context, "/telaLivro");
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 160.0,
                      color: Colors.white,
                      child: Card(
                        child: Wrap(
                          children: <Widget>[
                            Image.asset("assets/imagens/livro2.jpg"),
                            ListTile(
                              title: Text("Harleen"),
                              subtitle: Text("Autor"),
                              onTap: () {
                                Navigator.pushNamed(context, "/telaLivro");
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 20.0),
                height: 300.0,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    Container(
                      width: 160.0,
                      color: Colors.white,
                      child: Card(
                        child: Wrap(
                          children: <Widget>[
                            Image.asset("assets/imagens/livro2.jpg"),
                            ListTile(
                              title: Text("Harleen"),
                              subtitle: Text("Autor"),
                              onTap: () {
                                Navigator.pushNamed(context, "/telaLivro");
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 160.0,
                      color: Colors.white,
                      child: Card(
                        child: Wrap(
                          children: <Widget>[
                            Image.asset("assets/imagens/livro2.jpg"),
                            ListTile(
                              title: Text("Harleen"),
                              subtitle: Text("Autor"),
                              onTap: () {
                                Navigator.pushNamed(context, "/telaLivro");
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 160.0,
                      color: Colors.white,
                      child: Card(
                        child: Wrap(
                          children: <Widget>[
                            Image.asset("assets/imagens/livro2.jpg"),
                            ListTile(
                              title: Text("Harleen"),
                              subtitle: Text("Autor"),
                              onTap: () {
                                Navigator.pushNamed(context, "/telaLivro");
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 160.0,
                      color: Colors.white,
                      child: Card(
                        child: Wrap(
                          children: <Widget>[
                            Image.asset("assets/imagens/livro2.jpg"),
                            ListTile(
                              title: Text("Harleen"),
                              subtitle: Text("Autor"),
                              onTap: () {
                                Navigator.pushNamed(context, "/telaLivro");
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 160.0,
                      color: Colors.white,
                      child: Card(
                        child: Wrap(
                          children: <Widget>[
                            Image.asset("assets/imagens/livro2.jpg"),
                            ListTile(
                              title: Text("Harleen"),
                              subtitle: Text("Autor"),
                              onTap: () {
                                Navigator.pushNamed(context, "/telaLivro");
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 20.0),
                height: 300.0,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    Container(
                      width: 160.0,
                      color: Colors.white,
                      child: Card(
                        child: Wrap(
                          children: <Widget>[
                            Image.asset("assets/imagens/livro2.jpg"),
                            ListTile(
                              title: Text("Harleen"),
                              subtitle: Text("Autor"),
                              onTap: () {
                                Navigator.pushNamed(context, "/telaLivro");
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 160.0,
                      color: Colors.white,
                      child: Card(
                        child: Wrap(
                          children: <Widget>[
                            Image.asset("assets/imagens/livro2.jpg"),
                            ListTile(
                              title: Text("Harleen"),
                              subtitle: Text("Autor"),
                              onTap: () {
                                Navigator.pushNamed(context, "/telaLivro");
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 160.0,
                      color: Colors.white,
                      child: Card(
                        child: Wrap(
                          children: <Widget>[
                            Image.asset("assets/imagens/livro2.jpg"),
                            ListTile(
                              title: Text("Harleen"),
                              subtitle: Text("Autor"),
                              onTap: () {
                                Navigator.pushNamed(context, "/telaLivro");
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 160.0,
                      color: Colors.white,
                      child: Card(
                        child: Wrap(
                          children: <Widget>[
                            Image.asset("assets/imagens/livro2.jpg"),
                            ListTile(
                              title: Text("Harleen"),
                              subtitle: Text("Autor"),
                              onTap: () {
                                Navigator.pushNamed(context, "/telaLivro");
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 160.0,
                      color: Colors.white,
                      child: Card(
                        child: Wrap(
                          children: <Widget>[
                            Image.asset("assets/imagens/livro2.jpg"),
                            ListTile(
                              title: Text("Harleen"),
                              subtitle: Text("Autor"),
                              onTap: () {
                                Navigator.pushNamed(context, "/telaLivro");
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
