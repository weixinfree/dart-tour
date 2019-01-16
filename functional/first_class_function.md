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

说完了基本的函数声明，再细说一下参数。dart的参数和java差别比较大，并支持java中的多态，而是和python一致，使用可选参数和命名参数，只是语法和python有点差异。
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
final _sort = reverse_order;
li.sort(_sort);
print(li);
```
从上面的例子可以看出，函数作为一等公民/对象主要的特性为：
1. 函数可以像普通的对象一样作为作为参数传递
2. 一个函数可以接受另一个函数作为参数（以起奇怪名字为乐趣的程序员把这个叫做高阶函数）
3. 一个函数对象可以像普通对象一样赋值给变量

> 函数是一等对象的英文版是 Functions as first-class objects，python中好像使用的是 Functions as first-class citzen，翻译过来是函数是一等公民。