main() {
  final li = [1, 2, 3];

  li.sort((lhr, rhr) {
    return rhr - lhr;
  });
  print(li); // [3, 2, 1]

  li.sort((lhr, rhr) => lhr - rhr);
  print(li); // [1, 2, 3]
}
