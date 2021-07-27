## 1.0.0

- Add space for full date.
- Add more rule from [Rust version](https://github.com/huacnlee/autocorrect).
- Remove String core ext.

## 0.3.1

- Fix some break line miss bug.

## 0.3.0

- Add Full CJK (Chinese, Japanese, Korean) support.

## 0.2.2

- Fix spacing around `-`;

## 0.2.1

- Fix spacing around `*`;

## 0.2.0

- 重新按照 [go-auto-correct](https://github.com/huacnlee/go-auto-correct) 的方式实现，完全放弃之前的 API 设计。
- 去掉名词纠正的方法。
- 实现正确的中英文空格格式化方式；
- 实现 HTML 格式化方法;
- 废弃字符串 `auto_space!`, `auto_correct!` 方法，请用 `AutoCorrect.format`。

## 0.1.0

- 新增 auto_correct! 方法用于纠正名词大小写问题，同时 Gem 改名为 auto-correct；
- 避免转换 it's 这样的场景；

## 0.0.4

- 修正中文单引号，双引号左右的空格，如：中文‘Ruby’和“Rails” -> 中文 ‘Ruby’ 和 “Rails”；
- 修正括号靠近因为，数字的时候，如：[成都]Apple -> [成都] Apple；

## 0.0.3

- 修正加号左右空格的问题，如: 中国+美国 -> 中国 + 美国（英文左右依然还有问题，如 Ruby+Rails)；
- 修正中括号，小括号左右空格的问题，如: [成都]招聘 -> [成都] 招聘；
- 修正美元符号和中文之间的间距；
