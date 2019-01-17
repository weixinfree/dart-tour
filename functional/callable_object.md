#### Callable Class

这是一个从python中借鉴过来的设计理念，可以把对象当作函数一样调用: 

```python
class CallableDemo:

    def __call__(self, a: int, b: int):
        return a + b


if __name__ == "__main__":
    demo = CallableDemo()
    print(demo(1, 3))  # => 4
```

dart 中是这样的：

```dart
class CallableDemo {
  int call(int a, int b) => a + b;
}

main(List<String> args) {
  final add = CallableDemo();
  print(add(2, 3)); // => 5
}
```

多少有点鸡肋的特性，python中使用到callable class的场景也很少。dart官方文档有一篇[专门的文章](https://www.dartlang.org/articles/language/emulating-functions)，介绍如何使用callable class特性，用对象来模仿函数。看完了，感觉更鸡肋了，嗯，就是这样的。