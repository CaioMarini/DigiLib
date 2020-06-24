

class Terror{
//Atribui o '_' os torna privados

String _id;
String _autor;
String _image;
String _sinopse;
String _titulo;

//Construtor
Terror(this._id, this._autor, this._image,this._sinopse,this._titulo);

//Getters
String get id => _id;
String get autor => _autor;
String get image => _image;
String get sinopse => _sinopse;
String get titulo => _titulo;


Terror.map(dynamic obj){
  this._id = obj['id'];
  this._autor = obj['autor'];
  this._image = obj['image'];
  this._sinopse = obj['sinopse'];
  this._titulo = obj['titulo'];
}

//Converter os dados par uma mapa 
Map<String,dynamic> toMap(){
  var map = Map<String, dynamic>();
  if(_id != null){
    map["id"] = _id;
  }
  map["autor"] = _autor;
  map["image"] = _image;
  map["sinopse"] = _sinopse;
  map["titulo"] = _titulo;
  return map;
}

//Converter um Mapa para o modelo de dados
Terror.fromMap(Map<String, dynamic> map, String id){
  //Atribuir id ao this._id, somente se id não for nulo, caso contrario atribui ''(vazio)
  this._id = id ?? '';
  this._autor = map["autor"];
  this._image = map["image"];
  this._sinopse = map["sinopse"];
  this._titulo = map["titulo"];
}

}


