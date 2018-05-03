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

  def tools
     @tools = Reference.all.where(category: "tools")
    @reference = Reference.new
  end

  def new
    @reference = Reference.new
  end

  def create
      @reference = Reference.new(reference_params)
      url = @reference.url
      html_file = open(url).read
      html_doc = Nokogiri::HTML(html_file)
      @reference.title = html_doc.css("meta[property='og:title']").first.attributes["content"]
      @reference.description = html_doc.css("meta[property='og:description']").first.attributes["content"]
      photo_url = html_doc.css("meta[property='og:image']").first.attributes["content"]
      @reference.image = URI.parse(photo_url)
      if @reference.image[0..3] != "http"
        @reference.image = url + "/" + @reference.image
      end

        # if @reference.image == nil
        #   photo_url = "ux-animations1.png"
        #   @reference.image = URI.parse(photo_url)
        # end
-
    # self.photo = URI.parse(photo_url)
    # self.sav

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



