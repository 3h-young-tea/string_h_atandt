# at&t 汇编编写 string.h

## 项目简介

`charr` 是 char array 的缩写.

- `_start` : 输出 "hello world" 然后调用 exit
- `charr2int` : 对标 `atoll`
- `charr_cat` : 对标 `strcat`
- `charr_cmp` : 对标 `strcmp`
- `charr_charr` : 对标 `strstr`, 但它用了 knuth-morris-pratt 算法. 我还没有编写它. 如果你足够热血, 就可以尝试编写
- `charr_ch` : 对标 `strchr`
- `charr_cpy` : 对标 `strcpy`
- `charr_len` : 对标 `strlen`
- `charr_rch` : 对标 `strrchr`

我相信 `string.h` 是学习汇编的较好起点, 不管是 at&t 还是 inter 语法. `string.s` 只需要 c 语言基础, 基本寄存器操作, 和跳转指令. 等你能编写出你自己的 `string.s` 时, 你就向着汇编大师的路上迈出第一步了. 我相信你!

## 安装与编译

```bash
as ./charr.s -o charr.o
ld -no-pie ./charr.o -o charr
./charr
```

## 协议

[gplv3](https://www.gnu.org/licenses/gpl-3.0.html)
