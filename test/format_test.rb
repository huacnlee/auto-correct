require "test_helper"

class FormatTest < ActiveSupport::TestCase
  test "format" do
    cases = {
      "部署到heroku有问题网页不能显示":                                                             "部署到 heroku 有问题网页不能显示",
      "[北京]美企聘site/web大型应用开发高手-Ruby":                                                   "[北京] 美企聘 site/web 大型应用开发高手-Ruby",
      "[成都](团800)招聘Rails工程师":                                                           "[成都](团 800) 招聘 Rails 工程师",
      "Teahour.fm第18期发布":                                                               "Teahour.fm 第 18 期发布",
      "Yes!升级到了Rails 4":                                                                "Yes! 升级到了 Rails 4",
      "记事本,记事本显示阅读次数#149":                                                              "记事本,记事本显示阅读次数 #149",
      "里面用@foo符号的话后面的变量名会被替换成userN":                                                    "里面用 @foo 符号的话后面的变量名会被替换成 userN",
      "WWDC上讲到的Objective C/LLVM改进":                                                     "WWDC 上讲到的 Objective C/LLVM 改进",
      "在Ubuntu11.10 64位系统安装newrelic出错":                                                 "在 Ubuntu11.10 64 位系统安装 newrelic 出错",
      "升级了macOS 10.9 附遇到的Bug概率有0.1%或更少":                                                "升级了 macOS 10.9 附遇到的 Bug 概率有 0.1% 或更少",
      "在做Rails 3.2 Tutorial第Chapter 9.4.2遇到一个问题求助！":                                    "在做 Rails 3.2 Tutorial 第 Chapter 9.4.2 遇到一个问题求助！",
      "发现macOS安装软件新方法：Homebrew":                                                        "发现 macOS 安装软件新方法：Homebrew",
      "without looking like it’s been marked up with tags or formatting instructions.": "without looking like it’s been marked up with tags or formatting instructions.",
      "隔夜SHIBOR报1.5530%，上涨33.80个基点。7天SHIBOR报2.3200%，上涨6.10个基点。3个月SHIBOR报2.8810%，下降1.80个": "隔夜 SHIBOR 报 1.5530%，上涨 33.80 个基点。7 天 SHIBOR 报 2.3200%，上涨 6.10 个基点。3 个月 SHIBOR 报 2.8810%，下降 1.80 个",
      "野村：重申吉利汽车(00175)“买入”评级 上调目标价至17.9港元":                                              "野村：重申吉利汽车 (00175)“买入” 评级 上调目标价至 17.9 港元",
      "小米集团-W 调整目标价为13.5港币": "小米集团-W 调整目标价为 13.5 港币",
    }

    assert_format_cases(cases)
  end

  test "format long" do
    cases = {
      "【野村：重申吉利汽车(00175)“买入”评级 上调目标价至17.9港元】智通财经APP获悉，野村发布报告称，上调吉利汽车(00175)目标价12.58%，由15.9港元升至17.9港元，并维持吉汽为行业首选股，重申对其“买入”评级，坚信吉汽长远可成为行业赢家。 该行称，随着公司销量持续复苏及产品组合改善，预计今年销量可达148万辆，同比升9%，较公司原定目标销量141万辆为高。 该行又称称，上调公司今明两年每股盈利预测各13%及升毛利率0.1个百分点，以反映销量较预期高2%及产品组合改善，主要是由领克品牌带动。公司自去年8月开始已持续投资领克品牌及进行市场推广，带动领克销量环比有所改变，预期今明两年领克将占整体销量的11%及14%。 该行表示，由于低端国产车品牌在欠缺新车款及科技下，行业整合度将提升。另外，公司从去年第二季到12月为止，一直都积极推动经销商去库存，这将有利公司今年利润率复苏。": "【野村：重申吉利汽车 (00175)“买入” 评级 上调目标价至 17.9 港元】智通财经 APP 获悉，野村发布报告称，上调吉利汽车 (00175) 目标价 12.58%，由 15.9 港元升至 17.9 港元，并维持吉汽为行业首选股，重申对其 “买入” 评级，坚信吉汽长远可成为行业赢家。 该行称，随着公司销量持续复苏及产品组合改善，预计今年销量可达 148 万辆，同比升 9%，较公司原定目标销量 141 万辆为高。 该行又称称，上调公司今明两年每股盈利预测各 13% 及升毛利率 0.1 个百分点，以反映销量较预期高 2% 及产品组合改善，主要是由领克品牌带动。公司自去年 8 月开始已持续投资领克品牌及进行市场推广，带动领克销量环比有所改变，预期今明两年领克将占整体销量的 11% 及 14%。 该行表示，由于低端国产车品牌在欠缺新车款及科技下，行业整合度将提升。另外，公司从去年第二季到 12 月为止，一直都积极推动经销商去库存，这将有利公司今年利润率复苏。",
    }
    assert_format_cases(cases)
  end

  test "format for date" do
    cases = {
      "于3月10日开始": "于 3 月 10 日开始",
      "于3月开始":    "于 3 月开始",
      "于2009年开始": "于 2009 年开始",
      "正式发布2013年3月10日-Ruby Saturday活动召集": "正式发布2013年3月10日-Ruby Saturday 活动召集",
      "正式发布2013年3月10号发布":                 "正式发布2013年3月10号发布",
      "2013年12月22号开始出发":                  "2013年12月22号开始出发",
      "12月22号开始出发":                       "12 月 22 号开始出发",
      "22号开始出发":                          "22 号开始出发",
    }
    assert_format_cases(cases)
  end

  test "format for english letter" do
    cases = {
      "长桥LongBridge App下载": "长桥 LongBridge App 下载",
    }
    assert_format_cases(cases)
  end

  test "format for number" do
    cases = {
      "在Ubuntu 11.10 64位系统安装Go出错": "在 Ubuntu 11.10 64 位系统安装 Go 出错",
      "喜欢暗黑2却对 D3不满意的可以看看这个。":     "喜欢暗黑 2 却对 D3 不满意的可以看看这个。",
      "Ruby 2.7版本第3次发布":           "Ruby 2.7 版本第 3 次发布",
    }
    assert_format_cases(cases)
  end

  test "format for speical symbols" do
    cases = {
      "公告:(美股)阿里巴巴[BABA.US]发布2019下半年财报!":           "公告:(美股) 阿里巴巴 [BABA.US] 发布 2019 下半年财报!",
      "消息http://github.com解禁了":                     "消息 http://github.com 解禁了",
      "美股异动|阿帕奇石油(APA.US)盘前涨超15% 在苏里南近海发现大量石油":     "美股异动 | 阿帕奇石油 (APA.US) 盘前涨超 15% 在苏里南近海发现大量石油",
      "美国统计局：美国11月原油出口下降至302.3万桶/日，10月为338.3万桶/日。": "美国统计局：美国 11 月原油出口下降至 302.3 万桶/日，10 月为 338.3 万桶/日。",
    }
    assert_format_cases(cases)
  end

  test "format for fullwidth symbols" do
    cases = {
      "（美股）市场：发布「最新」100消息【BABA.US】“大涨”50%；同比上涨20%！": "（美股）市场：发布「最新」100 消息【BABA.US】“大涨” 50%；同比上涨 20%！",
      "第3季度财报发布看涨看跌？敬请期待。":                          "第 3 季度财报发布看涨看跌？敬请期待。",
    }
    assert_format_cases(cases)
  end
end
