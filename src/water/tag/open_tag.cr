class Water
  module OpenTag
    macro def_open_tag(tag, alias_name = nil)
      {% real_tag = alias_name || tag %}

      def {{tag.id}}
        @lines << "<{{real_tag.id}}>"
        @indents << @current_indent
        @current_indent += 1
        yield
        @current_indent -= 1
        @lines << "</{{real_tag.id}}>"
        @indents << @current_indent
      end

      def {{tag.id}}(attributes : String)
        @lines << "<{{real_tag.id}} #{attributes}>"
        @indents << @current_indent
        @current_indent += 1
        yield
        @current_indent -= 1
        @lines << "</{{real_tag.id}}>"
        @indents << @current_indent
      end

      def {{tag.id}}(attributes : String, content)
        @lines << "<{{real_tag.id}} #{attributes}>#{strip_content(content)}</{{real_tag.id}}>"
        @indents << @current_indent
      end

      def {{tag.id}}(content)
        @lines << "<{{real_tag.id}}>#{strip_content(content)}</{{real_tag.id}}>"
        @indents << @current_indent
      end
    end

    OPEN_TAGS = %w(a abbr address article aside b bdi body button code details dialog div dd dl dt em fieldset figcaption figure footer form h1 h2 h3 h4 h5 h6 head header html i iframe label li main mark menuitem meter nav ol option pre progress rp rt ruby s section small span strong summary table tbody td textarea th thead time title tr u ul video wbr)
    {% for tag in OPEN_TAGS %}
      def_open_tag {{tag}}
    {% end %}

    def_open_tag "para", "p"
    def_open_tag "select_tag", "select"
  end
end
