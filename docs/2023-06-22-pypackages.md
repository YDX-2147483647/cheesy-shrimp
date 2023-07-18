# PEP 582 is REJECTED

> :fontawesome-regular-face-grin: 唐彬
>
> :material-clock-edit-outline: 2023年6月22日 21:09:28

PEP 582 引入了 local packages directory，即`__pypackages__`。类似`node_modules`，这种设计可以不建立虚拟环境，而实现类似虚拟环境的隔离。

3月28日[^1]，管事的 Steering Council 发布了最后意见。尽管实现 PEP 582 很简单，但它会大幅增加维护难度。PEP 582 也无法作为 venv 的过渡，反而可能让新手更困惑。总而言之，现在的方案弊大于利，未来有更好方案的话再商议。

[^1]: 作者原文是5月28日。

另外，因 PEP 582 而生的 PDM 表示会继续支持 PEP 582，同时推荐改用虚拟环境。

> PEP 582 has been rejected
>
> This is a rejected PEP. However, due to the fact that this feature is the reason for PDM's birth, PDM will retain the support. We recommend using virtual environments instead.

:material-eye-arrow-right-outline: [PEP 582 – Python local packages directory | peps.python.org](https://peps.python.org/pep-0582/)

:material-eye-arrow-right-outline: [PEP 582 - Python local packages directory - Packaging - Discussions on Python.org](https://discuss.python.org/t/pep-582-python-local-packages-directory/963/430)

:material-eye-arrow-right-outline: [Working with PEP 582 - PDM](https://pdm.fming.dev/latest/usage/pep582/)

---

所以582有具体实现出来吗？

直接往`sys.path`加就实现了。好像除了poetry，pdm、hatch等都支持了。

:material-eye-arrow-right-outline: [kushaldas/pep582](https://github.com/kushaldas/pep582)

hatch似乎没有？
