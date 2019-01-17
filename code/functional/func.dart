main() {
  demo(inc(10));
  outer();

  final myPrint = print;
  myPrint("hello world");

  final add = (a, b) => a + b;
  final myAdd = add;
  print(myAdd(2, 3));

  func_with_named_param(name: "小明", age: 25);
  func_with_named_param(name: "小明");
  func_with_named_param(age: 25);
  func_with_named_param();

  func_with_optional_param("i am required", "i am optional");
  func_with_optional_param("i am required");

  final li = [1, 2, 3];
  li.forEach(printItem);

  final _sort = reverse_order;
  li.sort(_sort);
  print(li);

  final evens = li.map((v) => v * 2).where((v) => v % 2 == 0).toList();
  print(evens);
}

int reverse_order(int lhr, int rhr) {
  return rhr - lhr;
}

void printItem(int value) {
  print("get a ${value}");
}

func_with_optional_param(String required, [String optional = "i am default"]) {
  print("required: ${required}, optional: ${optional}");
}

func_with_named_param({String name = "xm", int age = 0}) {
  print("${name} is ${age} years old after the new year.");
}

outer() {
  inner() {
    print("i am inner func");
  }

  print("i am outer func");
  inner();
}

void demo(int value) {
  print("got a num: ${value}");
}

inc(int v) {
  return v + 1;
}
