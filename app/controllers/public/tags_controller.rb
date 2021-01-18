class Public::TagsController < ApplicationController


  # def create
  #   @review = Rview.find(params[:review_id])
  #   @tag = Tag.new(tag_params)
  #   @tag.comic_id = comic.id
  #   tag_list = params[:tag_nwme].split(",")
  #   if @tag.save(tag_list)
  #     redirec_to comic_path(@comic.id)
  #   else
  #     render 'comics/:comic_id/reviews/new'
  #   end
  # end

  # def destroy
  #   @tag = Tag.find(params[:id])
  #   if @tag.destroy
  #     redirec_to comic_path(@comic.id)
  #   end
  # end

  # private
  # def tag_params
  #   params.require(:tag).permit(:comic_id, :user_id, :tag_name)
  # end

end
