require "./tag/open_tag"
require "./tag/self_close_tag"
require "./tag/custom_tag"
require "html"

class Water
  module Tag
    include Water::OpenTag
    include Water::SelfCloseTag
    include Water::CustomTag

    def doctype(attributes = "html")
      @lines << "<!DOCTYPE #{attributes}>"
      @indents << @current_indent
    end

    def text(content)
      content.to_s.split("\n").each do |line|
        @lines << line
        @indents << @current_indent
      end
    end

    def script(attributes, content)
      @lines << "<script #{attributes}>#{content}</script>"
      @indents << @current_indent
    end

    def script(content)
      @lines << "<script>#{content}</script>"
      @indents << @current_indent
    end

    def style(attributes, content)
      @lines << "<style #{attributes}>#{content}</style>"
      @indents << @current_indent
    end

    def style(content)
      @lines << "<style>#{content}</style>"
      @indents << @current_indent
    end

    def strip_content(content)
      ::HTML.escape(content.to_s)
    end
  end
end
