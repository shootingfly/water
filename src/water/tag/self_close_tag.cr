class Water
  module SelfCloseTag
    macro def_self_close_tag(tag)
      def {{tag.id}}
        @lines << "<{{tag.id}}>"
        @indents << @current_indent
      end

      def {{tag.id}}(attributes : String)
        @lines << "<{{tag.id}} #{attributes}>"
        @indents << @current_indent
      end
    end

    SELF_CLOSE_TAGS = %w(area base br col embed hr img input keygen link menuitem meta param source track wbr)
    {% for tag in SELF_CLOSE_TAGS %}
      def_self_close_tag {{tag}}
    {% end %}
  end
end
