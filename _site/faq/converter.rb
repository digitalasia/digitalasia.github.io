require 'yaml'
require 'erubis'
require 'kramdown'

# puts str = "well well well [google](http://google.com)"
# puts Kramdown::Document.new(str).to_html

def process(yml)
  #for each yml's
  # Kramdown::Document.new(str).to_html
  return yml
end

def question
  thing = process(YAML.load_file('./question.yml'))
  template = File.read("./template.html.erb")
  template = Erubis::Eruby.new(template)
  v = template.result(:input => thing)
  File.open("questions.html", 'w') {|f| f.write(v.to_s) }
end

def pricing
  thing = process(YAML.load_file('./pricing.yml'))
  template = File.read("./pricing.html.erb")
  template = Erubis::Eruby.new(template)
  v = template.result(:input => thing)
  File.open("pricing.html", 'w') {|f| f.write(v.to_s) }
end


question
