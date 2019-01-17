#### Dart 内置的数据结构

函数式编程还有一个明显的特点，倾向于使用少量的数据结构加上大量的针对这几种数据结构的的操作。而面向对象则倾向于定义大量的数据结构，每种数据结构支持集中操作。

这其实很自然，因为FP的抽象和复用单元是函数，而OOP的基本抽象单元是对象/类。

所以一个现象是，对FP支持良好的语言，对常见的数据结构都有语法上的支持/或者核心库的内置支持。例如python中内置支持了：tuple，list，set 和 dict。

dart中对list 和 dict有语法支持：

```dart
final li = [1,2,3];
final li2 = <String>[];
```

list: 可自增长的数组，java ArrayList, python

lang | java | ads
---|---|---
dart | ArrayList | 可自增长的数组
python | LinkedList | 链表

### List 和 Iterable
pass 