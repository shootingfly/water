# Water : HTML in plain Crystal

A library for writing HTML in plain Crystal.

## Installation

1. Add the dependency to your `shard.yml`:

   ```yaml
   dependencies:
     water:
       github: shootingfly/water
   ```

2. Run `shards install`

## Usage

```crystal
require "water"

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
          numbers = [1, 2]
          numbers.each do |index|
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
```

```HTML
<!DOCTYPE html>
<html>
  <head>
    <meta name="viewport" content="width=device-width,initial-scale=1.0">
    <title>This is a tile</title>
    <style>
      h1 { color: red; }
      p { color: green; }
    </style>
    <script>
      alert("Hello");
      system.logger("\n");
    </script>
    <link rel="stylesheet" media="screen">
  </head>
  <body>
    <h1 class="Hello">This is a water file</h1>
    <h2>This is blue</h2>
    <input type="checkbox" checked=false>
    <input type="checkbox" checked=true>
    <input type="checkbox" checked="checked">
    <span id="some-id" class="classname">
      <div id="Hello" class="world world2">
        <span data-some-var="some_var" two-attr="fun">
          and a hello
        </span>
        <span class="deep_nested">text inside of &amp;lt;p&amp;gt</span>
        17925
        text node
        other text node
      </div>
    </span>
    <div class="row">
      <div class="col-md-9">
        <h2 class="right_1">
          <div>
            <span>Hello</span>
          </div>
        </h2>
        <h2 class="right_2">
          <div>
            <span>Hello</span>
          </div>
        </h2>
      </div>
    </div>
    <br>
    &nbsp;&nbsp;&nbsp;&nbsp;
    <hello-world>Hello</hello-world>
    <span>17925</span>
  </body>
</html>
```

## Contributing

1. Fork it (<https://github.com/shootingfly/water/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [Shootingfly](https://github.com/shootingfly) - creator and maintainer
