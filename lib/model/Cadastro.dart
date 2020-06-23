class Cadastrar{
  //Atributos, _os  torna privados
  String _id;
  String _usuario;
  String _senha;
  String _email;

  //Construtor
  Cadastrar(this._id, this._email, this._usuario, this._senha);

  //Getters
  String get id => _id;
  String get usuario => _usuario;
  String get senha => _senha;
  String get email=> _email;
 

  Cadastrar.map(dynamic obj){
    this._id = obj['id'];
    this._usuario = obj['usuario'];
    this._senha = obj['senha'];
    this._email = obj['email'];
   
  }


  //Converter Lista para Mapa
  Map<String, dynamic> toMap(){
    var map = Map<String, dynamic>();
    if (_id != null){
      map["id"] = _id;
    }
    map["usuario"] = _usuario;
    map["senha"] = _senha;
    map["email"] = _email;
  
  }

  //Converter um mapa para o modelo de dados
  Cadastrar.fromMap(Map<String, dynamic> map, String id){
    this._id = id ?? ''; //??-> atribuir valor apenas se diferente de nulo
    this._usuario = map["usuario"];
    this._senha = map["senha"];
    this._email = map["email"];
    
  }
}