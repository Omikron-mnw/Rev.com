class Public::TagsController < ApplicationController


  def create
    @comic = Comic.find(params[:comic_id])
    @tag = current_user.tags.new(tag_params)
    @tag.comic_id = @comic.id
    # tag_list = params[:tag_name].split("/")
    if @tag.save
      # @tag.save_tag(tag_list)
      redirect_to comic_path(id: @comic.id)
    else
      render 'public/comics/show'
    end
  end

  def destroy
    @tag = Tag.find(params[:id])
    @comic = Comic.find(params[:comic_id])
    if @tag.destroy
      redirect_to comic_path(id: @comic.id)
    end
  end

  private
  def tag_params
    params.require(:tag).permit(:comic_id, :user_id, :tag_name)
  end

end
