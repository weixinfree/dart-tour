## 词法作用域和作用域链

词法作用域这个名词对java同学可能比较陌生，js和python同学可能听说过函数作用域，lisp和scheme同学一定在想，终于到了我上（装）场（逼）的时刻了。

> 又是喜欢起无聊名字的无聊程序员起的怪名字。

dart其实和函数作用域的关系比较暧昧，dart对编译到js有第一等的支持，但是dart是一门词法作用域的语言，而js是一门函数作用域的语言(当然，es6以后也支持词法作用域了)

除了词法作用域，函数作用域之外还有动态作用域，不过比较少见，emacs的扩展语言elisp就是动态作用域的，好像common lisp也支持动态作用域。不过动态作用域经过实践的检验，已经基本被抛弃了，今天只和大家聊聊现在的词法和函数作用域机制，以及闭包和作用域链，这两个和作用域密切相关的话题。

Java 词法作用域的例子
```java
static void main() {
    int global = 0;
    {
        // int global = 1; compile error!
        global = 1; // ok
        int local = 1; // ok
    }

    {   
        global = 2; // ok
        int local = 1; // ok
    }

    System.out.print(local); // compile error！
    System.out.print(global); // ok
}
```

python 函数作用域的例子
```python
def outer():
    _global = 0

    def inner():
        _global = 1  # ok, but is a new variable
        _local = 1  # ok

    def inner2():
        _global = 2  # ok, but is a new variable
        _local = 1  # ok

    inner()
    inner2()

    assert _global == 0
    # print(_local)  # error
```

词法作用域和函数作用域其实差别并不大。两者都是静态作用域，指的是看代码通过阅读代码就可以知道变量的可见性和作用域。只不过词法作用域更精细一些，允许更细致的调节。js中各种使用函数模仿词法作用域的例子

### 作用域链

### 闭包

奥，对了，看不懂的java小伙伴不用着急，java一直就是词法作用域，就是一直以来你最了解最清楚的那个。