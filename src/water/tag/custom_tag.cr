module Water
  module CustomTag
    macro def_custom_tag(tag)
      def {{tag.id}}(attributes = "")
        @lines << "<{{tag.id.gsub(/_/, "-")}}#{strip_attributes(attributes)}>"
        @indents << @current_indent
        @current_indent += 1
        yield
        @current_indent -= 1
        @lines << "</{{tag.id.gsub(/_/, "-")}}>"
        @indents << @current_indent
      end

      def {{tag.id}}(content, with attributes = "")
        @lines << "<{{tag.id.gsub(/_/, "-")}}#{strip_attributes(attributes)}>#{strip_content(content)}</{{tag.id.gsub(/_/, "-")}}>"
        @indents << @current_indent
      end
    end
  end
end
