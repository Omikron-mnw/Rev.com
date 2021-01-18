class Admin::ComicsController < ApplicationController
  before_action :authenticate_admin!

  def new
    @comic = Comic.new
    @categories = Category.all
  end

  def create
    @comic = Comic.new(comic_params)
    if @comic.save!
      redirect_to admin_comics_path, notice: "コミックを追加しました"
    else
      @categories = Category.all
      render :new
    end
  end

  def index
    @comics = Comic.all
  end

  def show
    @comic = Comic.find(params[:id])
  end

  def edit
    @comic = Comic.find(params[:id])
    @categories = Category.all
  end

  def update
    @comic = Comic.find(params[:id])
    if @comic.update!(comic_params)
      redirect_to admin_comic_path(@comic.id), notice: "更新しました"
    else
      @categories = Category.all
      render :edit
    end
  end

  def destroy
    @comic = Comic.find(params[:id])
    @comic.destroy
    redirect_to admin_comics_path, notice: "削除しました"
  end

  def search
    if params[:keyword]
      @comics = RakutenWebService::Books::.sarch(keyword: params[:keyword])
    end
  end

  private
  def comic_params
    params.require(:comic).permit(
      :category_id,
      :comic_image,
      :title,
      :author,
      :publisher,
      :body
    )
  end

end
