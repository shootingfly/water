require "./water/tag"
require "./water/kilts/embed"
require "./water/version"

class Water
  include Water::Tag

  property lines : Array(String)
  property indents : Array(Int32)
  property current_indent : Int32

  def initialize(@lines = [] of String, @indents = [] of Int32, @current_indent = 0)
  end

  def self.new
    builder = new
    with builder yield
    render_string(builder)
  end

  def self.render_string(builder)
    String.build do |str|
      builder.lines.each_with_index do |line, index|
        str << "  " * builder.indents[index]
        str << line
        str << "\n"
      end
      str.chomp!(10) # Remove last newline "\n"
    end
  end
end
