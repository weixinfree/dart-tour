class CallableDemo {
  int call(int a, int b) => a + b;
}

main(List<String> args) {
  final add = CallableDemo();
  print(add(2, 3)); // => 5
}
