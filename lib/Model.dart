class Model{
  int _id;
  String _title;
  String _icon_color;
  Model(this._title,this._id,this._icon_color);
  Model.fromMap(dynamic obj){
    this._title=obj['_title'];
    this._id=obj['_id'];
    this._icon_color=obj['_icon_color'];
  }
  String get title => _title;
  int get id => _id;
  String get icon_color => _icon_color;
  Map<String ,dynamic>toMap(){
    var map= new Map<String ,dynamic>();
    map['_title']= _title;
    map['_id']=_id;
    map['_icon_color']=_icon_color;
    return map;
  }
}
/*
class Fruits {
  int _id;
  String _name;
  Fruits(this._name);
  Fruits.fromMap(dynamic obj) {
    this._name = obj['name'];
  }
  String get name => _name;
  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["name"] = _name;
    return map;
  }
}
 */