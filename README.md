# auto-correct

Automatically add spaces between Chinese and English words.

中文英文混排自动纠正补充空格，此方式已在 Ruby China 使用多年，支持 HTML 处理。

[![Gem Version](https://badge.fury.io/rb/auto-correct.svg)](https://rubygems.org/gems/auto-correct) [![Build
Status](https://api.travis-ci.org/huacnlee/auto-correct.svg?branch=master&.svg)](http://travis-ci.org/huacnlee/auto-correct) [![Code Climate](https://codeclimate.com/github/huacnlee/auto-correct/badges/gpa.svg)](https://codeclimate.com/github/huacnlee/auto-correct)


## Other implements

- [auto-correct](https://github.com/huacnlee/auto-correct) - Ruby
- [go-auto-correct](https://github.com/huacnlee/go-auto-correct) - Go

## Features

- Auto add spacings between Chinese and English words.
- HTML content support.

## Usage

`AutoCorrect.format` method for plain text.

```ruby
AutoCorrect.format("关于ssh连接的Permission denied(publickey).")
# => "关于 SSH 连接的 Permission denied (publickey)."

AutoCorrect.format("怎样追踪一个repo的新feature 和进展呢?")
# => "怎样追踪一个 repo 的新 feature 和进展呢?"

AutoCorrect.format("vps上sessions不生效，但在本地的环境是ok的，why？")
# => "VPS 上 sessions 不生效，但在本地的环境是 OK 的，why?"

AutoCorrect.format("bootstrap control-group对齐问题")
# => "Bootstrap control-group 对齐问"
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
