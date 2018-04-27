class PagesController < ApplicationController
  require 'open-uri'
  require 'nokogiri'
  require 'open_graph_reader'
  def home

    url = "https://medium.freecodecamp.org/elegant-patterns-in-modern-javascript-ice-factory-4161859a0eee"
    html_file = open(url).read
    html_doc = Nokogiri::HTML(html_file)
    @title = html_doc.search('title').text.strip
    @metas = html_doc.search('meta')
    @hello = "hola"
    object = OpenGraphReader.parse!(html_file)
    @image = object.og.image.url
    @title = object.og.title
    @url = object.og.title
    @description = object.og.description


  end

  def parsing
    object = OpenGraphReader.fetch("https://medium.freecodecamp.org/elegant-patterns-in-modern-javascript-ice-factory-4161859a0eee")
    object = OpenGraphReader.fetch!("https://medium.freecodecamp.org/elegant-patterns-in-modern-javascript-ice-factory-4161859a0eee")
    object = OpenGraphReader.parse!(html)
    @title = object.og.title
  end
  def bla
    # Returns nil if anything on the object is invalid
    object = OpenGraphReader.fetch("https://medium.freecodecamp.org/elegant-patterns-in-modern-javascript-ice-factory-4161859a0eee")

    # Raises if anything on the object is invalid
    object = OpenGraphReader.fetch!("https://medium.freecodecamp.org/elegant-patterns-in-modern-javascript-ice-factory-4161859a0eee")

    # Read from string
    object = OpenGraphReader.parse(html)
    object = OpenGraphReader.parse!(html)

    # Access by full property name
    object.og.title #=> "5 Held in Plot to Bug Office"

    # Optional properties can return nil
    object.og.description #=> nil

    # Supports properties that are objects themselves
    object.og.image.to_s    #=> "http://examples.opengraphprotocol.us/media/images/50.png"
    object.og.image.content #=> "http://examples.opengraphprotocol.us/media/images/50.png"
    object.og.image.url     #=> "https://examples.opengraphprotocol.us/media/images/50.png"
    object.og.image.width   #=> 50

    # Supports arrays
    object.og.images.first == object.og.image #=> true
    object.article.tags #=> ["Watergate"]
  end
# Custom namespace
class MyNamespace
  include OpenGraphReader::Object

  namespace :my, :namespace # my:namespace
  string :name, required: true # my:namespace:name
  url :url, default: "http://example.org/my_namespace"
  integer :pages, collection: true
  # See the shipped definitions for more examples
end
end



