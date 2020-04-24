
class EventModel {
  String id;
  String titulo;
  String local;
  String dataInicio;
  String dataFim;
  String horaInicio;
  String horaFim;
  String obs;

  EventModel(
    this.id,
    this.titulo,
    this.local,
    this.dataInicio,
    this.dataFim,
    this.horaInicio,
    this.horaFim,
    this.obs
  );

  EventModel.map(dynamic obj) {
    this._id = obj["id"];
    this._titulo = obj["titulo"];
    this._local = obj["local"];
    this._dataInicio = obj["dataInicio"];
    this._dataFim = obj["dataFim"];
    this._horaInicio = obj["horaInicio"];
    this._horaFim = obj["horaFim"];  
    this._obs = obj["obs"];
  }

  String get _id => _id;
  String get _titulo => _titulo;
  String get _local => _local;
  String get _dataInicio => _dataInicio;
  String get _dataFim => _dataFim;
  String get _horaInicio => _horaInicio;
  String get _horaFim => _horaFim;
  String get _obs => _obs;

  set _id(_id) {}
  set _titulo(_titulo) {}
  set _local(_local) {}
  set _dataInicio(_dataInicio) {}
  set _dataFim(_dataFim) {}
  set _horaInicio(_horaInicio) {}
  set _horaFim(_horaFim) {}
  set _obs(_obs) {} 
 
  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    if (id != null) {
      map['id'] = _id;
    }
    map['titulo'] = _titulo;
    map['local'] = _local;
    map['dataInicio'] = _dataInicio;
    map['dataFim'] = _dataFim;
    map['horaInicio'] = _horaInicio;
    map['horaFim'] = _horaFim;
    map['obs'] = _obs;

    return map;
  }

  EventModel.fromMap(Map<String, dynamic> map, String id) {
    this._id = id ?? '';
    this._titulo = map['titulo'];
    this._local = map['local'];
    this._dataInicio = map['dataInicio'];
    this._dataFim = map['dataFim'];
    this._horaInicio = map['horaInicio'];
    this._horaFim = map['horaFim'];
    this._obs = map['obs'];
  }

}