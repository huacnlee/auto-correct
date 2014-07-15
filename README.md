# auto-correct

自动纠正中文英文混排是一些不够好的写法，纠正错误的名词大小写。

Before

```
[经验之谈]转行做ruby程序员的8个月, mysql 经验
```

After

```
[经验之谈] 转行做 Ruby 程序员的 8 个月, MySQL 经验
```

[![Gem Version](https://badge.fury.io/rb/auto-space.png)](https://rubygems.org/gems/auto-space) [![Build
Status](https://secure.travis-ci.org/huacnlee/auto-space.png?branch=master&.png)](http://travis-ci.org/huacnlee/auto-space)

## 使用说明

```irb
irb> require 'auto-correct'
true

irb> "关于ssh连接的Permission denied(publickey).".auto_correct!
关于 SSH 连接的 Permission denied (publickey).

irb> "怎样追踪一个repo的新feature 和进展呢?".auto_correct!
怎样追踪一个 repo 的新 feature 和进展呢?

irb> "vps上sessions不生效，但在本地的环境是ok的，why？".auto_correct!
VPS 上 sessions 不生效，但在本地的环境是 OK 的，why?

irb> "bootstrap control-group对齐问题".auto_correct!
Bootstrap control-group 对齐问
```

## 性能

详见 Rakefile

```
$ rake benchmark
       user     system      total        real
100 times  0.000000   0.000000   0.000000 (  0.002223)
1000 times  0.030000   0.000000   0.030000 (  0.024711)
10000 times  0.230000   0.000000   0.230000 (  0.240850)
```

## TODO

* 'Foo'的"Bar" -> 'Foo' 的 "Bar"
* 什么,时候 -> 什么, 时候 -> 什么，时候

## 应用案例

* [Ruby China](http://ruby-china.org) - 目前整站的标题都做了自动转换处理。

## 参考内容

* [Chinese Copywriting Guidelines](https://github.com/sparanoid/chinese-copywriting-guidelines)
