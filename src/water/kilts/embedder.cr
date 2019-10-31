puts <<-Crystal
  Water::Page.new do
    #{File.read(ARGV[0])}
  end
Crystal
