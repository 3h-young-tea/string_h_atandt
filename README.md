# string.h in at&t asm

>	华夏同袍点这里 -> [readme_zh](https://github.com/3h-young-tea/string_h_atandt/blob/main/README.zh.md)

## project description

`charr` means char array.

- `_start` : print "hello world" and exit
- `charr2int` : just like `atoll`
- `charr_cat` : like `strcat`
- `charr_cmp` : like `strcmp`
- `charr_charr` : like `strstr`, but it uses knuth-morris-pratt algo. i haven't code it. you can code it if you are excited
- `charr_ch` : like `strchr`
- `charr_cpy` : like `strcpy`
- `charr_len` : like `strlen`
- `charr_rch` : like `strrchr`

i believe the `string.h` header file serves as an excellent starting point for learning assembly language, whether it's at&t or intel syntax. mastering `string.h` only requires a foundational understanding of c programming, basic register operations, and jump instructions. once you can implement your own `string.s`, you'll have taken your first step toward becoming a proficient assembly programmer. i trust you!

## installation / build

```bash
as ./charr.s -o charr.o
ld -no-pie ./charr.o -o charr
./charr
```

## license

[gplv3](https://www.gnu.org/licenses/gpl-3.0.html)
