# auto-correct

Automatically add spaces between Chinese and English words.

中文英文混排自动纠正补充空格，此方式已在 Ruby China 使用多年，支持 HTML 处理。

[![Gem Version](https://badge.fury.io/rb/auto-correct.svg)](https://rubygems.org/gems/auto-correct) [![Build
Status](https://api.travis-ci.org/huacnlee/auto-correct.svg?branch=master&.svg)](http://travis-ci.org/huacnlee/auto-correct)


## Other implements

- Ruby - [auto-correct](https://github.com/huacnlee/auto-correct).
- Go - [go-auto-correct](https://github.com/huacnlee/go-auto-correct).
- Rust - [auto-correct.rs](https://github.com/huacnlee/auto-correct.rs).

## Features

- Auto add spacings between Chinese and English words.
- HTML content support.

[Examples](https://github.com/huacnlee/auto-correct/blob/master/test/format_test.rb)

## Usage

`AutoCorrect.format` method for plain text.

```ruby
AutoCorrect.format("那里找到Ruby China App下载地址")
# => "那里找到 Ruby China App 下载地址"

AutoCorrect.format("Ruby 2.7版本第1次发布")
# => "Ruby 2.7 版本第 1 次发布"

AutoCorrect.format("于3月10日开始")
# => "于 3 月 10 日开始"

AutoCorrect.format("包装日期为2013年3月10日")
# => "包装日期为2013年3月10日"
```

`AutoCorrect.format_html` method for HTML content.

```ruby
AutoCorrect.format_html("<div><p>长桥LongBridge App下载</p><p>最新版本1.0</p></div>")
# => "<div><p>长桥 LongBridge App 下载</p><p>最新版本 1.0</p></div>"
```

## Benchmark

TODO

## Use cases

* [Ruby China](https://ruby-china.org) - 目前整站的标题都做了自动转换处理。

## Links

* [Chinese Copywriting Guidelines](https://github.com/sparanoid/chinese-copywriting-guidelines)

## License

This project under MIT license.
