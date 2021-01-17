class Public::ComicsController < ApplicationController

  def index
    @comics = Comic.all
  end

  def show
    @comic = Comic.find(params[:id])
    @review = Review.find(params[:id])
    @reviews = @comic.reviews
    @tag = Tag.new
  end

end
