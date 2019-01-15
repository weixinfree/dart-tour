## Dart对不可变性的支持

在dart中使用变量的一般方式是
```dart
var name = "xiaoming";
```

此时的dart是一个可变变量，后续变量的值可以改变，例如：
```dart
var name = "xiaoming";
assert(name == "xiaoming");

name = "xh";
assert(name == "xh");
```
dart 也支持不可变变量, `final` 和 `const`
```dart
final name = "xm";
assert(name == "xm");
name = "xh"; // syntax error！！！
```
> 不可变变量听起来比较拗口，叫做不可变绑定会会好一些，不过好像大家都这么叫，在不引起歧义的情况下，下文继续使用不可变变量

同样的`const`也可以用来声明不可变变量
```dart
const name = "xm";
name = "xh"; // syntax error！！！
```

问题来了，既然都可以用来声明不可变变量，dart为什么要设计两个关键字呢？感觉有点多此一举。其实在dart中`final`和 `const`差别还是挺大的。

## `const` 和 `final`的区别
`final` 仅仅表明一个变量只能赋值一次。`const`的语义则要强上很多，除了仅能赋值一次的要求外，const 变量的值还必须要是编译期可确定的。
```dart
const name = "xm";
const age = "10";
const xm = name + '-' + age;

assert(xm == "xm-10");
```

1. literal 值是编译期确定的
2. const 值之间的简单运算也是编译期间可确定的

此外，在dart中`const`不仅可以修饰变量，还可以修饰值：
```dart
const aNum = 10;
const list1 = const [1, 2, 3, aNum];
const list2 = const [1, 2, 3, aNum];
assert(identical(list1, list2));
```
可见，dart修饰值的作用是：两个值是同一份，不仅仅`equal`，还`identical`

const还有一个比较有用的特性：在const上下文中，const value的const关键字是可选的，因此上面的代码可以简化为：
```dart
const aNum = 10;
const list1 = [1, 2, 3, aNum];
const list2 = [1, 2, 3, aNum];
assert(identical(list1, list2));
```

同样的可以构造更复杂的例子：
```dart
  const v = {
    "age": aNum,
    "names": ["xm", "xh", "xg"]
  };

  assert(v['age'] == 10);
  assert(identical(v['names'], const ["xm", "xh", "xg"]));
```
`final`和`const`特性总结如下：

feature| final | const
---|---|---
只能赋值一次| yes | yes
编译期需要确定变量值 | no | yes
可以修饰值 | no | yes
上下文可以传递到赋值语句右侧 | no | yes

## 其它语言的设计

- Rust 中使用`let`进行变量赋值，默认不可变，可变变量要使用`let mut`。可见Rust其实是推荐使用不可变变量的，对可变变量的使用增加了语法负担
- java 中需要明确指定类型，可以添加`final`修饰符，使变量不可重新赋值，`static final` 修饰的变量则和`const`有异曲同工之妙。一如既往，java 对不可变性的支持也相对繁琐一些。
- go 里面同样有`var` 和 `const`，和 dart的`var`和`const`语义类似，但是限制要多的多，不支持`const value`，不支持复杂类型
- scala 中使用`var`作为可变变量，`val`作为常量
- 最新的ES6中，也有了 `let` 和 `const`关键字，其中let的语义和dart的`var`类似(js中的`var`就是一个恶魔，各种手段诱导人犯错)

## 为什么需要不可变性？

##### 不可变的变化最少，思维负担最小

在工业界有过一定coding经验的同学，应该都有一个体会，几乎不存在什么做不到的，google + github大概率可以搞定一切。只是写出来的商业化代码，到处都是一堆shit。

怎么做复杂度最低，清晰度更高，维护性更好。才是商业化代码一直追求的（说明一直没做到）。

状态的变化就是复杂度，程序运行的动态复杂度。不可变就在致力于降低这块复杂度。总是优先使用不可变变量是一个好习惯

##### 不可变天然是线程安全的

不可变还有还一个非常大的好处是，天然是多线程安全的。在多核心已经如此普遍的今天，这句话的意义远比你的想象更有内涵。

每一个轻视多线程的人，都会被多线程砸到脚

当然，这条讨论对dart来说就是在扯淡，因为dart是单线程语言。并发的模型也是基于通信的actor模型，`isolate`之间内存相互独立。

那么问题来了：
1. dart是单线程语言，如何适应GUI编程呢？
例如: 一个举世公认的理念是：不能在主线程读取磁盘，否则会造成卡顿丢帧。
2. actor模型是什么鬼？

请看后面的[异步和并发编程]()章节

## 总结

dart对不可变性的支持是十分完善的，而且支持`const value`，这是一个那么不常见的特性，虽然带来了一些复杂性，但是总体上来说也算值得。不过看起来官方并没有刻意的强调优先使用不可变变量，这点上不如rust彻底。


说了这么多，在dart中如何使用变量呢？**推荐如下：**
```dart
const >> final >> var
```
remember：**编程的核心是控制复杂度**

