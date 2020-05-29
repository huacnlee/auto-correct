# auto-correct

Automatically add whitespace between CJK (Chinese, Japanese, Korean) and half-width characters (alphabetical letters, numerical digits and symbols).

中文、日语、韩语 + 英文混排自动纠正补充空格，此方式已在 Ruby China 使用多年，支持 HTML 处理。

[![Gem Version](https://badge.fury.io/rb/auto-correct.svg)](https://rubygems.org/gems/auto-correct) [![Build
Status](https://api.travis-ci.org/huacnlee/auto-correct.svg?branch=master&.svg)](http://travis-ci.org/huacnlee/auto-correct)


## Other implements

- Ruby - [auto-correct](https://github.com/huacnlee/auto-correct).
- Go - [go-auto-correct](https://github.com/huacnlee/go-auto-correct).
- Rust - [auto-correct.rs](https://github.com/huacnlee/auto-correct.rs).

## Features

- Auto add spacings between CJK (Chinese) and English words.
- HTML content support.
- Rust implement for performance.

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

AutoCorrect.format("生产环境中使用Ruby")
# => "生产环境中使用 Ruby"

AutoCorrect.format("本番環境でRubyを使用する")
# => "本番環境で Ruby を使用する"

AutoCorrect.format("프로덕션환경에서Ruby사용")
# => "프로덕션환경에서 Ruby 사용"
```

`AutoCorrect.format_html` method for HTML content.

```ruby
AutoCorrect.format_html("<div><p>长桥LongBridge App下载</p><p>最新版本1.0</p></div>")
# => "<div><p>长桥 LongBridge App 下载</p><p>最新版本 1.0</p></div>"
```

## Benchmark

Run `rake bench` to test:

```
Warming up --------------------------------------
     format 50 chars     6.698k i/100ms
    format 100 chars     4.657k i/100ms
    format 400 chars     1.862k i/100ms
         format_html   154.000  i/100ms
Calculating -------------------------------------
     format 50 chars     64.210k (± 4.7%) i/s -    321.504k in   5.018656s
    format 100 chars     45.870k (± 3.5%) i/s -    232.850k in   5.083049s
    format 400 chars     19.681k (± 2.5%) i/s -     98.686k in   5.017752s
         format_html      1.518k (± 6.1%) i/s -      7.700k in   5.093069s
```

| Total chars | Duration |
| ----- | ------- |
| 50  | 0.093 ms |
| 100  | 0.131 ms |
| 400  | 0.3 ms |

### FormatHTML

| Total chars | Duration |
| ----- | ------- |
| 2K  | 4 ms |

## Use cases

* [Ruby China](https://ruby-china.org) - 目前整站的标题都做了自动转换处理。

## Links

* [Chinese Copywriting Guidelines](https://github.com/sparanoid/chinese-copywriting-guidelines)

## License

This project under MIT license.
