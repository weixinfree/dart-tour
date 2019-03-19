void main() {
  final a = {"id": 123, "name": "小红"};

  var live = parseJson(LiveModel(), a);
  assert(live.id == 123);
  assert(live.name == '小红');

  print(live);
  assert(identical(a, rawJson(live)));
}

final _expando = Expando<Map>();

T parseJson<T>(T obj, Map<String, dynamic> raw) {
  _expando[obj] = raw;
  (obj as dynamic).__fromJson__(raw);
  return obj;
}

Map<String, dynamic> rawJson(Object obj) {
  return _expando[obj];
}

String rawJsonAsString(Object obj) {
  Map<String, dynamic> rawMap = rawJson(obj);
  return json.encode(rawMap);
}

class LiveModel {
  int id;
  String name;

  __fromJson__(Map<String, dynamic> raw) {
    this.id = raw['id'];
    this.name = raw['name'];
  }

  $fromJson$(Map<String, dynamic> raw) {
    this.id = raw['id'];
    this.name = raw['name'];
  }

  @override
  String toString() {
    return "LiveModel(id=${id}, name=${name})";
  }
}
