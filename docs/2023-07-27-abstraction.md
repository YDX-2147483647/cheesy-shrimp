# 抽象真可能引入负成本

> :fontawesome-regular-face-grin: 洋葱
>
> :material-clock-edit-outline: 2023年7月27日 21:23:44

抽象一般增加无用功能，降低性能。然而另一方面，更清晰的结构也给了编译器更多自由去优化。

下面两个 rust 函数功能完全相同，只是第二个`opt1_idiomatic`采用了更抽象的函数式写法。实测`opt1_idiomatic`的性能是`baseline`是几到十几倍。

```rust
fn baseline(input: &str) -> i64 {
    let mut res = 0;
    for b in input.bytes() {
        match b {
            b's' => res += 1,
            b'p' => res -= 1,
            _ => continue,
        }
    }
    res
}
```

```rust
fn opt1_idiomatic(input: &str) -> i64 {
    input
        .bytes()
        .map(|b| match b {
            b's' => 1,
            b'p' => -1,
            _ => 0,
        })
        .sum()
}
```

:material-eye-arrow-right-outline: [{n} times faster than C, where n = 128 - Thomas Ip](https://ipthomas.com/blog/2023/07/n-times-faster-than-c-where-n-128/)

:material-eye-arrow-right-outline: [tommyip/n\_times\_faster\_than\_c: Code for blog post "{n} times faster than C, where n = 128"](https://github.com/tommyip/n_times_faster_than_c)

作者使用 Apple M1 Pro。如果你不是 ARM 架构，测试前需要删除平台相关的函数。
