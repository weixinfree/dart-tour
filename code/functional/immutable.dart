void main() {
  _var();
  _final();
  _const();
  _const2();

  _demo();
}

_demo() {
  dynamic a = 123;
  String b = a;
  print(b);
  print(b.runtimeType);
}

_final() {
  final name = "xm";
  assert(name == "xm");
  // name = "xh"; // syntax error！！！
}

_const() {
  const name = "xm";
  // name = "xh";

  const age = "10";

  const xm = name + '-' + age;

  assert(xm == "xm-10");

  const aNum = 10;
  const list1 = const [1, 2, 3, aNum];
  const list2 = const [1, 2, 3, aNum];
  assert(identical(list1, list2));
}

_const2() {
  const aNum = 10;
  const list1 = [1, 2, 3, aNum];
  const list2 = [1, 2, 3, aNum];
  assert(list1 == list2);
  assert(identical(list1, list2));

  const v = {
    "age": aNum,
    "names": ["xm", "xh", "xg"]
  };

  assert(v['age'] == 10);
  assert(identical(v['names'], const ["xm", "xh", "xg"]));
}

_var() {
  var name = "xiaoming";
  assert(name == "xiaoming");

  name = "xh";
  assert(name == "xh");
}
