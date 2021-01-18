class Public::ComicsController < ApplicationController

  def index
    @comics = Comic.all
  end

  def show
    @comic = Comic.find(params[:id])
    @reviews = @comic.reviews
    @tag = Tag.new
    @tags = @comic.tags
  end

end
