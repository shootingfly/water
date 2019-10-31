module Water
  module SelfCloseTag
    macro def_self_close_tag(tag)
      def {{tag.id}}(attributes = "")
        @lines << "<{{tag.id}}#{strip_attributes(attributes)}>"    
        @indents << @current_indent
      end
    end

    macro def_renamed_self_close_tag(tag, alias_name)
      def {{tag.id}}(attributes = "")
        @lines << "<{{tag.id}}#{strip_attributes(attributes)}>"    
        @indents << @current_indent
      end
    end

    SELF_CLOSE_TAGS = %w(area base br col embed hr img input keygen link menuitem meta param source track wbr)
    {% for tag in SELF_CLOSE_TAGS %}
      def_self_close_tag {{tag}}
    {% end %}
  end
end
