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

[![Gem Version](https://badge.fury.io/rb/auto-correct.png)](https://rubygems.org/gems/auto-correct) [![Build
Status](https://secure.travis-ci.org/huacnlee/auto-correct.png?branch=master&.png)](http://travis-ci.org/huacnlee/auto-correct)

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

## 配置

大多数情况，你不需要任何配置，如果你需要自定义，可以参考：

默认策略：

AutoCorrect::AutoSpace::EnglishWord
AutoCorrect::AutoSpace::Number
AutoCorrect::AutoSpace::SpecialSymbol
AutoCorrect::AutoSpace::Date

其它策略：

AutoCorrect::AutoSpace::FullwidthPunctuation


如果你想自定义策略：

```ruby
Class NewStragory < AutoCorrect::AutoSpace::Base
  between /Ruby/, /China/
end

AutoCorrect.configure do |config|
  config.auto_space_stragories += [NewStragory]
end

"RubyChina 是最好的 Ruby 中文社区".auto_correct!  #=> "Ruby China 是最好的 Ruby 中文社区"
```


## ActiveModel 的 changed? 相关提示

由于 auto_correct 是直接修改原始变量值的，你可能会遇到由于没有引发 `ActiveModel::Dirty` 的相关 callback 事件而导致下面这种场景 ActiveModel 不会将相关的字段写入到数据库。

比如下面的情况：

```ruby
class Topic < ActiveRecord::Base
  before_save do
    self.title.auto_correct!
  end
end
```

正确的方式：

```ruby
class Topic < ActiveRecord::Base
  before_save do
    # 引发 ActiveModel::Dirty 的 change
    self.title_will_change!
    self.title.auto_correct!
  end
end
```

具体请参见 [ActiveModel::Dirty 的文档](http://api.rubyonrails.org/classes/ActiveModel/Dirty.html)

## 性能

详见 Rakefile

```
$ rake benchmark
       user     system      total        real
auto_correct!
 100 times  0.000000   0.000000   0.000000 (  0.004397)
 1000 times  0.030000   0.000000   0.030000 (  0.031084)
 10000 times  0.330000   0.010000   0.340000 (  0.335932)

auto_space!
 100 times  0.010000   0.000000   0.010000 (  0.002938)
 1000 times  0.020000   0.000000   0.020000 (  0.023121)
 10000 times  0.210000   0.000000   0.210000 (  0.221530)
```

## TODO

* 'Foo'的"Bar" -> 'Foo' 的 "Bar"
* 什么,时候 -> 什么, 时候 -> 什么，时候

## 应用案例

* [Ruby China](http://ruby-china.org) - 目前整站的标题都做了自动转换处理。

## 参考内容

* [Chinese Copywriting Guidelines](https://github.com/sparanoid/chinese-copywriting-guidelines)
