require "../spec_helper"

describe Water do
  it ".new" do
    str = Water.new do
      {{ run("../read.cr", "spec/fixtures/dummy.water") }}
    end
    str.should eq File.read("spec/fixtures/dummy.html")
  end
end
