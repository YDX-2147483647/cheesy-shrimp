# Ghost in the Shell —— Fork Bomb

> :fontawesome-regular-face-grin: 扁鹊
>
> :material-clock-edit-outline: 2023年6月15日 0:43:10

一行短短的 shell 语句也可以很邪乎。

下面这条称作 fork bomb，适用于 bash 等 shell，它会按几何级数创建进程，最终可能耗尽计算机资源，十分危险。

```bash
$ :(){ :|:& };:
```

这是什么鬼呢？我们一点点来看。

1. `:() { … }`定义了一个函数，名叫`:`，无需参数，函数体为`{ … }`的内容。
2. `:`调用这个函数。
3. `A | B`创建两个进程，分别执行`A`、`B`，同时把前一个进程的输出（stdout）作为后一个进程的输入（stdin），这称作 pipe。如果两个进程都执行`:`函数，就是`: | :`了。
4. `U; V`先执行`U`，再执行`V`。
5. `C &`开始在后台执行`C`，并立即返回。稍后可用`fg`（foreground）回到前台。对 fork bomb 而言，`&`的作用在于掩盖情况，欺骗你。
6. 后面的分析作为读者练习。

---

Pipeline 不是串行，不然`tail -f`（follow）很可能就实现不了了。

---

> 谢谢，电脑瞬间跑满CPU，内存在数秒内涨满15G，幸好我关机关得快。

---

在 Windows 可用 Git Bash，或者尝试 PowerShell。

```powershell
> Function fork() { fork | fork & }; fork
```

也许 PowerShell 7 才有`&`……要不直接去掉试试？
