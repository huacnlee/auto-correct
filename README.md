# auto-space

自动给中文英文之间加入合理的空格

## 例如

```irb
irb> require 'auto-space'
true
irb> "关于 SSH连接的Permission denied (publickey).".auto_space!
关于 SSH 连接的 Permission denied (publickey).
irb> "怎样追踪一个 repo的新feature 和进展呢?".auto_space!
怎样追踪一个 repo 的新 feature 和进展呢?
irb> "vps上sessions不生效，但在本地的环境是ok的，why？".auto_space!
vps 上 sessions 不生效，但在本地的环境是 OK 的，why?
irb> "bootstrap control-group对齐问题".auto_space!
bootstrap control-group 对齐问
```
