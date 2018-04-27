class ReferencesController < ApplicationController
  require 'open-uri'
  require 'nokogiri'
  require 'open_graph_reader'
  before_action :set_reference, only: [:edit, :update, :destroy]

  def articles
     @articles = Reference.all.where(category: "article")
    @reference = Reference.new
  end

  def pages
     @pages = Reference.all.where(category: "page")
    @reference = Reference.new
  end

  def ressources
     @ressources = Reference.all.where(category: "ressource")
    @reference = Reference.new
  end

  def new
    @reference = Reference.new
  end

  def create
      @reference = Reference.new(reference_params)
      url = @reference.url
      html_file = open(url).read
      @og = OpenGraphReader.fetch("http://examples.opengraphprotocol.us/article.html")
      if @og
        object = OpenGraphReader.parse!(html_file)
        @reference.title = object.og.title
        @reference.image = object.og.image.url
        @reference.description = object.og.description
      else
        html_doc = Nokogiri::HTML(html_file)
        @reference.title = html_doc.search('title').text.strip
        @reference.description = html_doc.search('p').text.strip
      end
    if @reference.save
      redirect(@reference)
    else
      render :new
    end
  end

  def edit
  end

  def update
      if @reference.update(reference_params)
      redirect(@reference)
    else
      render :edit
    end
  end

  def destroy
    category = @reference.category
    path = "#{category}s_path"
    @reference.destroy
    redirect_to send(path)
  end
end


private

  def reference_params
    params.require(:reference).permit(:notes, :category, :url)
  end

  def set_reference
    @reference = Reference.find(params[:id])

  end

  def redirect(reference)
    category = @reference.category
    path = "#{category}s_path"
    redirect_to send(path)

  end



