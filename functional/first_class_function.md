#### 函数的基本使用

dart中函数声明方式和java非常类似：
```dart
String demo(int value) {
  print("got a num: ${value}");

  return "success"
}
```
- 返回值在最前面
- 参数的类型声明在前，形参在后
- 需要显式return

因为有类型推断，**返回值是可以省略的**
```dart
inc(int v) {
  return v + 1;
}
```

dart还**支持嵌套函数**
```dart
outer() {
  inner() {
    print("i am inner func");
  }

  print("i am outer func");
  inner();
}
```

dart的函数声明风格相对old fasion，很多相对新的语言是另一种风格。
在python3中是这样式儿的：
```python
def inc(v: int) -> int:
    return v + 1
```
Rust中是这样式儿的：
```rust
fn int(v: i32) -> i32 {
    v + 1
}
```
rust中比较独特的是，不需要显式的return，最后一条执行到的表达式的值就是函数的返回值。
> 注意是：最后一条执行到的语句，不是书写的最后一条语句

当然，这两种风格萝卜青菜各有所爱，并没有大的区别。

#### 命名参数

说完了基本的函数声明，再细说一下参数。dart的参数和java差别比较大，不支持java中的多态，而是和python一致，使用可选参数和命名参数，只是语法和python有点差异。
```dart
func_with_named_param({String name, int age}) {
  print("${name} is ${age} years old after the new year.");
}
```
调用方式则和python一致
```dart
func_with_named_param(name: "小明", age: 25);
```
**命名参数是可选的**，下面的调用方式都是合法的
```dart
  func_with_named_param(name: "小明", age: 25);
  func_with_named_param(name: "小明");
  func_with_named_param(age: 25);
  func_with_named_param();
```
> 注意：dart是一个比较纯的面向对象语言，所有的没有初始化的变量值都是null，所以没有传递的参数默认为null

上面的代码输出为：
```sh
小明 is 25 years old after the new year.
小明 is null years old after the new year.
null is 25 years old after the new year.
null is null years old after the new year.
```
**命名参数还支持添加默认值**
```dart
func_with_named_param({String name = "xm", int age = 0}) {
  print("${name} is ${age} years old after the new year.");
}
```
输出如下：
```sh
小明 is 25 years old after the new year.
小明 is 0 years old after the new year.
xm is 25 years old after the new year.
xm is 0 years old after the new year.
```

有了命名参数，代码的可读性直线上升，在java中一般一个方法参数大于等于三个就算是太多了，可维护性就大打折扣。但是有了命名参数，这个上限至少可以提升到10个。

#### 可选参数

除了命名参数外，和python类似，dart还支持可选参数
```dart
func_with_optional_param(String required, [String optional]) {
  print("required: ${required}, optional: ${optional}");
}
```
下面两种调用方式都是合法的
```dart
func_with_optional_param("i am required", "i am optional");
func_with_optional_param("i am required");
```
输出如下：
```
required: i am required, optional: i am optional
required: i am required, optional: null
```
同样的，可选参数支持默认值
```dart
main() {
  func_with_optional_param("i am required", "i am optional");
  func_with_optional_param("i am required");
}

func_with_optional_param(String required, [String optional = "i am default"]) {
  print("required: ${required}, optional: ${optional}");
}
```
输出如下
```sh
required: i am required, optional: i am optional
required: i am required, optional: i am default
```

#### 可选参数 + 命名参数 vs 多态

- 带默认值的可选参数其实可以满足多态90%以上的使用场景
- 而且因为有了命名参数，dart方法参数实际的可读性要比java更好一些。

vs | 可选参数 + 命名参数 | 多态 | 权重
---|:---:|:---:|---
可读性 | 10 | 5 | 70%
灵活性 | 9  | 10 | 30%
总分 | 9.7 ✌️ | 6.5 | 100%

可见，dart作为一门新语言，吸收了java，python，javasript很多的经过验证的特性，并且做了相应的优化，没有花里胡哨的技巧，但是很实用，是一个成熟稳重的好少年。

#### 函数是一等对象
在近几年新出现的语言中，这个特性好像是标配。应该是都切实感受到了函数可以作为普通对象使用带来的生产力的提升吧。

可以这样用：
```dart
main() {
  final li = [1, 2, 3];
  li.forEach(printItem);
}

void printItem(int value) {
  print("get a ${value}");
}
```
也可以这样用：
```dart
main() {
  li.sort(reverse_order);
  print(li);
}

int reverse_order(int lhr, int rhr) {
  return rhr - lhr;
}
```
还可以这样用：
```dart
main() {
  final evens = li.map((v) => v * 2).where((v) => v % 2 == 0).toList();
  print(evens);
}
```
或者更骚气一点，还可以这样：
```dart
final myPrint = print;
myPrint("hello world");

final add = (a, b) => a + b;
final myAdd = add;
print(myAdd(2, 3));

final _sort = reverse_order;
li.sort(_sort);
print(li);
```
从上面的例子可以看出，函数作为一等公民/对象主要的特性为：
1. 函数可以像普通的对象一样作为作为参数传递
2. 一个函数可以接受另一个函数作为参数（以起奇怪名字为乐趣的程序员把这个叫做高阶函数）
3. 一个函数对象可以像普通对象一样赋值给变量

> 函数是一等对象的英文版是 Functions as first-class objects，python中好像使用的是 Functions as first-class citzen，翻译过来是函数是一等公民。

#### 🏃往前再走一步
为什么一等函数被大家普遍认可呢？同九年，汝何秀？我认为主要是因为这个特性：

**高阶函数契合了机制策略分离的思想**

第一次见到机制和策略分析的思想是在《Unix编程艺术》中，一个绝佳的例子是Unix/Linux的IO抽象，系统提供了对字节流读写的机制，具体的读写由各个硬件/软件和驱动来完成。网络传输，磁盘读写，打印机，显示设备等等都可以套在这个体系下。

另一个非常好的例子是排序：各个语言的提供的排序方法几乎都接受一个函数/函数指针/方法接口（例如：java的Comparator）来实现丰富的自定义排序，而排序方法只需要实现排序的机制。

设计模式上，策略模式也非常契合机制和策略分离的思想，一个函数/类作为机制实现主体，策略作为参数或者子类（例如：View 和 TextView）来自定义自己的实现细节。因此得以享受到统一的机制带来的优势的同时，还能进行丰富的自定义。排序方法可以认为是策略模式的一个实例。

那么机制和策略分离为什么会是一个好的思想呢？我的理解如下：在机制策略分离中，机制抓住了系统的主要矛盾，解决了主干问题，策略来满足普遍存在的定制化需求（次要矛盾）。**一个主次矛盾矛盾分明的系统和机制和策略分离的思想的契合性是非常高的。**

回到高阶函数，依然可以拿排序为例子：排序机制的实现是排序系统的主要矛盾，各种各样的自定义需求是次要矛盾。主要矛盾由排序方法解决，次要矛盾通过传入的函数参数来满足。
