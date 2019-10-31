require "../spec_helper"

describe Water do
  it ".embed" do
    io = IO::Memory.new
    Water.embed("spec/fixtures/kilt.water", io).should be io
    io.to_s.should eq %(<span>Hello World!</span>)
  end
end
