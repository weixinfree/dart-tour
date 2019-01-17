#### 匿名函数

支持一等函数的语言，一般都会顺路支持另一个特性：匿名函数

dart中支持两种形式的匿名函数

```dart
main() {
  final li = [1, 2, 3];

  li.sort((lhr, rhr) {
    return rhr - lhr;
  });
  print(li); // [3, 2, 1]

  li.sort((lhr, rhr) => lhr - rhr);
  print(li); // [1, 2, 3]
}
```

下面这种箭头形式的匿名函数，只支持单行语句。


#### lambda函数，lambda表达式和匿名函数 傻傻分不清？😵
lambda函数，lambda表达式和匿名函数其实是一回事。这个梗的来源应该是高级语言的二始祖Lisp（始祖是Fortran）。

在lisp中，所有的函数都是通过lambda表达式来定义的，lambda表达式生成了一个匿名函数对象，普通的函数只是给lambda表达式绑定了一个名字而已。

在scheme中下面两个表达式是等价的：
```scheme
(define add6 (lambda (x)  (+ x 6)))
; 这个是定义命名函数的简化版本
(define (add6 x) (+ x 6))
```

#### 闭包

匿名函数和闭包有着千丝万缕的关系，欲知后事，请看后续章节