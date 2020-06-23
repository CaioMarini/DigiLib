class Recomendar{
  //Atributos, _os  torna privados
  String _id;
  String _livro;
  String _usuario;
  String _descricao;

  //Construtor
  Recomendar(this._id, this._livro, this._usuario, this._descricao);

  //Getters
  String get id => _id;
  String get livro => _livro;
  String get usuario => _usuario;
  String get descricao => _descricao;
 

  Recomendar.map(dynamic obj){
    this._id = obj['id'];
    this._livro = obj['livro'];
    this._usuario = obj['usuario'];
    this._descricao = obj['descricao'];
   
  }


  //Converter Lista para Mapa
  Map<String, dynamic> toMap(){
    var map = Map<String, dynamic>();
    if (_id != null){
      map["id"] = _id;
    }
    map["livro"] = _livro;
    map["usuario"] = _usuario;
    map["descricao"] = _descricao;
  
  }

  //Converter um mapa para o modelo de dados
  Recomendar.fromMap(Map<String, dynamic> map, String id){
    this._id = id ?? ''; //??-> atribuir valor apenas se diferente de nulo
    this._livro = map["livro"];
    this._usuario = map["usuario"];
    this._descricao = map["descricao"];
    
  }
}