# Dart 语言特性巡览

最近在学习Dart，有人说学习最好的方式是写一本关于这个主题的书籍。so，有了这本gitbook。

Dart虽然不是很流行，google也曾一度放弃过。但是就语言特性来说，Dart是一门还不错的编程语言，对语言特性的权衡也很谨慎。如[官网描述](https://www.dartlang.org/): 

> Dart helps you craft beautiful, high-quality experiences across all screens, with:
- A client-optimized language
- Rich, powerful frameworks
- Delightful, flexible tooling

Dart是一门client-optmized语言，面向移动和web开发领域，很聚焦，而且移动和web很多原理是共同的。Dart的语言特性也针对移动/web开发场景做了仔细的权衡。从Dart身上可以很明显的看到一些熟悉的语言的影子同时也有所改进，而且语言的一致性做的非常不错。

在众多的新语言中，dart的语言特性显得比较中规中矩，没有花里胡哨的技巧，同时在工程实践上采用了一些比较有效的规范，给人一种完成度很高，producation-ready的感觉。

本书的组织不同于传统的讲解语言特性细节的方式，主要是采用主题的方式，讲解dart的语言特性，同时结合Java，JavaScript，python等语言特性进行对比。并在力所能及的范围内，添加一些自己的不成熟的见解。欢迎各位读者指正。

本书包含的主题如下：
- 第一章：函数式编程，主要讲解dart中的函数式编程特性，例如不可变性，iterator，generator等
- 第二章：面向对象，主要讲解dart中的面向对象特性，以及类型系统相关的一些设计
- 第三章：异步编程和并发，主要讲解异步编程理念
- 第四章：工程实践，主要讲解工程上的一些实践，例如：格式化，单元测试，最佳实践，代码风格等
- 第五章：后记，讲解一些dart中不起眼的小特性