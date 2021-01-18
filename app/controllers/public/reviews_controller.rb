class Public::ReviewsController < ApplicationController
  # before_action :set_review

  def new
    @review = Review.new
    @comic = Comic.find(params[:comic_id])
  end

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    if @review.save
      redirect_to comic_path(@review.comic.id), notice: "レビューを追加しました"
    else
      @comic = Comic.find(params[:comic_id])
      render :new
    end
  end

  def index
    @reviews = @comic.reviews
  end

  def show
    @review = Review.find(params[:id])
    @comic = Comic.find_by(id: params[:comic_id])
    @comment = Comment.new
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
    if @review.update(review_params)
      redirect_to comic_review_path(@review.id), notice: "更新しました"
    else
      render :edit
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @comic = Comic.find_by(id: params[:comic_id])
    # binding.pry
    @review.destroy
    redirect_to comic_path(@comic.id), notice: "レビューを削除しました"
  end

  # def search_comic
  #   @tag_list = Tag.all
  #   @tag = Tag.find(params[:id])
  #   @comics = @tag.review.comics
  # end

  # def set_review
  #   @review = Review.find(params[:id])
  # end

  private
  def review_params
    params.require(:review).permit(:comic_id, :user_id, :review, :rate)
  end

end
