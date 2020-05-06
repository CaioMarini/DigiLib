import 'package:flutter/material.dart';

class TelaLeituraLivro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          //backgroundColor: Colors.cyanAccent,
          //leading: Icon(Icons.favorite),
          centerTitle: true,
          title: Text(
            "DigiLib",
          ),
          leading: IconButton(
            tooltip: 'Retornar ao Livro',
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              //colocar aqui o retonrno para o menu
              Navigator.pop( context, );
            },
          ),
        ),
        body: SingleChildScrollView(
          //padding: EdgeInsets.all(10.0),
          padding: EdgeInsets.fromLTRB(
              20 /*left*/, 0.5 /*top*/, 18 /*right*/, 5 /*bottom*/),
          child: Center(
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer at massa libero."
                        " Sed nec massa pulvinar tortor scelerisque viverra. Aliquam pharetra feugiat nunc," 
                        "eget molestie nisl aliquet at. Sed pulvinar nisl sit amet velit varius vestibulum. "
                        "In et sapien turpis. Mauris quis arcu eu eros ornare hendrerit sit amet nec nisi. "
                        "Curabitur vestibulum libero et magna ultricies maximus. Maecenas et lobortis felis." 
                        "Nam feugiat felis ac blandit gravida. Ut malesuada tortor ac mi scelerisque "
                        "ullamcorper. Morbi hendrerit mauris at ultricies varius. Suspendisse potenti. Vivamus"
                        " vehicula velit et posuere venenatis. Cras lacus est, faucibus sit amet rutrum quis,"
                        " euismod bibendum sem. Duis elit est, auctor id nulla vitae, imperdiet egestas nibh."                       
                          "Pellentesque dapibus turpis vel nibh sollicitudin ornare. Aenean in diam eu arcu "
                          "varius elementum. Aenean eu congue sapien. Pellentesque ut rutrum dui. Quisque et"
                          " purus mi. Nunc a luctus erat. Donec id urna pharetra risus cursus hendrerit. Ut "
                          "nec lobortis diam. Etiam auctor elit in augue dapibus, quis laoreet dui convallis. "
                          "In mi dolor, aliquam non urna vel, rhoncus mollis mi. Aliquam pretium eu lectus sit "
                          "amet tincidunt. Integer dapibus facilisis metus, vel ullamcorper justo rutrum non."                         
                        "Donec vulputate, tellus nec efficitur gravida, turpis augue maximus erat, elementum sodales"
                        " nisi nulla sed mi. Integer vulputate, justo vitae placerat posuere, mi nisi ornare sapien, "
                        "quis ultrices odio mi vitae lectus. Donec auctor fermentum sapien, sed molestie eros condimentum"
                        " eu. Maecenas lacinia rutrum ipsum a tincidunt. Sed scelerisque nisl ligula, eu efficitur augue "
                        "lobortis et. Sed laoreet dolor non purus fringilla ultricies. In posuere magna a euismod pharetra."
                        "Donec eget enim nec ipsum elementum auctor sit amet sed libero. Mauris aliquet lectus ligula, "
                        "lobortis hendrerit nisi finibus et. Nunc sem massa, pulvinar non auctor volutpat, pharetra ac "
                        "mauris. Fusce viverra dolor porttitor fringilla ultricies. Morbi nibh erat, facilisis id "
                        "vulputate eu, blandit eu risus. Fusce consequat volutpat fermentum. Nam tincidunt et eros"
                        "et rutrum. Proin sed elit sit amet turpis fermentum lobortis.Ut a vulputate arcu, id rhoncus"
                        " urna. Phasellus blandit porta mattis. Nam lacinia convallis ipsum, non sagittis lorem blandit"
                        " nec. In hac habitasse platea dictumst. Phasellus tempor risus vel facilisis rutrum. Duis quis"
                        " nunc felis. Etiam egestas hendrerit lacinia. Quisque ullamcorper tellus id nulla mattis, ac "
                        "sagittis nibh luctus. Mauris tincidunt faucibus erat, vel ullamcorper ligula scelerisque at. "
                        "Suspendisse ut velit ligula. Nulla facilisi. Nunc semper a leo nec aliquam. Nunc nisi ex, "
                        "elementum non dui ut, pulvinar iaculis est. Fusce aliquam, ante ut pharetra malesuada, "
                        "purus nisl consequat felis, eu tristique nisi mauris sit amet eros. Fusce gravida in dui "
                        "id vulputate. Aliquam congue cursus est id gravida.",
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            color: Colors.black,
                            height: 2,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
