def outer():
    _global = 0

    def inner():
        nonlocal _global
        _global = 1  # ok, but is a new variable
        _local = 1  # ok

    def inner2():
        nonlocal _global
        _global = 2  # ok, but is a new variable
        _local = 1  # ok

    inner()
    inner2()

    assert _global == 2
    # print(_local)  # error


if __name__ == "__main__":
    outer()
