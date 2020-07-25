module Water
  module OpenTag
    macro def_open_tag(tag)
      def {{tag.id}}(attributes = "")
        @lines << "<{{tag.id}}#{strip_attributes(attributes)}>"
        @indents << @current_indent
        @current_indent += 1
        yield
        @current_indent -= 1
        @lines << "</{{tag.id}}>"
        @indents << @current_indent
      end

      def {{tag.id}}(attributes, content)
        @lines << "<{{tag.id}}#{strip_attributes(attributes)}>#{strip_content(content)}</{{tag.id}}>"
        @indents << @current_indent
      end

      def {{tag.id}}(content)
        @lines << "<{{tag.id}}>#{strip_content(content)}</{{tag.id}}>"
        @indents << @current_indent
      end
    end

    OPEN_TAGS = %w(a abbr address article aside b bdi body button code details dialog div dd dl dt em fieldset figcaption figure footer form h1 h2 h3 h4 h5 h6 head header html i iframe label li main mark menuitem meter nav ol option pre progress rp rt ruby s section small span strong summary table tbody td textarea th thead time title tr u ul video wbr)
    {% for tag in OPEN_TAGS %}
      def_open_tag {{tag}}
    {% end %}

    macro def_renamed_open_tag(tag, alias_name)
      def {{alias_name.id}}(attributes = "")
        @lines << "<{{tag.id}}#{strip_attributes(attributes)}>"
        @indents << @current_indent
        @current_indent += 1
        yield
        @current_indent -= 1
        @lines << "</{{tag.id}}>"
        @indents << @current_indent
      end

      def {{alias_name.id}}(attributes, content)
        @lines << "<{{tag.id}}#{strip_attributes(attributes)}>#{strip_content(content)}</{{tag.id}}>"
        @indents << @current_indent
      end

      def {{alias_name.id}}(content)
        @lines << "<{{tag.id}}>#{strip_content(content)}</{{tag.id}}>"
        @indents << @current_indent
      end
    end

    def_renamed_open_tag "p", "para"
    def_renamed_open_tag "select", "select_tag"
  end
end
