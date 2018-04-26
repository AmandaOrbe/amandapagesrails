class ReferencesController < ApplicationController
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
    if @reference.save
      redirect_to references_articles_path
    else
      render :new
    end
  end

  def edit
  end

  def update
      if @reference.update(reference_params)
      redirect_to references_path(@reference)
    else
      render :edit
    end
  end

  def destroy
      @reference.destroy
    redirect_to references_path
  end
end


private

  def reference_params
    params.require(:reference).permit(:title, :date, :headlines, :author, :url)
  end

  def set_reference
    @reference = Reference.find(params[:id])

  end

