class Water
  module CustomTag
    macro def_custom_tag(tag)
      def {{tag.id}}
        @lines << "<{{tag.id.gsub(/_/, "-")}}>"
        @indents << @current_indent
        @current_indent += 1
        yield
        @current_indent -= 1
        @lines << "</{{tag.id.gsub(/_/, "-")}}>"
        @indents << @current_indent
      end

      def {{tag.id}}(attributes : String)
        @lines << "<{{tag.id.gsub(/_/, "-")}} #{attributes}>"
        @indents << @current_indent
        @current_indent += 1
        yield
        @current_indent -= 1
        @lines << "</{{tag.id.gsub(/_/, "-")}}>"
        @indents << @current_indent
      end

      def {{tag.id}}(attributes : String, content)
        @lines << "<{{tag.id.gsub(/_/, "-")}} #{attributes}>#{strip_content(content)}</{{tag.id.gsub(/_/, "-")}}>"
        @indents << @current_indent
      end

      def {{tag.id}}(content)
        @lines << "<{{tag.id.gsub(/_/, "-")}}>#{strip_content(content)}</{{tag.id.gsub(/_/, "-")}}>"
        @indents << @current_indent
      end
    end
  end
end
