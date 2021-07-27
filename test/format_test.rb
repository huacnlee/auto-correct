require "test_helper"

class FormatTest < ActiveSupport::TestCase
  test "format" do
    cases = {
      "部署到heroku有问题网页不能显示": "部署到 heroku 有问题网页不能显示",
      "[北京]美企聘site/web大型应用开发高手-Ruby": "[北京] 美企聘 site/web 大型应用开发高手-Ruby",
      "[成都](团800)招聘Rails工程师": "[成都](团 800) 招聘 Rails 工程师",
      "Teahour.fm\u7B2C18\u671F\u53D1\u5E03": "Teahour.fm 第 18 期发布",
      "Yes!\u5347\u7EA7\u5230\u4E86Rails 4": "Yes! 升级到了 Rails 4",
      "记事本,记事本显示阅读次数#149": "记事本,记事本显示阅读次数 #149",
      "里面用@foo符号的话后面的变量名会被替换成userN": "里面用 @foo 符号的话后面的变量名会被替换成 userN",
      "WWDC\u4E0A\u8BB2\u5230\u7684Objective C/LLVM\u6539\u8FDB": "WWDC 上讲到的 Objective C/LLVM 改进",
      "在Ubuntu11.10 64位系统安装newrelic出错": "在 Ubuntu11.10 64 位系统安装 newrelic 出错",
      "升级了macOS 10.9 附遇到的Bug概率有0.1%或更少": "升级了 macOS 10.9 附遇到的 Bug 概率有 0.1% 或更少",
      "在做Rails 3.2 Tutorial第Chapter 9.4.2遇到一个问题求助！": "在做 Rails 3.2 Tutorial 第 Chapter 9.4.2 遇到一个问题求助！",
      "发现macOS安装软件新方法：Homebrew": "发现 macOS 安装软件新方法：Homebrew",
      "without looking like it\u2019s been marked up with tags or formatting instructions.": "without looking like it’s been marked up with tags or formatting instructions.",
      "隔夜SHIBOR报1.5530%，上涨33.80个基点。7天SHIBOR报2.3200%，上涨6.10个基点。3个月SHIBOR报2.8810%，下降1.80个": "隔夜 SHIBOR 报 1.5530%，上涨 33.80 个基点。7 天 SHIBOR 报 2.3200%，上涨 6.10 个基点。3 个月 SHIBOR 报 2.8810%，下降 1.80 个",
      "野村：重申吉利汽车(00175)“买入”评级 上调目标价至17.9港元": "野村：重申吉利汽车 (00175)“买入” 评级 上调目标价至 17.9 港元",
      "小米集团-W 调整目标价为13.5港币": "小米集团-W 调整目标价为 13.5 港币",
      "（路透社）-预计全年净亏损约1.3亿港元*预期因出售汽车": "（路透社）- 预计全年净亏损约 1.3 亿港元 * 预期因出售汽车"
    }

    assert_format_cases(cases)
  end

  test "format long" do
    cases = {
      "【野村：重申吉利汽车(00175)“买入”评级 上调目标价至17.9港元】智通财经APP获悉，野村发布报告称，上调吉利汽车(00175)目标价12.58%，由15.9港元升至17.9港元，并维持吉汽为行业首选股，重申对其“买入”评级，坚信吉汽长远可成为行业赢家。 该行称，随着公司销量持续复苏及产品组合改善，预计今年销量可达148万辆，同比升9%，较公司原定目标销量141万辆为高。 该行又称称，上调公司今明两年每股盈利预测各13%及升毛利率0.1个百分点，以反映销量较预期高2%及产品组合改善，主要是由领克品牌带动。公司自去年8月开始已持续投资领克品牌及进行市场推广，带动领克销量环比有所改变，预期今明两年领克将占整体销量的11%及14%。 该行表示，由于低端国产车品牌在欠缺新车款及科技下，行业整合度将提升。另外，公司从去年第二季到12月为止，一直都积极推动经销商去库存，这将有利公司今年利润率复苏。": "【野村：重申吉利汽车 (00175)“买入” 评级 上调目标价至 17.9 港元】智通财经 APP 获悉，野村发布报告称，上调吉利汽车 (00175) 目标价 12.58%，由 15.9 港元升至 17.9 港元，并维持吉汽为行业首选股，重申对其 “买入” 评级，坚信吉汽长远可成为行业赢家。 该行称，随着公司销量持续复苏及产品组合改善，预计今年销量可达 148 万辆，同比升 9%，较公司原定目标销量 141 万辆为高。 该行又称称，上调公司今明两年每股盈利预测各 13% 及升毛利率 0.1 个百分点，以反映销量较预期高 2% 及产品组合改善，主要是由领克品牌带动。公司自去年 8 月开始已持续投资领克品牌及进行市场推广，带动领克销量环比有所改变，预期今明两年领克将占整体销量的 11% 及 14%。 该行表示，由于低端国产车品牌在欠缺新车款及科技下，行业整合度将提升。另外，公司从去年第二季到 12 月为止，一直都积极推动经销商去库存，这将有利公司今年利润率复苏。"
    }
    assert_format_cases(cases)
  end

  test "format for date" do
    cases = {
      "于3月10日开始": "于 3 月 10 日开始",
      "于3月开始": "于 3 月开始",
      "于2009年开始": "于 2009 年开始",
      "正式发布2013年3月10日-Ruby Saturday活动召集": "正式发布 2013 年 3 月 10 日-Ruby Saturday 活动召集",
      "正式发布2013年3月10号发布": "正式发布 2013 年 3 月 10 号发布",
      "2013\u5E7412\u670822\u53F7\u5F00\u59CB\u51FA\u53D1": "2013 年 12 月 22 号开始出发",
      "12\u670822\u53F7\u5F00\u59CB\u51FA\u53D1": "12 月 22 号开始出发",
      "22\u53F7\u5F00\u59CB\u51FA\u53D1": "22 号开始出发"
    }
    assert_format_cases(cases)
  end

  test "format for english letter" do
    cases = {
      "长桥LongBridge App下载": "长桥 LongBridge App 下载"
    }
    assert_format_cases(cases)
  end

  test "format for number" do
    cases = {
      "在Ubuntu 11.10 64位系统安装Go出错": "在 Ubuntu 11.10 64 位系统安装 Go 出错",
      "喜欢暗黑2却对 D3不满意的可以看看这个。": "喜欢暗黑 2 却对 D3 不满意的可以看看这个。",
      "Ruby 2.7\u7248\u672C\u7B2C3\u6B21\u53D1\u5E03": "Ruby 2.7 版本第 3 次发布"
    }
    assert_format_cases(cases)
  end

  test "format for speical symbols" do
    cases = {
      "公告:(美股)阿里巴巴[BABA.US]发布2019下半年财报!": "公告:(美股) 阿里巴巴 [BABA.US] 发布 2019 下半年财报!",
      "消息http://github.com解禁了": "消息 http://github.com 解禁了",
      "美股异动|阿帕奇石油(APA.US)盘前涨超15% 在苏里南近海发现大量石油": "美股异动 | 阿帕奇石油 (APA.US) 盘前涨超 15% 在苏里南近海发现大量石油",
      "美国统计局：美国11月原油出口下降至302.3万桶/日，10月为338.3万桶/日。": "美国统计局：美国 11 月原油出口下降至 302.3 万桶/日，10 月为 338.3 万桶/日。"
    }
    assert_format_cases(cases)
  end

  test "format for fullwidth symbols" do
    cases = {
      "（美股）市场：发布「最新」100消息【BABA.US】“大涨”50%；同比上涨20%！": "（美股）市场：发布「最新」100 消息【BABA.US】“大涨” 50%；同比上涨 20%！",
      "第3季度财报发布看涨看跌？敬请期待。": "第 3 季度财报发布看涨看跌？敬请期待。"
    }
    assert_format_cases(cases)
  end

  test "format for dash with hans" do
    cases = {
      "第3季度-财报发布看涨看跌？敬请期待。": "第 3 季度 - 财报发布看涨看跌？敬请期待。",
      "腾讯-ADR-已发行": "腾讯-ADR-已发行",
      "（腾讯）-发布-（新版）本微信": "（腾讯）- 发布 -（新版）本微信",
      "【腾讯】-发布-【新版】本微信": "【腾讯】- 发布 -【新版】本微信",
      "「腾讯」-发布-「新版」本微信": "「腾讯」- 发布 -「新版」本微信",
      "《腾讯》-发布-《新版》本微信": "《腾讯》- 发布 -《新版》本微信",
      "“腾讯”-发布-“新版”本微信": "“腾讯” - 发布 - “新版” 本微信",
      "‘腾讯’-发布-‘新版’本微信": "‘腾讯’ - 发布 - ‘新版’ 本微信"
    }
    assert_format_cases(cases)
  end

  test "format for dash with cjk" do
    cases = {
      "全世界已有数百家公司在生产环境中使用Rust，以达到快速、跨平台、低资源占用的目的。很多著名且受欢迎的软件，例如Firefox、 Dropbox 和 Cloudflare都在使用Rust。": "全世界已有数百家公司在生产环境中使用 Rust，以达到快速、跨平台、低资源占用的目的。很多著名且受欢迎的软件，例如 Firefox、 Dropbox 和 Cloudflare 都在使用 Rust。",
      "現今全世界上百家公司企業為了尋求快速、節約資源而且能跨平台的解決辦法，都已在正式環境中使用Rust。許多耳熟能詳且受歡迎的軟體，諸如Firefox、Dropbox以及Cloudflare都在使用Rust。": "現今全世界上百家公司企業為了尋求快速、節約資源而且能跨平台的解決辦法，都已在正式環境中使用 Rust。許多耳熟能詳且受歡迎的軟體，諸如 Firefox、Dropbox 以及 Cloudflare 都在使用 Rust。",
      "既に、世界中の数百という企業がRustを採用し、高速で低リソースのクロスプラットフォームソリューションを実現しています。皆さんがご存じで愛用しているソフトウェア、例えばFirefox、DropboxやCloudflareも、Rustを採用しています。": "既に、世界中の数百という企業が Rust を採用し、高速で低リソースのクロスプラットフォームソリューションを実現しています。皆さんがご存じで愛用しているソフトウェア、例えば Firefox、Dropbox や Cloudflare も、Rust を採用しています。",
      "전 세계 수백 개의 회사가 프로덕션 환경에서 Rust를 사용하여 빠르고, 크로스 플랫폼 및 낮은 리소스 사용량을 달성했습니다. Firefox, Dropbox 및 Cloudflare와 같이 잘 알려져 있고 널리 사용되는 많은 소프트웨어가 Rust를 사용하고 있습니다.": "전 세계 수백 개의 회사가 프로덕션 환경에서 Rust 를 사용하여 빠르고, 크로스 플랫폼 및 낮은 리소스 사용량을 달성했습니다. Firefox, Dropbox 및 Cloudflare 와 같이 잘 알려져 있고 널리 사용되는 많은 소프트웨어가 Rust 를 사용하고 있습니다."
    }
    assert_format_cases(cases)
  end
end
