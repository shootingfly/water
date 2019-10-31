require "./tag/open_tag"
require "./tag/self_close_tag"
require "./tag/custom_tag"
require "html"

module Water
  module Tag
    include Water::OpenTag
    include Water::SelfCloseTag
    include Water::CustomTag

    def doctype(attributes = "html")
      @lines << "<!DOCTYPE #{attributes}>"
      @indents << @current_indent
    end

    def l(content)
      @lines << content.to_s
      @indents << @current_indent
    end

    def lm(content : String)
      content.split("\n").each do |line|
        @lines << line
        @indents << @current_indent - 1
      end
    end

    def strip_attributes(attributes : String)
      attributes == "" ? "" : " #{attributes}"
    end

    def strip_content(content)
      ::HTML.escape(content.to_s)
    end
  end
end
