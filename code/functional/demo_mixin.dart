main() {
  final a = {"id": 123, "name": "小红"};

  var live = LiveModel().parse(a);
  assert(live.id == 123);
  assert(live.name == '小红');

  print(live);
  assert(identical(a, live.rawJson));
}

mixin JsonDeserial<T> {
  Map<String, dynamic> _rawJson = {};

  T parse(Map<String, dynamic> raw) {
    _rawJson = raw;
    (this as dynamic).$fromJson(raw);
    return (this as T);
  }

  get rawJson => _rawJson;
}

class LiveModel with JsonDeserial<LiveModel> {
  int id;
  String name;

  $fromJson(Map<String, dynamic> raw) {
    this.id = raw['id'];
    this.name = raw['name'];
  }

  @override
  String toString() {
    return "LiveModel(id=${id}, name=${name})";
  }
}
