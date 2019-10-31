require "../src/water"

class Water::Page
  def_custom_tag hello_world
end

page = Water::Page.new do
  doctype
  html {
    head {
      meta %(name="viewport" content="width=device-width,initial-scale=1.0")
      title "This is a tile"
      style {
        lm <<-CSS
          h1 { color: red; }
          p { color: green; }
        CSS
      }
      script {
        lm <<-'JAVASCRIPT'
          alert("Hello");
          system.logger("\n");
        JAVASCRIPT
      }
      link %(rel="stylesheet" media="screen")
    }
    body {
      h1 "This is a water file", with: %(class="Hello")
      h2 "This is blue"
      input %(type="checkbox" checked=false)
      input %(type="checkbox" checked=true)
      input %(type="checkbox" checked="checked")
      span %(id="some-id" class="classname") {
        div %(id="Hello" class="world world2") {
          some_var = "hello world haha"
          span %(data-some-var="some_var" two-attr="fun") {
            l "and a hello"
          }
          span "text inside of &lt;p&gt", with: %(class="deep_nested")
          lm <<-HTML
            #{Process.pid}
            text node
            other text node
          HTML
        }
      }
      div %(class="row") {
        div %(class="col-md-9") {
          users = [1, 2]
          users.each_with_index do |index|
            h2 %(class="right_#{index}") {
              div {
                span "Hello"
              }
            }
          end
        }
      }
      br
      l "&nbsp;" * 4
      hello_world "Hello"
      span Process.pid
    }
  }
end
puts page
