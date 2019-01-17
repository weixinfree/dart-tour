class CallableDemo:

    def __call__(self, a: int, b: int):
        return a + b


if __name__ == "__main__":
    demo = CallableDemo()
    print(demo(1, 3))  # => 4
