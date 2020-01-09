require "nokogiri"

class AutoCorrect
  class << self
    def format_html(html)
      doc = Nokogiri::HTML(html)
      doc.traverse do |node|
        next unless node.node_type == Nokogiri::XML::Node::TEXT_NODE
        node.content = AutoCorrect.format(node.content)
      end
      doc.css("body").inner_html
    end
  end
end
